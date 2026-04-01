#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_ZIP="${ROOT_DIR}/YimMenuV2-enhanced.zip"
SRC_DIR="${ROOT_DIR}/YimMenuV2-enhanced"
BUILD_DIR="${SRC_DIR}/build"

if [[ ! -f "${SRC_ZIP}" ]]; then
  echo "[ERROR] Missing source archive: ${SRC_ZIP}" >&2
  exit 1
fi

if ! command -v cmake >/dev/null 2>&1; then
  echo "[ERROR] cmake is required but not found in PATH" >&2
  exit 1
fi

if ! command -v ninja >/dev/null 2>&1; then
  echo "[ERROR] ninja is required but not found in PATH" >&2
  exit 1
fi

if ! command -v zig >/dev/null 2>&1; then
  cat >&2 <<'MSG'
[ERROR] zig is required for cross-compiling a Windows DLL in this project.
Install zig first, then rerun this script.
MSG
  exit 1
fi

echo "[INFO] Extracting source archive..."
unzip -o "${SRC_ZIP}" -d "${ROOT_DIR}" >/dev/null

echo "[INFO] Configuring project..."
cmake -DUSE_CROSSCOMPILER=Zig -DCMAKE_BUILD_TYPE=RelWithDebInfo -S "${SRC_DIR}" -B "${BUILD_DIR}" -G Ninja

echo "[INFO] Building DLL..."
cmake --build "${BUILD_DIR}" --config RelWithDebInfo --target YimMenuV2 --

OUTPUT_DLL="${BUILD_DIR}/libYimMenuV2.dll"
if [[ -f "${OUTPUT_DLL}" ]]; then
  echo "[OK] DLL built: ${OUTPUT_DLL}"
else
  echo "[ERROR] Build finished but DLL not found at: ${OUTPUT_DLL}" >&2
  exit 2
fi
