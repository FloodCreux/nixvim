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
          terraformls.enable = true;
          pyright.enable = true;
          dockerls.enable = true;
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
      { plugin = pkgs.vimPlugins.lazygit-nvim; }
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
        options = { silent = true; };
      }
      {
        action = ":m '<-2<CR>gv=gv";
        key = "K";
        mode = [ "v" ];
        options = { silent = true; };
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
      {
        action = "<cmd>LazyGit<CR>";
        key = "<leader>gg";
        options = { desc = "LazyGit UI"; };
        mode = [ "n" ];
      }
      {
        action = "function() require('dap').continue() end";
        lua = true;
        key = "<leader>dc";
        options = { desc = "Dap Start/Continue"; };
        mode = [ "n" ];
      }
      {
        action = "function() require('dap').repl.open() end";
        lua = true;
        key = "<leader>dr";
        options = { desc = "Dap Toggle Repl"; };
        mode = [ "n" ];
      }
      {
        action = "function() require('dap.ui.widgets').hover() end";
        lua = true;
        key = "<leader>dK";
        options = { desc = "Dap UI Hover"; };
        mode = [ "n" ];
      }
      {
        action = "function() require('dap').toggle_breakpoint() end";
        lua = true;
        key = "<leader>dt";
        options = { desc = "Dap Toggle Breakpoint"; };
        mode = [ "n" ];
      }
      {
        action = "function() require('dap').step_over() end";
        lua = true;
        key = "<leader>dso";
        options = { desc = "Dap Step Over"; };
        mode = [ "n" ];
      }
      {
        action = "function() require('dap').step_into() end";
        key = "<leader>dsi";
        options = { desc = "Dap Step Into"; };
        mode = [ "n" ];
      }
      {
        action = "function() require('dap').run_last() end";
        lua = true;
        key = "<leader>dl";
        options = { desc = "Dap Run Last"; };
        mode = [ "n" ];
      }
    ];
  };
}
