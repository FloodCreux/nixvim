{ pkgs, ... }: {
  plugins.lsp = {
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
      metals = { enable = true; };
      # csharp-ls = {
      #   enable = true;
      # };
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
}
