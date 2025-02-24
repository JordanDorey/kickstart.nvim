local function replaceWord()
	local word = vim.fn.expand("<cword>")
	local newWord = vim.fn.input('Replace [' .. word .. '] with: ', word)

	if string.len(newWord) > 0 then
		vim.cmd('%s/' .. word .. '/' .. newWord .. '/gc')
	end
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
	local oldWord = vim.fn.input('Word to replace? ', word)
	local newWord = vim.fn.input('Replace [' .. oldWord .. '] with: ', oldWord)
	if newWord ~= "" then
		vim.cmd('vimgrep /' .. oldWord .. '/gj **/*')
		vim.cmd('cfdo %s/' .. vim.fn.escape(oldWord, '/') .. '/' .. vim.fn.escape(newWord, '/') .. '/gc | update')
	end
end

local function liveGrepList()
	-- Save the current cursor position to the jumplist
	-- vim.api.nvim_command('normal! m`')
	local word = vim.fn.expand("<cword>")

	-- Run ripgrep (or another grep tool) and populate the quickfix list
	vim.fn.setqflist({}, ' ', {
		lines = vim.fn.systemlist('rg --vimgrep --smart-case ' .. vim.fn.shellescape(word)),
		efm = '%f:%l:%c:%m',
	})

	-- Open the quickfix window
	vim.api.nvim_command('copen')
end

return {
	replaceWord = replaceWord,
	surroundMacro = surroundMacro,
	grepCurrentWord = grepCurrentWord,
	findReplaceAllFiles = findReplaceAllFiles,
	liveGrepList = liveGrepList,
}
