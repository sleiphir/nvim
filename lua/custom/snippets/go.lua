require("luasnip.session.snippet_collection").clear_snippets "go"

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("go", {
	s("if err", fmt([[
	if err != nil {{
		{}
		return {}
	}}
	]], { i(1), i(2) })),

	s("for", fmt([[
	for i := range {} {{
		{}
	}}
	]], { i(1), i(2), })),

	s("unmarshal", fmt([[
	var {var_name} {}
	if err := json.Unmarshal({}, &{var_name}); err != nil {{
		return err
	}}
	]], { var_name = i(1), i(2), i(3) }, { repeat_duplicates = true })),

	s("decode", fmt([[
	var {var_name} {}
	if err := json.NewDecoder({}).Decode(&{var_name}); err != nil {{
		return err
	}}
	]], { var_name = i(1), i(2), i(3) }, { repeat_duplicates = true })),
})
