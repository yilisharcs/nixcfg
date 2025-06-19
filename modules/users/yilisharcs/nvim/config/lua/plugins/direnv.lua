return {
  "yilisharcs/direnv.vim",
  dev = true,
  config = function()
    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "DirenvLoaded",
      group = vim.api.nvim_create_augroup("Direnv_Flake_RaMux", { clear = true }),
      callback = function()
        if vim.bo.filetype == "rust" then
          ---@diagnostic disable: need-check-nil
          local handle = io.popen("ps -e | grep ra-multiplex")
          local result = handle:read("*a")
          handle:close()

          if result == "" then
            ---@diagnostic disable-next-line: missing-fields
            vim.uv.spawn("ra-multiplex", { args = { "server" }, detached = true },
              function() end)
            vim.cmd("edit")
          end
        end
      end
    })
  end
}
