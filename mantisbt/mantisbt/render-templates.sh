#!/bin/bash

#set -eu

indir="${1}"
outdir="${2}"

function template_files() {
    find "${indir}" \
        -mindepth 1 \
        -maxdepth 1 \
        -name '*.tmpl' \
        -print0
}

#rm -rf "${outdir}"
#mkdir -p "${outdir}"
template_files | xargs -0 /substitute-env-vars.sh "${outdir}"
