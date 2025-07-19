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
		"newFile",
		fmt(
			[[
			package {1}

			import (
				{2}
			)

			func {3}() {4} {{
				{5}
			}}
			]],
			{
				i(1, "name"),
				i(2, "imports"),
				i(3, "name"),
				i(4, "returns"),
				i(5),
			}
		)
	),
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
	s(
		"for",
		fmt(
			[[
			for i:={1}; i {2}; {3} {{
				{4}
			}}
			]],
			{
				i(1, "0"),
				i(2, "< 10"),
				i(3, "i++"),
				i(4),
			}
		)
	),
	s(
		"for range",
		fmt(
			[[
			for {1}, {2} := range {3} {{
				{4}
			}}
			]],
			{
				i(1, "index"),
				i(2, "value"),
				i(3, "var"),
				i(4),
			}
		)
	),
	s(
		"array",
		fmt(
			[[
			{1} := [{2}]{3}{{{4}}}
			]],
			{
				i(1, "var"),
				i(2, "..."),
				i(3, "type"),
				i(4),
			}
		)
	),
	s(
		"switch",
		fmt(
			[[
			switch {1} {{
				case {2}:
					{3}
				case {4}:
					{5}
				default:
					{6}
			}}
			]],
			{
				i(1, "var"),
				i(2, "val"),
				i(3),
				i(4, "val"),
				i(5),
				i(6),
			}
		)
	),
	s(
		"if",
		fmt(
			[[
			if {1}, err := {2}; err != nil {{
				{3}
			}}
			]],
			{
				i(1, "var"),
				i(2, "func"),
				i(3),
			}
		)
	),
	s(
		"lambda",
		fmt(
			[[
			{1} := func() {2} {{
				{3}
			}}
			]],
			{
				i(1, "var"),
				i(2, "returnVal"),
				i(3),
			}
		)
	),
})
