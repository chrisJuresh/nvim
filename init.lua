require("chris.core")
require("chris.lazy")

-- Define colors as variables
local active_bg = "#000000"
local inactive_bg = "#050505"

-- Base window dimming
vim.opt.winhighlight = "Normal:ActiveWindow,NormalNC:InactiveWindow"
vim.api.nvim_set_hl(0, "ActiveWindow", { bg = active_bg })
vim.api.nvim_set_hl(0, "InactiveWindow", { bg = inactive_bg })

-- Configure nvim-tree highlights to match pane dimming
vim.api.nvim_create_autocmd("WinLeave", {
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = inactive_bg })
			vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = inactive_bg })
			vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = inactive_bg })
			vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = inactive_bg, fg = inactive_bg })
		end
	end,
	pattern = "*",
})

vim.api.nvim_create_autocmd("WinEnter", {
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = active_bg })
			vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = active_bg })
			vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = active_bg })
			vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = active_bg, fg = inactive_bg })
		end
	end,
	pattern = "*",
})
