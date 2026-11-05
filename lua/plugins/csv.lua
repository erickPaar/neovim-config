return {
  -- CSV/TSV as an aligned table. Only the display changes: the file keeps its commas, so saving
  -- and git diffs are untouched.
  {
    "hat0uma/csvview.nvim",
    ft = { "csv", "tsv" },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
    opts = {
      parser = { comments = { "#", "//" } },
      view = {
        -- "border" draws a │ between columns; "highlight" only colors the delimiters
        display_mode = "border",
      },
      keymaps = {
        -- Text objects for a field: `dif` deletes its content, `vaf` selects it with the comma
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Move between fields and rows like a spreadsheet
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
    keys = {
      { "<leader>tc", "<cmd>CsvViewToggle<cr>", desc = "CSV table view", ft = { "csv", "tsv" } },
    },
    config = function(_, opts)
      require("csvview").setup(opts)
      -- Open CSV/TSV files already aligned; Space t c switches back to the raw text
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("csvview_auto", { clear = true }),
        pattern = { "csv", "tsv" },
        callback = function(ev)
          require("csvview").enable(ev.buf)
        end,
      })
      -- The buffer that triggered loading the plugin already passed its FileType event
      local buf = vim.api.nvim_get_current_buf()
      if vim.tbl_contains({ "csv", "tsv" }, vim.bo[buf].filetype) then
        require("csvview").enable(buf)
      end
    end,
  },
}
