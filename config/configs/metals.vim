:lua << EOF
local metals = require("metals")
local telescope = require("telescope")
local cmp_lsp = require("cmp_nvim_lsp")
local dap = require("dap")

local metals_config = metals.bare_config()

local map = vim.keymap.set

metals_config.tvp = {
  icons = {
    enabled = true,
  },
}


dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = {
    "akka.actor.typed.javadsl",
    "com.github.swagger.akka.javadsl",
  },
  enableSemanticHighlighting = false,
  mavenScript = "mvn ch.epfl.scala:bloop-maven-plugin:2.0.0:bloopInstall",
}

local capabilities = cmp_lsp.default_capabilities()

metals_config.capabilities = capabilities

metals_config.init_options.statusBarProvider = "on"

metals_config.on_attach = function(_, bufnr)
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

  map("n", "<leader>dc", function()
    require("dap").continue()
  end)

  map("n", "<leader>dr", function()
    require("dap").repl.toggle()
  end)

  map("n", "<leader>dK", function()
    require("dap.ui.widgets").hover()
  end)

  map("n", "<leader>dt", function()
    require("dap").toggle_breakpoint()
  end)

  map("n", "<leader>dso", function()
    require("dap").step_over()
  end)

  map("n", "<leader>dsi", function()
    require("dap").step_into()
  end)

  map("n", "<leader>dl", function()
    require("dap").run_last()
  end)
end

metals_config.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "",
    },
  })

local function metals_status_handlers(err, status, ctx)
  local val = {}
  local text = status.text:gsub("[⠇⠋⠙⠸⠴⠦]", ""):gsub("^%s*(.-)%s*$", "%1")
  if status.hide then
    val = { kind = "end" }
  elseif status.show then
    val = { kind = "begin", title = text }
  elseif status.text then
    val = { kind = "report", message = text }
  else
    return
  end

  local msg = { token = "metals", value = val }
  vim.lsp.handlers["$/progress"](err, msg, ctx)
end

metals_config.handlers = { ["metals/status"] = metals_status_handlers }

metals_config.find_root_dir_max_project_nesting = 15

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
          metals.initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

EOF
