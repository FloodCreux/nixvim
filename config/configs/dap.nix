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
    configurations = { };
    extensions = {
      dap-ui = {
        enable = true;
        controls = {
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
