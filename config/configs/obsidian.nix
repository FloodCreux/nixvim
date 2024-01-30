{
  plugins.obsidian = {
    enable = true;
    completion = { nvimCmp = true; };
    ui = { enable = true; };
    workspaces = [
      {
        name = "work";
        path = "~/vaults/work";
      }
      {
        name = "personal";
        path = "~/vaults/personal";
      }
    ];
  };
}
