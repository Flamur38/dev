-- LSP Support
return {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
        { 'j-hui/fidget.nvim', opts = {} },
        { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
        -- Mason setup
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                'bashls',
                'lua_ls',
                'pyright',
                'lemminx',
                'marksman',
                'quick_lint_js',
                'gopls',
            }
        })
        -- Mason tool installer setup
        require('mason-tool-installer').setup({
            ensure_installed = {
                'black',
                'debugpy',
                'flake8',
                'isort',
                'mypy',
                'pylint',
                'pytest',
                'ipython',
                'jupyter',
            },
        })
        require('fidget').setup({})
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Python path detection (for virtualenv support)
        local function get_python_path(workspace)
            if vim.env.VIRTUAL_ENV then
                return vim.env.VIRTUAL_ENV .. '/bin/python'
            end
            local match = vim.fn.glob(workspace .. '/.venv/bin/python')
            if match ~= '' then return match end
            return 'python3'
        end
        -- Keymaps on LSP attach
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local bufnr = args.buf
                -- Disable LSP semantic tokens — let Treesitter handle all highlighting
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client then client.server_capabilities.semanticTokensProvider = nil end

                local opts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>tt', '<Cmd>!pytest %<CR>', opts)
                -- Diagnostics config
                vim.diagnostic.config({
                    virtual_text = true,
                    signs = true,
                    update_in_insert = false,
                })
            end,
        })
        -- Rounded borders for floating windows
        local orig_util = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or 'rounded'
            return orig_util(contents, syntax, opts, ...)
        end
        -- Generic servers
        local servers = { 'bashls', 'lemminx', 'marksman', 'quick_lint_js', 'gopls' }
        for _, server in ipairs(servers) do
            vim.lsp.config(server, { capabilities = lsp_capabilities })
            vim.lsp.enable(server)
        end
        -- Lua-specific settings
        vim.lsp.config('lua_ls', {
            capabilities = lsp_capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { 'vim' } },
                },
            },
        })
        vim.lsp.enable('lua_ls')
        -- Python-specific settings
        vim.lsp.config('pyright', {
            capabilities = lsp_capabilities,
            before_init = function(_, config)
                local root_dir = config.root_dir or vim.fn.getcwd()
                config.settings = {
                    python = {
                        pythonPath = get_python_path(root_dir),
                    }
                }
            end,
        })
        vim.lsp.enable('pyright')
    end
}
