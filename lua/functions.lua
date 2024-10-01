local function replaceWord()
	local word = vim.fn.expand '<cword>'
	local newWord = vim.fn.input('Replace [' .. word .. '] with: ', word)

	if string.len(newWord) > 0 then
		vim.cmd('%s/' .. word .. '/' .. newWord .. '/gc')
	end
end


local function telescope_live_grep_open_files()
	require('telescope.builtin').live_grep {
		grep_open_files = true,
		prompt_title = 'Live Grep in Open Files',
	}
end

return {
	replaceWord = replaceWord,
	telescope_live_grep_open_files = telescope_live_grep_open_files
}
