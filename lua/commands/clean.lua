local augrp = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augrp("CleanImports", { clear = true })
autocmd("BufWritePre", {
	group = "CleanImports",
	pattern = { "*.ts,*.tsx" },
	callback = function()
		vim.lsp.buf.code_action({
			apply = true,
			context = {
				only = { "source.removeUnused.ts" },
				diagnostics = {},
			}
		})
	end,
})
