local keyMapper = require("utils.keyMapper").mapKey

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
				ensure_installed = { "clangd", "lua_ls", "ts_ls", "dockerls", "ltex", "pylsp" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.dockerls.setup({})
			lspconfig.ltex.setup({})
			lspconfig.pylsp.setup({})

			-- vim.lsp.buf.hover
			-- vim.lsp.buf.definition
			-- vim.lsp.buf.code_acion
			keyMapper("K", vim.lsp.buf.hover)
			keyMapper("gd", vim.lsp.buf.definition)
			keyMapper("<leader>ca", vim.lsp.buf.code_action)
		end,
	},
}
