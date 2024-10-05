local function replaceWord()
	local word = vim.fn.expand("<cword>")
	local newWord = vim.fn.input('Replace [' .. word .. '] with: ', word)

	if string.len(newWord) > 0 then
		vim.cmd('%s/' .. word .. '/' .. newWord .. '/gc')
	end
end

local function findNextInstance()
	local word = vim.fn.expand("<cword>")
	vim.fn.setreg('/', '\\<' .. word .. '\\>')
	vim.cmd('set hlsearch')
	vim.cmd('execute "normal! /" . @/')
end


local function surroundMacro()
	vim.api.nvim_echo({ { "Surrond with? ", "Normal" } }, false, {})
	local char = vim.fn.getchar()
	-- Convert the captured character to a string
	local surround = vim.fn.nr2char(char)

	local pairing = {
		['('] = '()',
		[')'] = '()',
		['{'] = '{}',
		['}'] = '{}',
		['<'] = '<>',
		['>'] = '<>',
		["'"] = "''",
		['"'] = '""',
	}
	vim.cmd('normal! ciw' .. pairing[surround])
	vim.cmd('normal! P')
end

local function telescope_live_grep_open_files()
	require('telescope.builtin').live_grep {
		grep_open_files = true,
		prompt_title = 'Live Grep in Open Files',
	}
end

return {
	replaceWord = replaceWord,
	findNextInstance = findNextInstance,
	surroundMacro = surroundMacro,
	telescope_live_grep_open_files = telescope_live_grep_open_files
}
