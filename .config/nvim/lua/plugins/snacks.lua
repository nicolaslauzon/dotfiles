return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,

  init = function()
    -- Set up vim.ui overrides for Snacks
    vim.ui.input = function(...)
      return require('snacks').input(...)
    end
    vim.ui.select = function(...)
      return require('snacks').picker.select(...)
    end
  end,

  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    gitbrowse = {
      enabled = true,
      open = function(url)
        vim.fn.jobstart({ "firefox", url }, { detach = true })
      end,
    },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    terminal = {
      enabled = true,
      win = {
        position = "right",
        width = 0.5,
        wo = {
          winbar = "",
        },
      },
    },

    -- Image viewer configuration
    image = {
      enabled = true,
      -- Custom image viewer configuration
      doc = {
        enabled = true,
        inline = true,
        float = true,
        max_width = 100, -- default: 80
        max_height = 50, -- default: 40
        conceal = function(lang, type)
          -- Conceal all image types when rendered inline
          return true -- default: only math expressions
        end,
      },
      -- Additional image directories beyond defaults
      img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments", "pictures", "screenshots" },
      -- Custom window options for image buffers
      wo = {
        wrap = false,
        number = false,
        relativenumber = false,
        cursorcolumn = false,
        signcolumn = "no",
        foldcolumn = "0",
        list = false,
        spell = false,
        statuscolumn = "",
        cursorline = false, -- added custom option
      },
      -- Enable debug for troubleshooting
      debug = {
        request = false,
        convert = false,
        placement = false,
      },
      -- Custom icons
      icons = {
        math = " ",    -- default: "󰪚 "
        chart = " ",   -- default: "󰄧 "
        image = "🖼 ",   -- default: " "
      },
      -- Math expression rendering config
      math = {
        enabled = true,
        latex = {
          font_size = "huge", -- default: "Large"
          packages = { "amsmath", "amssymb", "amsfonts", "amscd", "mathtools", "tikz" }, -- added tikz
        },
      },
      convert = {
        notify = true, -- default: false - show notifications on conversion errors
      },
    },

    -- Lazygit configuration
    lazygit = {
      -- Automatically configure lazygit to use current colorscheme
      -- and integrate edit with the current neovim instance
      configure = true,

      -- Extra lazygit yaml config (merged with defaults)
      config = {
        os = {
          editPreset = 'nvim-remote',
        },
        gui = {
          -- Set to "" to disable icons
          nerdFontsVersion = '3',
        },
      },

      -- Where the generated theme yaml is written
      theme_path = vim.fs.normalize(vim.fn.stdpath('cache') .. '/lazygit-theme.yml'),

      -- Lazygit theme, mapped to Neovim highlight groups
      theme = {
        [241] = { fg = 'Special' },

        activeBorderColor = { fg = 'MatchParen', bold = true },
        cherryPickedCommitBgColor = { fg = 'Identifier' },
        cherryPickedCommitFgColor = { fg = 'Function' },
        defaultFgColor = { fg = 'Normal' },
        inactiveBorderColor = { fg = 'FloatBorder' },
        optionsTextColor = { fg = 'Function' },
        searchingActiveBorderColor = { fg = 'MatchParen', bold = true },
        selectedLineBgColor = { bg = 'Visual' },
        unstagedChangesColor = { fg = 'DiagnosticError' },
      },

      -- Terminal window style
      win = {
        style = 'lazygit',
      },
    },
  },

  keys = {
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gb',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
    },
    {
      '<C-`>',
      function()
        Snacks.terminal.toggle()
      end,
      desc = 'Toggle Terminal',
      mode = { 'n', 't' },
    },
    {
      '<leader>ip',
      function()
        Snacks.image.hover()
      end,
      desc = 'Preview Image',
    },
    {
      '<leader>mp',
      function()
        local buf = vim.api.nvim_get_current_buf()
        local file = vim.api.nvim_buf_get_name(buf)
        if vim.bo[buf].filetype == 'markdown' then
          Snacks.terminal.open({ 'glow', file }, {
            win = { position = 'right', width = 0.5 }
          })
        else
          vim.notify('Not a markdown file', vim.log.levels.WARN)
        end
      end,
      desc = 'Preview Markdown',
      ft = 'markdown',
    },
  },
}
