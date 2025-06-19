return {
  "yilisharcs/direnv.vim",
  dev = true,
  config = function()
    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "DirenvLoaded",
      group = vim.api.nvim_create_augroup("Direnv_Flake_LSP", { clear = true }),
      callback = function()
        -- Because Rust-analyzer is configured per-project with flakes,
        -- it doesn't exist in the path before the lsp command is invoked.
        if vim.bo.filetype == "rust" then
          local bufnr = vim.api.nvim_get_current_buf()
          local client = vim.lsp.get_clients({ bufnr = bufnr })
          if vim.fn.empty(client) == 1 then vim.cmd("edit") else end
        end
      end
    })
  end
}
