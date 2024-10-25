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

function grepCurrentWord()
	local word = vim.fn.expand("<cword>")
	require('telescope.builtin').live_grep({ default_text = word })
end

function findReplaceAllFiles()
	local word = vim.fn.expand("<cword>")
	local newWord = vim.fn.input('Replace [' .. word .. '] with: ', word)
	if newWord ~= "" then
		vim.cmd('vimgrep /' .. word .. '/gj **/*')
		vim.cmd('cfdo %s/' .. vim.fn.escape(word, '/') .. '/' .. vim.fn.escape(newWord, '/') .. '/gc | update')
	end
end

return {
	replaceWord = replaceWord,
	findNextInstance = findNextInstance,
	surroundMacro = surroundMacro,
	grepCurrentWord = grepCurrentWord,
	findReplaceAllFiles = findReplaceAllFiles,
}
