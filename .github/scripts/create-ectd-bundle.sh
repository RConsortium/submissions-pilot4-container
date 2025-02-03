#!/usr/bin/env bash
set -euo pipefail # strict mode
readonly SCRIPT_NAME="$(basename "$0")"
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
function l { # Log a message to the terminal.
    echo
    echo -e "[$SCRIPT_NAME] ${1:-}"
}

# Define file and directory paths
APP_SOURCE_DIR=submissions-pilot2
DOCKER_SOURCE_FILE=Dockerfile
ENTRYPOINT_FILE=entrypoint.R
ECTD_BUNDLE_DIR=submissions-pilot4-container-to-fda
ECTD_LETTER_DIR=${ECTD_BUNDLE_DIR}/m1/us
ECTD_DATASETS_DIR=${ECTD_BUNDLE_DIR}/m5/datasets/rconsortiumpilot4container/analysis/adam/datasets
ECTD_PROGRAMS_DIR=${ECTD_BUNDLE_DIR}/m5/datasets/rconsortiumpilot4container/analysis/adam/programs
ADRG_DESTINATION_DIR=${ECTD_DATASETS_DIR}
README_DESTINATION_DIR=${ECTD_BUNDLE_DIR}
LETTER_DESTINATION_DIR=${ECTD_LETTER_DIR}
ADRG_SOURCE_DIR=adrg
ADRG_SOURCE_FILE=adrg-quarto-pdf.pdf
ADRG_DEST_FILE=adrg.pdf
README_SOURCE_DIR=ectd_readme
README_SOURCE_FILE=README.md
README_DEST_FILE=README.md
LETTER_SOURCE_DIR=cover-letter
LETTER_SOURCE_FILE=cover-letter.pdf
LETTER_DEST_FILE=cover-letter.pdf
DATASETS_SOURCE_DIR=datasets

# Create directory structure for ectd bundle
mkdir -p "${ECTD_LETTER_DIR}"
mkdir -p "${ECTD_PROGRAMS_DIR}"
#mkdir -p "${ECTD_DATASETS_DIR}"

# Copy ADRG (PDF version)
if [ -f "${ADRG_SOURCE_DIR}/${ADRG_SOURCE_FILE}" ]; then
  echo "Copying ${ADRG_SOURCE_DIR}/${ADRG_SOURCE_FILE}"
  if [ ! -d "$ADRG_DESTINATION_DIR" ]; then
    echo "Create new directory ${ADRG_DESTINATION_DIR}"
    mkdir -p "${ADRG_DESTINATION_DIR}"
  fi
  cp "${ADRG_SOURCE_DIR}/${ADRG_SOURCE_FILE}" "${ADRG_DESTINATION_DIR}/${ADRG_DEST_FILE}"
fi

echo "ADRG copied to ${ADRG_DESTINATION_DIR}/${ADRG_DEST_FILE}"

# Copy README for ectd repository
if [ -f "${README_SOURCE_DIR}/${README_SOURCE_FILE}" ]; then
  echo "Copying ${README_SOURCE_DIR}/${README_SOURCE_FILE}"
  if [ ! -d "$README_DESTINATION_DIR" ]; then
    echo "Create new directory ${README_DESTINATION_DIR}"
    mkdir -p "${README_DESTINATION_DIR}"
  fi
  cp "${README_SOURCE_DIR}/${README_SOURCE_FILE}" "${README_DESTINATION_DIR}/${README_DEST_FILE}"
fi

echo "README copied to ${README_DESTINATION_DIR}/${README_DEST_FILE}"

# Copy cover letter (PDF version)
if [ -f "${LETTER_SOURCE_DIR}/${LETTER_SOURCE_FILE}" ]; then
  echo "Copying ${LETTER_SOURCE_DIR}/${LETTER_SOURCE_FILE}"
  if [ ! -d "$LETTER_DESTINATION_DIR" ]; then
    echo "Create new directory ${LETTER_DESTINATION_DIR}"
    mkdir -p "${LETTER_DESTINATION_DIR}"
  fi
  cp "${LETTER_SOURCE_DIR}/${LETTER_SOURCE_FILE}" "${LETTER_DESTINATION_DIR}/${LETTER_DEST_FILE}"
fi

echo "Cover letter copied to ${LETTER_DESTINATION_DIR}/${LETTER_DEST_FILE}"
echo "${APP_SOURCE_DIR}"

# Copy pilot 2 application files
if [ -d "$APP_SOURCE_DIR" ]; then
  echo "Copying application files"
  if [ ! -f "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}" ]; then
    echo "Create application directory ${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}"
    mkdir -p "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}"
    mkdir -p "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/inst"
  fi
  cp -r "${APP_SOURCE_DIR}/inst/app" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/inst/app"
  cp "${APP_SOURCE_DIR}/inst/golem-config.yml" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/inst/golem-config.yml"
  cp "${APP_SOURCE_DIR}/inst/startup.R" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/inst/startup.R"
  cp -r "${APP_SOURCE_DIR}/man" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/man"
  cp -r "${APP_SOURCE_DIR}/R" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/R"
  cp -r "${APP_SOURCE_DIR}/renv" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/renv"
  cp "${APP_SOURCE_DIR}/.Rprofile" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/.Rprofile"
  cp "${APP_SOURCE_DIR}/.Rbuildignore" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/.Rbuildignore"
  cp "${APP_SOURCE_DIR}/app.R" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/app.R"
  cp "${APP_SOURCE_DIR}/DESCRIPTION" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/DESCRIPTION"
  cp "${APP_SOURCE_DIR}/LICENSE.md" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/LICENSE.md"
  cp "${APP_SOURCE_DIR}/NAMESPACE" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/NAMESPACE"
  cp "${APP_SOURCE_DIR}/NEWS.md" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/NEWS.md"
  cp "${APP_SOURCE_DIR}/README.md" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/README.md"
  cp "${APP_SOURCE_DIR}/renv.lock" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/renv.lock"
  cp "${APP_SOURCE_DIR}/submissions-pilot2.Rproj" "${ECTD_PROGRAMS_DIR}/${APP_SOURCE_DIR}/submissions-pilot2.Rproj"

  echo "Copying Docker container files"
  cp "${DOCKER_SOURCE_FILE}" "${ECTD_PROGRAMS_DIR}/${DOCKER_SOURCE_FILE}"
  cp "${ENTRYPOINT_FILE}" "${ECTD_PROGRAMS_DIR}/${ENTRYPOINT_FILE}"
fi

# Copy pilot 2 data files
if [ -d "$DATASETS_SOURCE_DIR" ]; then
  echo "Copying dataset files"
  cp -r "${DATASETS_SOURCE_DIR}" "${ECTD_DATASETS_DIR}"
fi

# if [ -f "${ECTD_BUNDLE_DIR}/${ECTD_BUNDLE_FILE}" ]; then
#   echo "Copying ${ECTD_BUNDLE_DIR}/${ECTD_BUNDLE_FILE}"
#   if [ ! -f "$DESTINATION_DIR" ]; then
#     echo "Create new directory ${DESTINATION_DIR}"
#     mkdir -p "${DESTINATION_DIR}"
#   fi
#   cp "${ECTD_BUNDLE_DIR}/${ECTD_BUNDLE_FILE}" "${DESTINATION_DIR}/${ECTD_BUNDLE_FILE}"
# fi

# echo "ECTD Bundle file copied to ${DESTINATION_DIR}/${ECTD_BUNDLE_FILE}"