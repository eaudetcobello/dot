local lga = require("telescope").extensions.live_grep_args

vim.keymap.set("n", "<localleader>g", function()
	lga.live_grep_args({ default_text = '-tgo -g "!vendor" ' })
end, { buffer = true, desc = "Grep Go" })

-- Unfiltered (just the exclusion)
vim.keymap.set("n", "<localleader>G", function()
	lga.live_grep_args({ default_text = '-g "!vendor" ' })
end, { buffer = true, desc = "Grep all (no vendor)" })
