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
          tvp = {
            icons.enabled = true;
          };

          init_options.statusBarProvider = "on";

          settings = {
            showImplicitArguments = true;
              excludedPackages = [
                      "akka.actor.typed.javadsl"
                      "com.github.swagger.akka.javadsl"
              ];
              enableSemanticHighlighting = false;
              mavenScript = "mvn ch.epfl.scala:bloop-maven-plugin:2.0.0:bloopInstall";
          };
        };
        
        onAttach = {
          function = ''
                local metals = require("metals")
                local telescope = require("telescope")

		local function mapB(mode, l, r, desc)
			local opts = { noremap = true, silent = true, buffer = bufnr, desc = desc }
			map(mode, l, r, opts)
		end

		metals.setup_dap()
		map("n", "<leader>mc", telescope.extensions.metals.commands, { desc = "Metals commands" })

		mapB("v", "R", metals.type_of_range, "metals: type of range")

		mapB("n", "<leader>mt", require("metals.tvp").toggle_tree_view, "Metals toggle tree view")
		mapB("n", "<leader>mf", "<cmd>MetalsNewScalaFile<cr>", "Metals create new scala file")
		mapB("n", "<leader>mr", require("metals.tvp").reveal_in_tree, "Metals reveal in tree")
		mapB("n", "<leader>msi", function()
			require("metals").toggle_setting("showImplicitArguments")
		end, "Metals show implicit arguments")
		mapB("n", "<leader>mss", function()
			require("metals").toggle_setting("enableSemanticHighlighting")
		end, "Metals show semantic highlights")

		mapB("n", "<leader>lc", vim.lsp.codelens.run, "LSP run code lens")
		mapB("n", "<leader>la", vim.lsp.buf.code_action, "LSP code action")
          '';
        };
      };
      # csharp-ls = {
      #   enable = true;
      # };
      omnisharp = {
        enable = true;
      };
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
        "<leader>fm" = "format";
      };
    };
  };
}
