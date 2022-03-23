#!/bin/bash

# html/css/javascript/eslint
yarn global add vscode-langservers-extracted
# tailwind
yarn global add @tailwindcss/language-server
# typescript
yarn global add typescript typescript-language-server
# svelte
yarn global add svelte-language-server
# golang
go install golang.org/x/tools/gopls@latest
# python
pip install pyright
# sql
yarn global add sql-language-server
# emmet
yarn global add emmet-ls

