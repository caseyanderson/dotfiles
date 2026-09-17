-- Enable completion from attached language servers
local lsp_completion = vim.api.nvim_create_augroup("lsp_completion", {
  clear = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_completion,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client:supports_method("textDocument/definition") then
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
        buffer = args.buf,
        desc = "Go to definition",
      })
    end

    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, {
        autotrigger = false,
      })
    end
  end,
})

vim.lsp.enable({ "basedpyright", "ruff" })
