local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

-- Some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Set up keymaps for snippet expansion
vim.keymap.set({ "i", "s" }, "<C-n>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-p>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })


ls.add_snippets("go", {
	s(
		"nil",
		fmt(
			[[
			if err != nil {{
				{1}
			}}
			]],
			{ i(1, "return err") }
		)
	),
	s(
		"func",
		fmt(
			[[
			func {1}() {2} {{
				{3}
			}}
			]],
			{
				i(1, "funcName"),
				i(2, "returns"),
				i(3),
			}
		)
	),
	s(
		"struct",
		fmt(
			[[
			type {1} struct {{
				{2} {3}
			}}
			]],
			{
				i(1, "name"),
				i(2, "var"),
				i(3, "type"),
			}
		)
	),
})
