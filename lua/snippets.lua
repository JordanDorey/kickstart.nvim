local ls = require("luasnip")

-- Some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Set up keymaps for snippet expansion
vim.keymap.set({ "i", "s" }, "<C-k>", functionV()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", functionV()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

ls.add_snippets("go", {
	s("nil", {
		t({ "if(err != nil) {", "    " }),
		i(1),
		t({ "", "}" })
	}),
})
