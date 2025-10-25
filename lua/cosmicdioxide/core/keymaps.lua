-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

--- General Keymaps ---

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "Visual",
      timeout = 100,
    })
  end,
})

-- Toggle word wrap
vim.keymap.set("n", "<leader>uw", function()
  vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Toggle word wrap" })

--use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", "_x")

-- increment/decrement number
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>+", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sz", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sx", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sd", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Focus on left window" })
keymap.set("n", "<leader>sl", "<C-w>l", { desc = "Focus on right window" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- buffers
keymap.set("n", "<leader>bd", "<cmd>bd", { desc = "Close current buffer" })
keymap.set("n", "<leader>bD", "<cmd>bufdo bd", { desc = "Close all buffers" })
