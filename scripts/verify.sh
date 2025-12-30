#!/usr/bin/env bash

set -e

brew doctor
git --version
kubectl version --client
python3 --version
ollama list

echo "✅ Mac bootstrap verification complete"

