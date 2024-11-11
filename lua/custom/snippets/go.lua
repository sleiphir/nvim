require("luasnip.session.snippet_collection").clear_snippets "go"

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("go", {
	s("fmt.debug", fmt('fmt.Println("[DEBUG] {}", {})', { i(1), i(2) })),
	s("fmt.info", fmt('fmt.Println("[INFO] {}")', { i(1) })),
	s("fmt.error", fmt('fmt.Println("[ERROR] {}", {})', { i(1), i(2) })),

	s("err", fmt([[
	if err != nil {{
		return err
	}}
	]], {})),

	s("iferr", fmt([[
	if err := {}; err != nil {{
		return err
	}}
	]], { i(1) })),

	s("for", fmt([[
	for {}, {} := range {} {{
		{}
	}}
	]], { i(1), i(2), i(3), i(4) })),

	s("if", fmt([[
	if {} {{
		{}
	}}
	]], { i(1), i(2) })),

	s("switch", fmt([[
	switch {} {{
	case {}:
		{}
	default:
		{}
	}}
	]], { i(1), i(2), i(3), i(4) })),


	s("jsonunmarshal", fmt([[
	var {var_name} {}
	if err := json.Unmarshal({}, &{var_name}); err != nil {{
		return err
	}}
	]], { var_name = i(1), i(2), i(3) }, { repeat_duplicates = true })),

	s("jsondecode", fmt([[
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
