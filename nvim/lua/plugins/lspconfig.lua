return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				auto_install = true,
				enshure_installed = {
					"lua_ls",
					"tsserver",
					"rust_analyzer",
					"ocamllsp",
					"svelte",
					"gopls",
					"ansible-lint",
					"docker_compose_language_service",
					"yamlls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({})
			--lspconfig.pyright.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.gopls.setup({})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
