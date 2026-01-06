vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.showmode = false
vim.opt.cmdheight = 0
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.autoread = true
vim.opt.titlestring = '%{fnamemodify(getcwd(), ":t")} - Neovim'
vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("t", "jk", [[<C-\><C-n>]])

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>x", ":bdelete<CR>")

vim.keymap.set("n", "<leader>yp", function()
	local relative_path = vim.fn.expand("%:~:.")
	vim.fn.setreg("+", relative_path)
	vim.notify("Copy: " .. relative_path)
end, { silent = true, desc = "Copy relative path to clipboard" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(event)
		vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
	end,
})

vim.diagnostic.config({
	update_in_insert = true,
	virtual_text = {
		format = function(diagnostic)
			return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
		end,
	},
})

require("config.lazy")

-- Auto layout: nvim-tree on left, toggleterm on bottom
-- Only when opening a directory
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Check if a directory was specified as argument
		if vim.fn.argc() > 0 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
			vim.schedule(function()
				vim.cmd("NvimTreeOpen")
				vim.cmd("ToggleTerm")
				-- Wait for nvim-tree to fully initialize before moving focus
				vim.defer_fn(function()
					vim.cmd("wincmd k")
				end, 100)
			end)
		end
	end,
})
