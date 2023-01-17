local ok, trouble = pcall(require, "trouble")
if not ok then return end
local MainConfig = require("dharmx")

local config = {
  position = "bottom",
  height = 10,
  width = 50,
  icons = true,
  mode = "document_diagnostics",
  fold_open = MainConfig.ui.trouble.fold_opened,
  fold_closed = MainConfig.ui.trouble.fold_closed,
  group = true,
  padding = true,
  action_keys = {
    close = "q",
    cancel = "<esc>",
    refresh = "r",
    jump = { "<cr>", "<tab>" },
    open_split = { "<c-x>" },
    open_vsplit = { "<c-v>" },
    open_tab = { "<c-t>" },
    jump_close = { "o" },
    toggle_mode = "m",
    toggle_preview = "P",
    hover = "K",
    preview = "p",
    close_folds = { "zM", "zm" },
    open_folds = { "zR", "zr" },
    toggle_fold = { "zA", "za" },
    previous = "k",
    next = "j",
  },
  indent_lines = true,
  auto_open = false,
  auto_close = true,
  auto_preview = true,
  auto_fold = true,
  auto_jump = { "lsp_definitions" },
  signs = MainConfig.ui.trouble.sign,
  use_diagnostic_signs = false,
}

trouble.setup(config)

-- vim:filetype=lua
