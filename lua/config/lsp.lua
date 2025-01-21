local io = require("io")
local concattable = require("utils.concattable")

local lspservers = {
  "angularls",
  "cssls",
  "html",
  "lua_ls",
  "ts_ls",
  "jdtls",
  "clangd"
}

local function lsphandlers(lspconfig)
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local on_attach = require("mapping.lsp")
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  return {
    function(servername)
      lspconfig[servername].setup(opts)
    end,
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            },
          }
        }
      })
    end,
    ["angularls"] = function()
      local initial_root_dir = vim.fn.getcwd()
      --- Create the run server command
      --- @param root_dir string The current root dir
      --- @return table The path params
      local function create_cmd(root_dir)
        -- register the local probe location
        local ts_probe_location = vim.fs.joinpath(root_dir, "node_modules")
        local ng_probe_location = ts_probe_location
        -- check if a local language-service server is installed on the current project.
        local lsp_package_path = vim.fs.joinpath(ts_probe_location, "@angular", "language-service")
        local local_lsp_is_installed = vim.fn.isdirectory(lsp_package_path) == 1
        if not local_lsp_is_installed then
          -- use the global language server
          local ok, mason_registry = pcall(require, 'mason-registry')
          if not ok then
            vim.notify 'mason-registry could not be loaded'
            return {}
          end
          local angularls_path = vim.fs.joinpath(mason_registry.get_package("angular-language-server"):get_install_path(), "node_modules");
          ts_probe_location = angularls_path
          ng_probe_location = vim.fs.joinpath(angularls_path, "@angular", "language-server")
        end
        return { "ngserver", "--stdio", "--tsProbeLocations", ts_probe_location, "--ngProbeLocations", ng_probe_location }
      end

      lspconfig.angularls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = create_cmd(initial_root_dir),
        on_new_config = function(new_config, new_root_dir)
          new_config.cmd = create_cmd(new_root_dir)
        end,
        filetypes = {
          "typescript",
          "html",
          "typescriptreact",
          "typescript.tsx",
          "htmlangular",
        },
      })
    end
  }
end

return {
  lspservers = concattable({ lspservers }),
  lsphandlers = lsphandlers
}
