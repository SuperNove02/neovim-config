return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,

				--[[python]]
				null_ls.builtins.diagnostics.pylint.with({
					diagnostics_postprocess = function(diagnostic)
						diagnostic.code = diagnostic.message_id
					end,
				}),
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
				--[[
        null_ls.builtins.diagnostics.eslint_d.with({

          diagnostics_format = "[eslint] #{m}\n(#{c})",

          -- only enable eslint if root has .eslintrc.js

          condition = function(utils)
            return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
          end,

        })
        ]]
				--
			},
		})

    -- Autoformat on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.go", "*.lua" }, -- Ensure Lua files are included
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
