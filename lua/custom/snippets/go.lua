require("luasnip.session.snippet_collection").clear_snippets "go"

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("go", {
	s("fmt debug", fmt('fmt.Println("[DEBUG] {}", {})', { i(1), i(2) })),
	s("fmt info", fmt('fmt.Println("[INFO] {}", {})', { i(1), i(2) })),
	s("fmt error", fmt('fmt.Println("[ERROR] {}", {})', { i(1), i(2) })),
	s("fmt warn", fmt('fmt.Println("[WARN] {}", {})', { i(1), i(2) })),

	s("if err !=", fmt([[
	if err != nil {{
		return err
	}}

	]], {})),

	s("if err :=", fmt([[
	if err := {}; err != nil {{
		return err
	}}

	]], { i(1) })),

	s("json unmarshal", fmt([[
	var {var_name} {}
	if err := json.Unmarshal({}, &{var_name}); err != nil {{
		return err
	}}

	]], { var_name = i(1), i(2), i(3) }, { repeat_duplicates = true })),

	s("json decode", fmt([[
	var {var_name} {}
	if err := json.NewDecoder({}).Decode(&{var_name}); err != nil {{
		return err
	}}

	]], { var_name = i(1), i(2), i(3) }, { repeat_duplicates = true })),

	s("func", fmt([[
	func {}({}) {} {{
		{}
	}}

	]], { i(1), i(2), i(3), i(4) })),
})

