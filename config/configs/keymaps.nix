[
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
    options = { silent = true; };
  }
  {
    action = ":m '<-2<CR>gv=gv";
    key = "K";
    mode = [ "v" ];
    options = { silent = true; };
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
  {
    action = "<cmd>lua vim.lsp.codelens.run<CR>";
    key = "<leader>lc";
    options = { desc = "CodeLens"; };
    mode = [ "n" ];
  }
  {
    action = "<cmd>LazyGit<CR>";
    key = "<leader>gg";
    options = { desc = "LazyGit UI"; };
    mode = [ "n" ];
  }
  {
    action = "function() require('dap').continue() end";
    lua = true;
    key = "<leader>dc";
    options = { desc = "Dap Start/Continue"; };
    mode = [ "n" ];
  }
  {
    action = "function() require('dap').repl.open() end";
    lua = true;
    key = "<leader>dr";
    options = { desc = "Dap Toggle Repl"; };
    mode = [ "n" ];
  }
  {
    action = "function() require('dap.ui.widgets').hover() end";
    lua = true;
    key = "<leader>dK";
    options = { desc = "Dap UI Hover"; };
    mode = [ "n" ];
  }
  {
    action = "function() require('dap').toggle_breakpoint() end";
    lua = true;
    key = "<leader>bb";
    options = { desc = "Dap Toggle Breakpoint"; };
    mode = [ "n" ];
  }
  {
    action = "function() require('dap').step_over() end";
    lua = true;
    key = "<leader>dso";
    options = { desc = "Dap Step Over"; };
    mode = [ "n" ];
  }
  {
    action = "function() require('dap').step_into() end";
    key = "<leader>dsi";
    options = { desc = "Dap Step Into"; };
    mode = [ "n" ];
  }
  {
    action = "function() require('dap').run_last() end";
    lua = true;
    key = "<leader>dl";
    options = { desc = "Dap Run Last"; };
    mode = [ "n" ];
  }
];

