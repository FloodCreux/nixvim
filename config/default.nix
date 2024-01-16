{ pkgs, ... }: {
  # Import all your configuration modules here
  imports = [
    ./configs/conform.nix
    ./configs/dap.nix
    ./configs/gitsigns.nix
    ./configs/lualine.nix
    ./configs/lspconfig.nix
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
    };

    clipboard.register = "unnamedplus";

    globals.mapleader = " ";

    extraConfigLua = ''
      vim.cmd("set colorcolumn=120")
      vim.opt.nu = true
    '';

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
    };

    extraPlugins = [
      {
        plugin = pkgs.vimPlugins.harpoon2;
        config = ''lua require("harpoon"):setup()'';
      }
      {
        plugin = pkgs.vimPlugins.nvim-metals;
        config = ''lua require("metals").bare_config()'';
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
        action =
          "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>";
        key = "<leader>hm";
        options = { desc = "Harpoon Menu"; };
        mode = [ "n" ];
      }
      {
        action = "<cmd>lua require('harpoon'):list():append()<CR>";
        key = "<leader>ha";
        options = { desc = "Harpoon Add File"; };
        mode = [ "n" ];
      }
      {
        action = "<cmd>lua require('harpoon'):list():select(1)<CR>";
        key = "<C-h>";
        options = { desc = "Harpoon Goto 1"; };
        mode = [ "n" ];
      }
      {
        action = "<cmd>lua require('harpoon'):list():select(2)<CR>";
        key = "<C-j>";
        options = { desc = "Harpoon Goto 2"; };
        mode = [ "n" ];
      }
      {
        action = "<cmd>lua require('harpoon'):list():select(3)<CR>";
        key = "<C-k>";
        options = { desc = "Harpoon Goto 3"; };
        mode = [ "n" ];
      }
      {
        action = "<cmd>lua require('harpoon'):list():select(4)<CR>";
        key = "<C-l>";
        options = { desc = "Harpoon Goto 4"; };
        mode = [ "n" ];
      }
      {
        action = "<cmd>lua require('telescope').extensions.metals.commands<CR>";
        key = "<leader>mc";
        options = { desc = "Metals Commands"; };
        mode = [ "n" ];
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
    ];
  };
}
