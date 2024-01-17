{
  plugins.dap = {
    enable = true;
    configurations = {
      scala = [{
        name = "RunOrTest";
        request = "launch";
        type = "scala";
      }];
    };
    extensions = { dap-ui = { enable = true; }; };
  };
}
