local function replaceWord()
	local word = vim.fn.expand '<cword>'
	local newWord = vim.fn.input('Replace [' .. word .. '] with: ')

	if string.len(newWord) > 0 then
		vim.cmd('%s/' .. word .. '/' .. newWord .. '/gc')
	end
end

return { replaceWord = replaceWord }
