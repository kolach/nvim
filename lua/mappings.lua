require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Oil file browser
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Move lines
map("n", "<C-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<C-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move block up" })
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- Toggle inlay hints
map("n", "<leader>ci", function()
  local enable = not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }
  vim.lsp.inlay_hint.enable(enable, { bufnr = 0 })
end, { desc = "Toggle inlay hints" })

-- Lsp navigation
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
map("n", "gr", vim.lsp.buf.references, { desc = "Goto references" })

-- Rust
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    map("n", "<leader>cr", ":Cargo run<CR>", { desc = "Cargo run", buffer = true })
    map("n", "<leader>ct", ":Cargo test<CR>", { desc = "Cargo test", buffer = true })
    map("n", "<leader>cc", ":Cargo check<CR>", { desc = "Cargo check", buffer = true })
    map("n", "<leader>cb", ":Cargo build<CR>", { desc = "Cargo build", buffer = true })
    map("n", "<leader>dl", "<cmd> RustLsp! debuggables <CR>", { desc = "Run last configuration" })
  end,
})

-- Go
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    local dapgo = require "dap-go"
    map("n", "<leader>dgt", dapgo.debug_test, { desc = "Debug go test", buffer = true })
    map("n", "<leader>dgl", dapgo.debug_last_test, { desc = "Debug last go test", buffer = true })
  end,
})

-- Cargo
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "Cargo.toml",
  callback = function()
    local crates = require "crates"
    map("n", "<leader>rcu", crates.upgrade_all_crates, { desc = "Upgrade all creates", buffer = true })
    map("n", "<leader>rch", crates.open_homepage, { desc = "Open home page", buffer = true })
    map("n", "<leader>rcr", crates.open_repository, { desc = "Open repository", buffer = true })
    map("n", "<leader>rcD", crates.open_documentation, { desc = "Open documentation", buffer = true })
    map("n", "<leader>rcv", function()
      crates.show_versions_popup()
      crates.focus_popup()
    end, { desc = "Show versions", buffer = true })
    map("n", "<leader>rcf", function()
      crates.show_features_popup()
      crates.focus_popup()
    end, { desc = "Show features", buffer = true })
    map("n", "<leader>rcd", crates.show_dependencies_popup, { desc = "Show dependencies", buffer = true })
  end,
})

-- Dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Run or continue debugger" })
map("n", "<leader>duc", require("dapui").close, { desc = "Close debugger UI" })
map("n", "<leader>duo", require("dapui").open, { desc = "Open debugger UI" })
map("n", "<leader>dl", require("dap").run_last, { desc = "Run last configuration" })
map("n", "<F5>", require("dap").continue, { desc = "Start/Continue" })
map("n", "<F4>", "<cmd> DapTerminate <cr>", { desc = "Stop debugger" })
map("n", "<F10>", require("dap").step_over, { desc = "Step over" })
map("n", "<F11>", require("dap").step_into, { desc = "Step into" })
map("n", "<F12>", require("dap").step_out, { desc = "Step out" })
map("n", "<leader>dj", require("dap.ext.vscode").load_launchjs, { desc = "Load launch.json" })
map("n", "<leader>di", function()
  local dap = require "dap"
  local configs = vim.inspect(dap.configurations)
  -- Create a new buffer and window for the output
  vim.cmd "new"
  vim.cmd "setlocal buftype=nofile bufhidden=wipe noswapfile"
  -- Set the content of the buffer to the configurations
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(configs, "\n"))
end, { desc = "Inspect configurations" })

-- Trouble
map("n", "<leader>td", "<cmd> Trouble diagnostics toggle <CR>", { desc = "Trouble: diagnostics" })
map("n", "<leader>tb", "<cmd> Trouble diagnostics toggle filter.buf=0 <CR>", { desc = "Trouble: buffer diagnostics" })
map("n", "<leader>ts", "<cmd> Trouble symbols toggle focus=false <CR>", { desc = "Trouble: symbols" })
map(
  "n",
  "<leader>tL",
  "<cmd> Trouble lsp toggle focus=false win.position=right <CR>",
  { desc = "Trouble: LSP definitions / references / ..." }
)
map("n", "<leader>tl", "<cmd> Trouble loclist toggle<CR>", { desc = "Trouble: location list" })
map("n", "<leader>tq", "<cmd> Trouble qflist toggle<CR>", { desc = "Trouble: quickfix list" })

-- Terminal
map("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- HTTP
vim.api.nvim_create_autocmd("FileType", {
  pattern = "http",
  callback = function()
    map(
      "n",
      "<leader>kk",
      require("kulala").jump_prev,
      { desc = "Kulala jump previous", noremap = true, silent = true }
    )
    map("n", "<leader>kj", require("kulala").jump_next, { desc = "Kulala jump next", noremap = true, silent = true })
    map("n", "<leader>kl", require("kulala").run, { desc = "Kulala run", noremap = true, silent = true })
  end,
})
