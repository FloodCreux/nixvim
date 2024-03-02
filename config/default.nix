{ pkgs, ... }: {
  imports = [
    ./configs/conform.nix
    ./configs/copilot-lua.nix
    ./configs/dap.nix
    ./configs/gitsigns.nix
    ./configs/lualine.nix
    ./configs/neorg.nix
    ./configs/noice.nix
    ./configs/notify.nix
    ./configs/nvim-cmp.nix
    ./configs/obsidian.nix
    ./configs/oil.nix
    ./configs/telescope.nix
    ./configs/which-key.nix
  ];

  config = {
    options = {
      number = true;
      relativenumber = true;

      expandtab = true;
      hlsearch = false;

      scrolloff = 8;
      signcolumn = "yes";
      shiftwidth = 2;
      smartindent = true;
      smarttab = true;
      softtabstop = 2;
      termguicolors = true;
      wrap = false;

      swapfile = false;
      backup = false;

      undofile = true;

      updatetime = 50;

      guicursor = "";

      nu = true;
      colorcolumn = "120";
    };

    clipboard.register = "unnamedplus";

    globals.mapleader = " ";

    colorschemes = {
      catppuccin = {
        enable = true;
        flavour = "macchiato";
        terminalColors = true;
        transparentBackground = true;

        integrations = {
          cmp = true;
          dap = {
            enable_ui = true;
            enabled = true;
          };
          gitsigns = true;
          treesitter = true;
          fidget = true;
          harpoon = true;
          noice = true;
          notify = true;
          which_key = true;

          telescope = { enabled = true; };
          native_lsp.enabled = true;
        };
      };
    };

    plugins = {
      comment-nvim.enable = true;
      fidget.enable = true;
      fugitive.enable = true;
      lsp-format.enable = true;
      luasnip = { enable = true; };
      treesitter = { enable = true; };
      undotree.enable = true;
      indent-blankline.enable = true;
      # copilot-cmp.enable = true;
      toggleterm.enable = true;
      trouble.enable = true;

      lsp = {
        enable = true;
        capabilities = ''require("cmp_nvim_lsp").default_capabilities()'';
        servers = {
          clangd.enable = true;
          lua-ls.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          gopls.enable = true;
          nil_ls.enable = true;
          metals = {
            enable = true;
            package = pkgs.metals;
          };
          # csharp-ls = { enable = true; };
          omnisharp = { enable = true; };
          yamlls.enable = true;
          terraformls.enable = true;
          pyright.enable = true;
          dockerls.enable = true;
          marksman = {
            enable = true;
            autostart = true;
          };
        };

        keymaps = {
          diagnostic = {
            "<leader>dj" = "goto_next";
            "<leader>dk" = "goto_prev";
          };

          lspBuf = {
            "K" = "hover";
            "gD" = "references";
            "gd" = "definition";
            "gi" = "implementation";
            "gt" = "type_definition";
            "fm" = "format";
            "<leader>la" = "code_action";
          };
        };
      };

    };

    extraPlugins = [
      {
        plugin = pkgs.vimPlugins.harpoon2;
        config = builtins.readFile ./configs/harpoon.vim;
      }
      {
        plugin = pkgs.vimPlugins.nvim-metals;
        config = builtins.readFile ./configs/metals.vim;
      }
      { plugin = pkgs.vimPlugins.vim-dadbod; }
      { plugin = pkgs.vimPlugins.vim-dadbod-ui; }
      {
        plugin = pkgs.vimPlugins.vim-dadbod-completion;
        # config = builtins.readFile ./configs/dadbod.vim;
      }
      { plugin = pkgs.vimPlugins.lazygit-nvim; }
      {
        plugin = pkgs.vimPlugins.nvim-dap-ui;
        config = builtins.readFile ./configs/dap-ui.vim;
      }
    ];

    keymaps = import ./configs/keymaps.nix;
  };
}
