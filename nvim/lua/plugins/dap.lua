return {
	-- Debugging Support
	{
		"mfussenegger/nvim-dap",
		config = function()
			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
			vim.api.nvim_set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
			vim.api.nvim_set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
			vim.api.nvim_set_keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
			vim.api.nvim_set_keymap("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
			vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
			vim.api.nvim_set_keymap("n", "<leader>du", ":lua require'dapui'.toggle()<CR>", opts)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
		opts = { ensure_installed = { "delve" } }, -- Ensure delve is installed
	},
	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-go").setup()
		end,
	},

	-- LazyGit Integration with Keymap Inside Plugin Config
	{
		"kdheepak/lazygit.nvim",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
		end,
	},
}
