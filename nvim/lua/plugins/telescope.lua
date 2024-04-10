return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"

    telescope.setup {
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    }

    telescope.load_extension "fzf"

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- buffer specific
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "[F]ind [B]uffers" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "[F]ind current [W]ord" })
    keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "[F]ind [D]iagnostics" })

    -- LSP specific
    keymap.set("n", "<leader>rR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references " })
    keymap.set("n", "<leader>rd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
    keymap.set("n", "<leader>ri", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
    keymap.set("n", "<leader>rt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
    keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })

    -- git commands
    keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Find [G]it [F]iles" })
    keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Find [G]it [C]ommits" })
    keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", { desc = "Find [G]it [F]ile [C]ommits" })
    keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Find [G]it [B]ranches" })
    keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Find [G]it [S]tatus" })
  end,
}
