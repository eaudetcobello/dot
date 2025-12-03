local M = {}

-- module state
local config = {}
local last_cmd = nil
local term_buf = nil

function M.setup(opts)
	vim.keymap.set("n", "<leader>rr", function()
		M.rerun_previous()
	end, { silent = true })

	vim.keymap.set({ "n", "t" }, "<leader>;", "<CMD>TermRunToggle<CR>", { silent = true })

	local defaults = {
		position = "vertical",
		commands = {
			run = "go run .",
			echo = "echo hello",
		},
		save = true,
	}
	config = vim.tbl_deep_extend("force", defaults, opts or {})

	-- :TermRun {cmd}  -> run and remember it
	-- :TermRun        -> run last remembered cmd
	vim.api.nvim_create_user_command("TermRun", function(cmd_opts)
		local cmd = table.concat(cmd_opts.fargs, " ")
		M.run(cmd)
	end, { nargs = "*" })

	vim.api.nvim_create_user_command("TermRunPick", function(cmd_opts)
		vim.ui.select(vim.tbl_keys(config.commands), {
			prompt = "Select command:",
		}, function(choice)
			if choice then
				M.run(config.commands[choice])
			end
		end)
	end, {})

	vim.api.nvim_create_user_command("TermRunToggle", function(cmd_opts)
		M.toggle()
	end, {})
end

local function resolve_cmd(cmd)
	if cmd and cmd ~= "" then
		return cmd
	end
	return last_cmd -- may be nil!
end

function M.run(cmd)
	cmd = resolve_cmd(cmd)
	if not cmd then
		print("No previous TermRun command")
		return
	end
	last_cmd = cmd

	if config.save then
		vim.cmd("silent w")
	end

	M.ensure_term_win()

	local job_id = vim.bo[term_buf].channel
	if not job_id then
		return
	end

	vim.api.nvim_chan_send(job_id, cmd .. "\n")
end

function M.rerun_previous()
	M.run(nil)
end

function M.ensure_term_win()
	-- do nothing if already visible
	if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
		if vim.fn.bufwinid(term_buf) ~= -1 then
			return
		end
		-- buf exists but not visible
		M.open_split()
		vim.api.nvim_set_current_buf(term_buf)
	else
		M.open_split()
		vim.cmd("terminal")
		term_buf = vim.api.nvim_get_current_buf()
	end
end

function M.toggle()
	if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
		local win = vim.fn.bufwinid(term_buf)
		if win == -1 then
			-- buf exists but not visible
			M.open_split()
			vim.api.nvim_set_current_buf(term_buf)
		else
			vim.api.nvim_win_close(win, true)
		end
	else
		M.ensure_term_win()
	end
end

function M.open_split()
	if config.position == "vertical" then
		vim.cmd("botright vsplit")
		vim.cmd("vertical resize " .. (config.width or 40))
	else
		vim.cmd("botright split")
		vim.cmd("resize " .. (config.height or 12))
	end
end

return M
