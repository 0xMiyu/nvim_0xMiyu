local lsp = require("lsp-zero").preset({})

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer',
	'jedi_language_server', --python
	'tailwindcss',
	'jdtls' --java
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings ({
	['<C-Space>'] = cmp.mapping.confirm({ select = true })
})

--local cmp = require('cmp')
--local cmp_select = {behaviour = cmp.SelectBehaviour.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--	['<C-y>'] = cmp.mapping.confirm({ select = true}),
--	['<C-Space>'] = cmp.mapping.complete(),
--})

lsp.setup()

