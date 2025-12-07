vim.g.mapleader = " "
vim.g.maplocalleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"ft-shada",
				"netrw",
				"editorconfig",
			},
		},
	},
})

-- Options
vim.opt.hidden = true
vim.opt.laststatus = 3
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.autoread = true
vim.opt.signcolumn = "yes"
vim.opt.backspace = "indent,eol,start"
vim.opt.wildmode = { "lastused", "full" }
vim.opt.pumheight = 15
vim.opt.scrolloff = 3
vim.opt.winborder = "rounded"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.guifont = "SauceCodePro Nerd Font:h17"
vim.o.exrc = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>.", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("Copied: " .. path)
end, { desc = "Copy full file path" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-]>", "<C-\\><C-n>", { desc = "Exit terminal" })

vim.keymap.set("n", "<leader>bd", "<cmd>bdel<CR>", { desc = "Delete buffer" })

vim.keymap.set("n", "<c-u>", [[<c-u>zz]], { noremap = true })
vim.keymap.set("n", "<a-d>", [[<c-d>zz]], { noremap = true })

-- Normal mode: search word under cursor, then change next match
vim.keymap.set("n", "<M-d>", [[:let @/='\<'.expand('<cword>').'\>'<CR>cgn]], { silent = true })
-- Visual mode: search selection, then change next match
vim.keymap.set("x", "<M-d>", [["sy:let @/=@s<CR>cgn]], { silent = true })

vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Next diagnostic" })

-- Window management
vim.keymap.set("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close window" })

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })

require("config.globals")

local termrun = require("termrun")
termrun.setup()

vim.keymap.set("n", "<F5>", function()
	vim.cmd([[lua R("termrun").setup()]])
end, {})

vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy" })
vim.keymap.set({ "n", "v" }, "<D-v>", '"+p', { desc = "Paste" })
vim.keymap.set("i", "<D-v>", "<C-r>+", { desc = "Paste" })
vim.keymap.set("c", "<D-v>", "<C-r>+", { desc = "Paste" })
vim.keymap.set("n", "<D-t>", ":tabnew<CR>")
vim.keymap.set("n", "<D-{>", ":tabprev<CR>")
vim.keymap.set("n", "<D-}>", ":tabnext<CR>")
vim.keymap.set("n", "<D-w>", ":tabclose<CR>")

vim.g.neovide_input_macos_option_key_is_meta = "only_left"

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	pattern = "term://*",
	callback = function()
		vim.cmd("startinsert")
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
		vim.opt_local.scrolloff = 0
	end,
})
