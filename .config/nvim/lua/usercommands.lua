-- [[ Basic Usercommands ]]
-- :h nvim_create_user_command
-- bag:true -> true when the commands can be used in the shell.
-- vim.api.nvim_create_user_command('SayHello', 'echo "Hello world!"', {'bang': v:true}); 

vim.api.nvim_create_user_command('SayHello', 'echo "Hello world!"', {});

-- If the keyword arg is missing, start from 0

vim.api.nvim_create_user_command("Mhelp",
function (opts)
	local doc = opts.fargs[1]
	local keyword = opts.fargs[2]

	-- Get the filename, and the column number, divided by ":" 
	-- The number column rapresent the first match in the doc, of the keyword. 
	-- e.g: Default Variables.html:329K
	-- NOTE: Test without "\\"
  local get = vim.fn.systemlist("bash ~/dotfiles/.config/.local/bin/docs/getline " .. string.lower(doc) .. " " .. "\\" ..  keyword)

	local get_s = get[1]
	local filename = string.match(get_s, "%w+%.%w+")
	local column = string.match(get_s, "%d+")

	-- doc is the folder , filename is the file.
	-- ~/docs/<doc>/<filename> 
  local result = vim.fn.systemlist("bash ~/dotfiles/.config/.local/bin/docs/visualizedoc " .. string.lower(doc) .. " "  .. filename)

	 vim.cmd("split | enew")
	 vim.bo.buftype = "nofile"

	 vim.api.nvim_buf_set_lines(0, 0, -1, false, result)
	local cln = tonumber(column)
	vim.fn.cursor(cln,1)

end , {nargs='*'})
