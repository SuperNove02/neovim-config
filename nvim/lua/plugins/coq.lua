return {
	-- COQ Auto-completion Plugin
	{
		"ms-jpq/coq_nvim",
		branch = "coq",
		build = ":COQdeps",
		config = function()
			-- COQ Global Settings
			vim.g.coq_settings = {
				auto_start = "shut-up", -- Automatically start COQ without messages
				keymap = { recommended = true }, -- Default key mappings
			}
		end,
	},

	-- COQ Artifacts (for additional completion)
	{
		"ms-jpq/coq.artifacts",
		branch = "artifacts",
	},

	-- LSP Configuration with COQ
	{
		"neovim/nvim-lspconfig",
		dependencies = { "ms-jpq/coq_nvim" },
		config = function()
			local lsp = require("lspconfig")
			local coq = require("coq")
			coq.Now()

			-- Setup LSP servers with COQ
			lsp.gopls.setup(coq.lsp_ensure_capabilities({
				on_attach = function(client, bufnr)
					local opts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				end,
			}))

			-- Add more LSPs if needed
			--lsp.tsserver.setup(coq.lsp_ensure_capabilities({}))
			--lsp.pyright.setup(coq.lsp_ensure_capabilities({}))
			-- Setup Lua LSP with Neovim runtime awareness
			lsp.lua_ls.setup(coq.lsp_ensure_capabilities({
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" }, -- Recognize Neovim's Lua runtime
						diagnostics = {
							globals = { "vim" }, -- Prevent warnings about `vim` being undefined
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true), -- Load Neovim runtime files
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			}))
		end,
	},
}
