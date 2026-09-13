-- add deps
vim.pack.add({
  "https://github.com/GustavEikaas/easy-dotnet.nvim",
  "https://github.com/mfussenegger/nvim-dap",
  -- lazy loading
  "https://github.com/lumen-oss/lz.n",
  -- needed for one helper
  "https://github.com/folke/snacks.nvim",
})

-- config
local lzn = require("lz.n")

local extensions = { sln = true, slnx = true, csproj = true, fsproj = true }

lzn.load({
  {
    "easy-dotnet.nvim",
    enabled = function()
      local root = vim.fs.root(0, function (name, _)
        return extensions[vim.fs.ext(name)] == true
      end)

      return root ~= nil
    end,
    after = function()
      print("easy-dotnet enabled")
      require("easy-dotnet").setup({
        lsp = {
          enabled = true,
          preload_roslyn = true,
          roslynator_enabled = true,
          easy_dotnet_analyzer_enabled = true,
          auto_refresh_codelends = true,
        },
        test_runner = {
          auto_start_testrunner = true,
          hide_legend = false,
          ---@type "split" | "vsplit" | "float" | "buf"
          viewmode = "float",
          ---@type number|nil
          vsplit_width = nil,
          ---@type string|nil "topleft" | "topright"
          vsplit_pos = nil,
          icons = {
            passed = "",
            skipped = "",
            failed = "",
            success = "",
            reload = "",
            test = "",
            sln = "󰘐",
            project = "󰘐",
            dir = "",
            package = "",
            class = "",
            build_failed = "󰒡",
          },
          mappings = {
            run_test_from_buffer = { lhs = "<leader>r", desc = "run test from buffer" },
            get_build_errors = { lhs = "<leader>e", desc = "get build errors" },
            peek_stack_trace_from_buffer = { lhs = "<leader>p", desc = "peek stack trace from buffer" },
            debug_test_from_buffer = { lhs = "<leader>d", desc = "run test from buffer" },
            debug_test = { lhs = "<leader>d", desc = "debug test" },
            go_to_file = { lhs = "g", desc = "go to file" },
            run_all = { lhs = "<leader>R", desc = "run all tests" },
            run = { lhs = "<leader>r", desc = "run test" },
            peek_stacktrace = { lhs = "<leader>p", desc = "peek stacktrace of failed test" },
            expand = { lhs = "o", desc = "expand" },
            expand_node = { lhs = "E", desc = "expand node" },
            collapse_all = { lhs = "W", desc = "collapse all" },
            close = { lhs = "q", desc = "close testrunner" },
            refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" },
            cancel = { lhs = "<C-c>", desc = "cancel in-flight operation" },
          },
        },
        auto_bootstrap_namespace = {
          enabled = true,
          type = "file_scoped",
          use_clipboard_json = {
            behavior = "prompt",
            register = "+",
          },
        },
        csproj_mappings = true,
        fsproj_mappings = true,
        picker = "fzf",
        diagnostics = {
          default_severity = "error",
          setqflist = true,
        },
        background_scanning = true,
      })
    end,
  },
})
