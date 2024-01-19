{ pkgs, ... }: {
  imports = [
    ./configs/conform.nix
    ./configs/dap.nix
    ./configs/gitsigns.nix
    ./configs/lualine.nix
    ./configs/neorg.nix
    ./configs/noice.nix
    ./configs/notify.nix
    ./configs/nvim-cmp.nix
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

      # harpoon = {
      #   enable = true;
      #
      #   package = pkgs.vimPlugins.harpoon2;
      #
      #   enableTelescope = true;
      #   markBranch = true;
      #
      #   keymaps = {
      #     addFile = "<leader>ha";
      #     toggleQuickMenu = "<leader>hm";
      #     navFile = {
      #       "1" = "<C-h>";
      #       "2" = "<C-j>";
      #       "3" = "<C-k>";
      #       "4" = "<C-l>";
      #     };
      #   };
      # };

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
          nil_ls.enable = true;
          metals = {
            enable = true;
            package = pkgs.metals;
          };
          csharp-ls = { enable = true; };
          omnisharp = { enable = true; };
          yamlls.enable = true;
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
            "la" = "code_action";
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
    ];

    keymaps = [
      {
        action = "<cmd>Explore<CR>";
        key = "<leader>pv";
        options = { desc = "Explore"; };
      }
      {
        action = "<cmd>Git<CR>";
        key = "<leader>gi";
        options = { desc = "Git UI"; };
      }
      {
        action = "<cmd>Git push origin<CR>";
        key = "<leader>gpp";
        options = { desc = "Git Push Origin"; };
      }
      {
        action = ":m '>+1<CR>gv=gv";
        key = "J";
        mode = [ "v" ];
      }
      {
        action = ":m '<-2<CR>gv=gv";
        key = "K";
        mode = [ "v" ];
      }
      {
        action = "<cmd>Neorg workspace work<CR>";
        key = "<leader>nww";
        options = { desc = "Neorg Worspace: Work"; };
        mode = [ "n" ];
      }
      {
        action = "<cmd>Neorg workspace personal<CR>";
        key = "<leader>nwp";
        options = { desc = "Neorg Worspace: Personal"; };
        mode = [ "n" ];
      }
      {
        action = "<cmd>Neorg return<CR>";
        key = "<leader>nx";
        options = { desc = "Neorg Worspace: Close Buffers"; };
        mode = [ "n" ];
      }
      {
        action = "<cmd>lua vim.lsp.codelens.run<CR>";
        key = "<leader>lc";
        options = { desc = "CodeLens"; };
        mode = [ "n" ];
      }
    ];
  };
}
