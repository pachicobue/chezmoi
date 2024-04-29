-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ List of plugins to install ]]
local plugins = {
    -- Installer
    { "folke/lazy.nvim" },

    -- Color scheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = true,
                terminal_colors = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    -- Beautify indentations
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    -- Centerize Window
    {
        "shortcuts/no-neck-pain.nvim",
        vertion = "*",
        config = function()
            require("no-neck-pain").setup({
                width = 150,
            })
        end,
    },

    -- Adds git related signs to the gutter, as well as utilities for managing changes
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    -- Useful plugin to show you pending keybinds.
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        config = function()
            require("which-key").setup()

            -- Document existing key chains
            require("which-key").register({
                ["<leader>f"] = { name = "[F]ile", _ = "which_key_ignore" },
                ["<leader>l"] = { name = "[L]SP", _ = "which_key_ignore" },
                ["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
            })
            vim.keymap.set("n", "<leader>fs", "<Cmd>:w<CR>")
            vim.keymap.set("n", "<leader>fd", "<Cmd>:bd<CR>")
        end,
    },

    -- Fuzzy Finder (files, lsp, etc)
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
            -- Useful for getting pretty icons, but requires a Nerd Font.
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
        },
        config = function()
            -- [[ Configure Telescope ]]
            -- See `:help telescope` and `:help telescope.setup()`
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })

            -- Enable Telescope extensions if they are installed
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            -- See `:help telescope.builtin`
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.git_files, { desc = "File [F]ind" })
            vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "File [R]ecent" })
            vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "LSP [D]efinitions" })
            vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "LSP [R]eferences" })
            vim.keymap.set("n", "<leader>le", builtin.diagnostics, { desc = "LSP [E]rrors" })
        end,
    },

    -- LSP Configuration & Plugins
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for Neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "kkharji/lspsaga.nvim",

            -- Useful status updates for LSP.
            { "j-hui/fidget.nvim", opts = {} },

            -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            --  This function gets run when an LSP attaches to a particular buffer.
            --    That is to say, every time a new file is opened that is associated with
            --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
            --    function will be executed to configure the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("<leader>ln", vim.lsp.buf.rename, "LSP Re[n]ame")
                    map("<leader>la", vim.lsp.buf.code_action, "LSP [A]ction")
                    map("<leader>lh", vim.lsp.buf.hover, "LSP [H]over")

                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.server_capabilities.documentHighlightProvider then
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            -- Enable the following language servers
            --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
            local servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--offset-encoding=utf-16",
                    },
                },
                pyright = {},
                rust_analyzer = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
            }

            -- Ensure the servers and tools above are installed
            require("mason").setup()

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                "stylua", -- Used to format Lua code
            })
            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        -- This handles overriding only values explicitly passed
                        -- by the server configuration above. Useful when disabling
                        -- certain features of an LSP (for example, turning off formatting for tsserver)
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end,
    },
    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            {
                "L3MON4D3/LuaSnip",
                tag = "v2.3.0",
                run = "make install_jsregexp",
            },
            {
                "zbirenbaum/copilot-cmp",
                dependencies = {
                    "zbirenbaum/copilot.lua",
                    config = function()
                        require("copilot").setup({
                            suggestion = { enabled = false },
                            panel = { enabled = false },
                        })
                    end,
                },
                config = true,
            },
        },
        config = function()
            -- See `:help cmp`
            local cmp = require("cmp")
            local compare = cmp.config.compare
            cmp.setup({
                completion = { completeopt = "menu,menuone,noinsert" },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp", keyword_length = 2, priority = 10 },
                    { name = "copilot",  priority = 1 },
                },
                experimental = {
                    ghost_text = true,
                },
                sorting = {
                    priority_weight = 10,
                    comparators = {
                        compare.exact,
                        compare.score,
                        compare.locality,
                        compare.length,
                        compare.recently_used,
                        compare.offset,
                        compare.order,
                    },
                },
            })
        end,
    },

    -- Collection of various small independent plugins/modules
    {
        "echasnovski/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            require("mini.ai").setup({ n_lines = 500 })

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            require("mini.surround").setup()

            -- Comment lines with `gcc` and `gc` in normal and visual mode
            require("mini.comment").setup()

            -- Pair brackets, quotes, etc.
            require("mini.pairs").setup()
        end,
    },

    -- Highlight, edit, and navigate code
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "bash", "c", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "ruby" },
            },
            indent = { enable = true, disable = { "ruby" } },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
    },

    -- Popup cmdline,messages,...{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = true,
    },

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                vim.keymap.set("n", "gt", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true }),
                vim.keymap.set("n", "gT", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true }),
                vim.keymap.set("", "<C-Tab>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true }),
                vim.keymap.set("", "<C-S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true }),
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            local null_ls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            null_ls.setup({
                sources = {
                    null_ls.builtins.code_actions.gitsigns,
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.mdformat,
                    null_ls.builtins.diagnostics.jsonlint,
                    null_ls.builtins.diagnostics.markdownlint,
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({
                                    async = false,
                                })
                            end,
                        })
                    end
                end,
            })
        end,
    },
    {
        "stevearc/oil.nvim",
        lazy = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            {
                "<leader>te",
                function()
                    local cd = vim.fn.expand("%:p:h")
                    require("oil").open_float(cd)
                end,
                desc = "Toggle [E]xplorer",
            },
        },
        opts = {
            keymaps = {
                -- ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["-"] = "actions.parent",
                ["q"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["<space>"] = "actions.open_cwd",
                -- ["`"] = "actions.cd",
                -- ["~"] = "actions.tcd",
                ["g."] = "actions.toggle_hidden",
                -- ["<C-s>"] = "actions.select_vsplit",
                -- ["<C-h>"] = "actions.select_split",
                -- ["<C-t>"] = "actions.select_tab",
            },
            view_options = {
                show_hidden = true,
            },
            use_default_keymaps = false,
        },
        config = function(_, opts)
            require("oil").setup(opts)
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup()
            local Terminal = require("toggleterm.terminal").Terminal
            local common = Terminal:new({
                direction = "vertical",
                hidden = true,
                size = vim.o.columns * 0.5,
            })
            local tig = Terminal:new({
                cmd = "tig status",
                dir = "git_dir",
                direction = "float",
                hidden = true,
                on_open = function(term)
                    vim.api.nvim_buf_set_keymap(
                        term.bufnr,
                        "n",
                        "q",
                        "<Cmd>close<CR>",
                        { noremap = true, silent = true }
                    )
                end,
            })

            function ToggleCommonTerm()
                common:toggle()
            end

            function ToggleTigTerm()
                tig:toggle()
            end

            vim.keymap.set("n", "<leader>tt", "<Cmd>lua ToggleCommonTerm()<CR>", { desc = "Toggle [T]erminal" })
            vim.keymap.set("n", "<leader>tg", "<Cmd>lua ToggleTigTerm()<CR>", { desc = "Toggle [G]it" })
        end,
    },
}

require("lazy").setup(plugins)