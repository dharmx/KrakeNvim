local M = {}

local function use(plugin)
  table.insert(M, plugin)
end

use { "danymat/neogen", after = "nvim-treesitter" }

use {
  "nvim-treesitter/nvim-treesitter",
  wants = {
    "nvim-treesitter-refactor",
    "nvim-ts-rainbow",
    "nvim-treesitter-textobjects",
    "playground",
    "nvim-ts-autotag",
    "nvim-treesitter-context",
    "nvim-gps",
    "spellsitter.nvim",
    "nvim-treesitter-textsubjects",
    "nvim-treesitter-commonlisp",
  },
  config = function()
    require "configs.treesitter"
  end,
  opt = true,
}

use { "theHamsta/nvim-treesitter-commonlisp", opt = true }

use { "RRethy/nvim-treesitter-textsubjects", opt = true }

use { "andymass/vim-matchup", opt = true }

use { "nvim-treesitter/nvim-treesitter-refactor", opt = true }

use { "p00f/nvim-ts-rainbow", opt = true }

use { "nvim-treesitter/nvim-treesitter-textobjects", opt = true }

use { "nvim-treesitter/playground", opt = true }

use { "windwp/nvim-ts-autotag", opt = true }

use {
  "romgrk/nvim-treesitter-context",
  opt = true,
  config = function()
    require "configs.treesitter.plugins.context"
  end,
}

use {
  "SmiteshP/nvim-gps",
  opt = true,
  config = function()
    require "configs.treesitter.plugins.gps"
  end,
}

use {
  "lewis6991/spellsitter.nvim",
  opt = true,
  config = function()
    require "configs.treesitter.plugins.spellsitter"
  end,
}

return M

-- vim:ft=lua