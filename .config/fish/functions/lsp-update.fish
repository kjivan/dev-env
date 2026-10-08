# rust-analyzer comes from rustup to match the toolchain; pylsp from uv so the
# pylsp-rope plugin shares its environment
function lsp-update -d "Update the language servers nvim uses"
  brew upgrade gopls jdtls basedpyright vtsls
  and uv tool upgrade python-lsp-server
  and rustup update
end
