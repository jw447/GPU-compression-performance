#!/usr/bin/env bash
set -euo pipefail

PREFIX=""
CUDA_ARCH="89"
JOBS="${JOBS:-$(getconf _NPROCESSORS_ONLN 2>/dev/null || echo 8)}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$ROOT_DIR/third_party"

usage() {
  cat <<'EOF'
Usage: install_compressors.sh --prefix <install-root> [--cuda-arch <arch>] [--jobs <n>]

This script clones and builds a baseline set of GPU-capable scientific lossy compressors:
  - cuSZ
  - cuSZp
  - FZ-GPU
  - zfp (CUDA enabled)
  - MGARD (optional best-effort)

Examples:
  bash scripts/install_compressors.sh --prefix "$PWD/../deps" --cuda-arch 89
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --prefix)
      PREFIX="$2"
      shift 2
      ;;
    --cuda-arch)
      CUDA_ARCH="$2"
      shift 2
      ;;
    --jobs)
      JOBS="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$PREFIX" ]]; then
  echo "--prefix is required" >&2
  usage
  exit 1
fi

mkdir -p "$PREFIX/src" "$PREFIX/build" "$PREFIX/install" "$SRC_DIR"

clone_or_update() {
  local url="$1"
  local dir="$2"
  if [[ -d "$dir/.git" ]]; then
    git -C "$dir" fetch --all --tags
    git -C "$dir" pull --ff-only
  else
    git clone --depth 1 "$url" "$dir"
  fi
}

configure_build_install() {
  local src="$1"
  local build="$2"
  shift 2
  cmake -S "$src" -B "$build" "$@"
  cmake --build "$build" -j"$JOBS"
  cmake --install "$build"
}

patch_cuszp_arches() {
  local cmake_file="$1/CMakeLists.txt"
  if [[ ! -f "$cmake_file" ]]; then
    echo "cuSZp CMakeLists.txt not found at $cmake_file" >&2
    return 1
  fi

  python3 - "$cmake_file" "$CUDA_ARCH" <<'PY'
import pathlib
import re
import sys

path = pathlib.Path(sys.argv[1])
arch = sys.argv[2]
text = path.read_text()
pattern = r"set\(CMAKE_CUDA_ARCHITECTURES\s+[^\)]*\)"
replacement = f"set(CMAKE_CUDA_ARCHITECTURES {arch})"
new_text, n = re.subn(pattern, replacement, text, count=1)
if n != 1:
    raise SystemExit(f"Failed to patch CMAKE_CUDA_ARCHITECTURES in {path}")
path.write_text(new_text)
print(f"Patched {path} to use CUDA arch {arch}")
PY
}

#echo "[1/5] cuSZ"
#clone_or_update https://github.com/szcompressor/cuSZ.git "$SRC_DIR/cuSZ"
#configure_build_install \
#  "$SRC_DIR/cuSZ" \
#  "$PREFIX/build/cuSZ" \
#  -DCMAKE_BUILD_TYPE=Release \
#  -DCMAKE_INSTALL_PREFIX="$PREFIX/install/cuSZ" \
#  -DCMAKE_CUDA_ARCHITECTURES="$CUDA_ARCH"

echo "[2/5] cuSZp"
clone_or_update https://github.com/szcompressor/cuSZp.git "$SRC_DIR/cuSZp"
patch_cuszp_arches "$SRC_DIR/cuSZp"
configure_build_install \
  "$SRC_DIR/cuSZp" \
  "$PREFIX/build/cuSZp" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="$PREFIX/install/cuSZp" \
  -DCMAKE_CUDA_ARCHITECTURES="$CUDA_ARCH"

#echo "[3/5] FZ-GPU"
#clone_or_update https://github.com/szcompressor/FZ-GPU.git "$SRC_DIR/FZ-GPU"
#make -C "$SRC_DIR/FZ-GPU" -j"$JOBS"
#mkdir -p "$PREFIX/install/FZ-GPU/bin"
#cp "$SRC_DIR/FZ-GPU/fz-gpu" "$PREFIX/install/FZ-GPU/bin/"
#
#echo "[4/5] zfp"
#clone_or_update https://github.com/LLNL/zfp.git "$SRC_DIR/zfp"
#configure_build_install \
#  "$SRC_DIR/zfp" \
#  "$PREFIX/build/zfp" \
#  -DCMAKE_BUILD_TYPE=Release \
#  -DCMAKE_INSTALL_PREFIX="$PREFIX/install/zfp" \
#  -DCMAKE_CUDA_ARCHITECTURES="$CUDA_ARCH" \
#  -DZFP_WITH_CUDA=ON \
#  -DBUILD_TESTING=OFF
#
#echo "[5/5] MGARD (best effort)"
#clone_or_update https://github.com/CODARcode/MGARD.git "$SRC_DIR/MGARD"
#if cmake -S "$SRC_DIR/MGARD" -B "$PREFIX/build/MGARD" \
#  -DCMAKE_BUILD_TYPE=Release \
#  -DCMAKE_INSTALL_PREFIX="$PREFIX/install/MGARD" \
#  -DCMAKE_CUDA_ARCHITECTURES="$CUDA_ARCH" \
#  -DMGARD_ENABLE_CUDA=ON \
#  -DMGARD_ENABLE_LEGACY_CUDA=ON >/dev/null 2>&1; then
#  cmake --build "$PREFIX/build/MGARD" -j"$JOBS" || true
#  cmake --install "$PREFIX/build/MGARD" || true
#else
#  echo "MGARD configure step did not match this local checkout; inspect $SRC_DIR/MGARD for the right CMake options."
#fi

cat <<EOF
Install complete.
Artifacts:
  sources: $SRC_DIR
  builds : $PREFIX/build
  install: $PREFIX/install

Next step:
  Edit Experiment/core_code/configs/benchmark_matrix.example.json with the actual dataset paths and discovered binary names.
EOF
