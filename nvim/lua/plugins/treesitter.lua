-- Syntax highlighting

return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  dependencies = {
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = {
        languages = {
          php_only = "// %s",
          php = "// %s",
          -- blade = '{{-- %s --}}',
          -- blade = {
          --   __default = '{{-- %s --}}',
          --   html = '{{-- %s --}}',
          --   blade = '{{-- %s --}}',
          --   php = '// %s',
          --   php_only = '// %s',
          -- }
        },
        custom_calculation = function(node, language_tree)
          -- print(language_tree:lang())
          -- print(node:type())
          print(vim.bo.filetype)
          print(language_tree._lang)
          print("----")
          if vim.bo.filetype == "blade" then
            if language_tree._lang == "html" then
              return "{{-- %s --}}"
            else
              return "// %s"
            end
          end
          -- if vim.bo.filetype == 'blade' and language_tree._lang ~= 'javascript' and language_tree._lang ~= 'php' then
          --   return '{{-- %s --}}'
          -- end
        end,
      },
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "bash",
      "blade",
      "comment",
      "css",
      "diff",
      "dockerfile",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "html",
      "http",
      "ini",
      "javascript",
      "json",
      "jsonc",
      "lua",
      "make",
      "markdown",
      "passwd",
      "php",
      "php_only",
      "phpdoc",
      "python",
      "regex",
      "ruby",
      "rust",
      "sql",
      "svelte",
      "typescript",
      "vim",
      "vue",
      "xml",
      "yaml",
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = { "yaml" },
    },
    rainbow = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["if"] = "@function.inner",
          ["af"] = "@function.outer",
          ["ia"] = "@parameter.inner",
          ["aa"] = "@parameter.outer",
        },
      },
    },
  },
  config = function(_, opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }

    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    require("nvim-treesitter.configs").setup(opts)
  end,
}

-- return {
--   "nvim-treesitter/nvim-treesitter",
--   version = false, -- last release is way too old and doesn't work on Windows
--   build = ":TSUpdate",
--   event = { "LazyFile", "VeryLazy" },
--   lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
--   init = function(plugin)
--     require("lazy.core.loader").add_to_rtp(plugin)
--     require("nvim-treesitter.query_predicates")
--   end,
--   cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
--   keys = {
--     { "<c-space>", desc = "Increment Selection" },
--     { "<bs>", desc = "Decrement Selection", mode = "x" },
--   },
--   opts_extend = { "ensure_installed" },
--   ---@type TSConfig
--   ---@diagnostic disable-next-line: missing-fields
--   opts = {
--     highlight = { enable = true },
--     indent = { enable = true },
--     ensure_installed = {
--       "bash",
--       "c",
--       "diff",
--       "html",
--       "javascript",
--       "jsdoc",
--       "json",
--       "jsonc",
--       "lua",
--       "luadoc",
--       "luap",
--       "markdown",
--       "markdown_inline",
--       "printf",
--       "python",
--       "query",
--       "regex",
--       "toml",
--       "tsx",
--       "typescript",
--       "vim",
--       "vimdoc",
--       "xml",
--       "yaml",
--     },
--     incremental_selection = {
--       enable = true,
--       keymaps = {
--         init_selection = "<C-space>",
--         node_incremental = "<C-space>",
--         scope_incremental = false,
--         node_decremental = "<bs>",
--       },
--     },
--     textobjects = {
--       move = {
--         enable = true,
--         goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
--         goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
--         goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
--         goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
--       },
--     },
--   },
--   ---@param opts TSConfig
--   config = function(_, opts)
--     if type(opts.ensure_installed) == "table" then
--       opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
--     end
--     require("nvim-treesitter.configs").setup(opts)
--   end,
-- }
