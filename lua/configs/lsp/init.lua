local present, installer = pcall(require, "nvim-lsp-installer")

if not present then
  return
end

local servers = {
  ["bashls"] = {},
  ["diagnosticls"] = {},
  ["eslint"] = {},
  ["grammarly"] = {},
  ["html"] = {},
  ["cssls"] = {},
  ["jsonls"] = require "configs.lsp.servers.jsonls",
  ["pyright"] = {},
  ["sqlls"] = {},
  ["stylelint_lsp"] = {},
  ["texlab"] = {},
  ["yamlls"] = {},
  ["sumneko_lua"] = require "configs.lsp.servers.sumneko_lua",
  ["emmet_ls"] = require "configs.lsp.servers.emmet_ls",
  ["vimls"] = {},
}

local function on_attach(client, buffer)
  require("configs.lsp.mappings").setup(client.name, buffer)
  require("configs.lsp.autocmds").setup(client)
  require("configs.lsp.commands").setup()
  require("configs.lsp.icons").setup()

  client.resolved_capabilities.document_formatting = true
  client.resolved_capabilities.document_range_formatting = true
end

local function configure_installer()
  installer.settings {
    ui = {
      icons = {
        server_installed = "",
        server_pending = "◍",
        server_uninstalled = "ﮁ",
      },
      keymaps = require("mappings").lsp_installer_nvim,
    },
    install_root_dir = vim.fn.stdpath "data" .. "/lsp_servers",
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 5,
  }
end

local function ensure_servers()
  for name, _ in pairs(servers) do
    local found, server = installer.get_server(name)
    if found and not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
  api.nvim_notify(
    "Installed " .. table.concat(vim.tbl_keys(servers), "\n"),
    vim.log.levels.INFO,
    { icon = " ", title = "nvim-lsp-installer" }
  )
end

local function configure_servers()
  installer.on_server_ready(function(server)
    local capabilities = require "configs.lsp.capabilities"
    local flags = { debounce_text_changes = 150 }
    local handlers = require("configs.lsp.handlers").handlers

    local server_config = {
      flags = flags,
      capabilities = capabilities,
      on_attach = on_attach,
      handlers = handlers,
    }

    server:setup(vim.tbl_extend("keep", server_config, servers[server.name]))
  end)
end

local function configure_diagnostics()
  vim.diagnostic.config {
    virtual_text = { prefix = " ", source = "always" },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      source = "always",
    },
  }
end

configure_diagnostics()
configure_installer()
ensure_servers()
configure_servers()

-- vim:ft=lua
