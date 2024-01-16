{
  plugins.neorg = {
    enable = true;

    modules = {
      "core.defaults" = {
        __empty = null;
      };
      "core.completion" = {
        config = {
          engine = "nvim-cmp";
        };
      };
      "core.dirman" = {
        config = {
          workspaces = {
            personal = "~/notes/personal";
            work = "~/notes/work";
          };
          index = "index.norg";
        };
      };
    };
  };
}
