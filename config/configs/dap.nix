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
  };
}
