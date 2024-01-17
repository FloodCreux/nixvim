{
  plugins.lsp = {
    enable = true;
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

        extraOptions = {
          tvp = { icons.enabled = true; };

          init_options.statusBarProvider = "on";

          settings = {
            showImplicitArguments = true;
            excludedPackages =
              [ "akka.actor.typed.javadsl" "com.github.swagger.akka.javadsl" ];
            enableSemanticHighlighting = false;
            mavenScript =
              "mvn ch.epfl.scala:bloop-maven-plugin:2.0.0:bloopInstall";
          };
        };
      };
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
