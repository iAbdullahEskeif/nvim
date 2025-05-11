return { -- Autoformat

"stevearc/conform.nvim",
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			php = { { "pint", "php_cs_fixer" } },
		},
}
