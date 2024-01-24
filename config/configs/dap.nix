{
  plugins.dap = {
    enable = true;
    adapters = {
      servers = {
        coreclr = {
          executable = {
            command = "netcoredbg";
            args = [ "--interpreter=vscode" ];
          };
        };
        netcoredbg = {
          executable = {
            command = "netcoredbg";
            args = [ "--interpreter=vscode" ];
          };
        };
      };
    };
    configurations = {
      scala = [
        {
          name = "RunOrTest";
          request = "launch";
          type = "scala";
          metals = { runType = "runOrTestFile"; };
        }
        {
          name = "Test Target";
          request = "launch";
          type = "scala";
          metals = { runType = "testTarget"; };
        }
        # {
        #   name = "Test Target";
        #   request = "launch";
        #   type = "scala";
        # }
        # {
        #   name = "Test Case";
        #   request = "launch";
        #   type = "scala";
        # }
      ];
    };
    extensions = {
      dap-ui = {
        enable = true;
        controls = {
          enabled = true;
          icons = {
            pause = "⏸";
            play = "▶";
            step_into = "⏎";
            step_over = "⏭";
            step_out = "⏮";
            step_back = "b";
            run_last = "▶▶";
            terminate = "⏹";
            disconnect = "⏏";
          };
        };
        icons = {
          collapsed = "▸";
          current_frame = "*";
          expanded = "▾";
        };
      };
    };
    extraOptions = {
      keymaps = [
        {
          action = "<cmd>DapContinue<CR>";
          key = "<leader>dc";
          options = { desc = "Dap Start/Continue"; };
          mode = [ "n" ];
        }
        {
          action = "<cmd>DapToggleRepl<CR>";
          key = "<leader>dr";
          options = { desc = "Dap Toggle Repl"; };
          mode = [ "n" ];
        }
        {
          action = "require('dap.ui.widgets').hover()";
          lua = true;
          key = "<leader>dK";
          options = { desc = "Dap UI Hover"; };
          mode = [ "n" ];
        }
        {
          action = "<cmd>DapToggleBreakpoint<CR>";
          key = "<leader>dt";
          options = { desc = "Dap Toggle Breakpoint"; };
          mode = [ "n" ];
        }
        {
          action = "<cmd>DapStepOver<CR>";
          key = "<leader>dso";
          options = { desc = "Dap Step Over"; };
          mode = [ "n" ];
        }
        {
          action = "<cmd>DapStepInto<CR>";
          key = "<leader>dc";
          options = { desc = "Dap Step Into"; };
          mode = [ "n" ];
        }
        {
          action = "require('dap').run_last()";
          lua = true;
          key = "<leader>dl";
          options = { desc = "Dap Run Last"; };
          mode = [ "n" ];
        }
      ];
    };
  };
}
