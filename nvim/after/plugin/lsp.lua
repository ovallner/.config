local lsp = require('lsp-zero')
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright',
        'gopls'
    },
    handlers = {
        lsp.default_setup,
    },
})

lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true}),
    ['<C-Space>'] = cmp.mapping.complete(),
})


lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufner, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)

lsp.setup()
