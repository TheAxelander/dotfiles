#!/bin/sh

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.$TIMESTAMP.old"
fi