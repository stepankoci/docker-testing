#!/bin/bash

SHARED_README_CONTENT="
# Auto-generated shared assets

Do not edit contents of this folder directly.
Use resources/shared directory and update.sh.
"

echo 'Updating version:'

for VERSION in versions/* ; do
    SHARED_DIR=${VERSION}/shared
    echo '- '${VERSION}

    rm -rf ${SHARED_DIR}
    cp -r resources/shared ${SHARED_DIR}

    touch ${SHARED_DIR}/README.md
    echo "${SHARED_README_CONTENT}" > ${SHARED_DIR}/README.md
done

echo 'Done'