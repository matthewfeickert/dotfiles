#!/usr/bin/env bash

if [[ ! -d "${HOME}/.venvs/base" ]]; then
  mkdir -p "${HOME}/.venvs"
  cd "${HOME}/.venvs"
  python3 -m venv base
fi

if [[ -d "${HOME}/.venvs/base" ]]; then
  source "${HOME}/.venvs/base/bin/activate"
  python -m pip install --quiet --upgrade pip setuptools wheel
  python -m pip install --quiet --requirement base-requirements.txt
fi
