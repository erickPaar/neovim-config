-- :Jq — run jq on the buffer, or on the selected lines, without saving the file first.
--
--   :Jq {filter}          show the result in a side window (reused on the next :Jq)
--   :Jq -r {filter}       jq options go before the filter: -r (raw strings), -c, -S, ...
--   :Jq! {filter}         replace the buffer (or the selection) with the result; u undoes it
--   :'<,'>Jq {filter}     only the selected lines (they must be valid JSON on their own)
--
-- The filter defaults to "." (pretty-print). Needs jq: sudo apt install jq.

local result_buf

local function show(lines, filetype)
  if not (result_buf and vim.api.nvim_buf_is_valid(result_buf)) then
    result_buf = vim.api.nvim_create_buf(false, true)
    vim.bo[result_buf].bufhidden = "hide"
    vim.api.nvim_buf_set_name(result_buf, "jq://result")
  end
  vim.bo[result_buf].modifiable = true
  vim.api.nvim_buf_set_lines(result_buf, 0, -1, false, lines)
  vim.bo[result_buf].filetype = filetype
  if vim.fn.bufwinid(result_buf) == -1 then
    vim.cmd("vsplit")
    vim.api.nvim_win_set_buf(0, result_buf)
    vim.cmd("wincmd p") -- back to the JSON, ready for the next :Jq
  end
end

vim.api.nvim_create_user_command("Jq", function(opts)
  if vim.fn.executable("jq") == 0 then
    vim.notify("jq is not installed: sudo apt install jq", vim.log.levels.ERROR)
    return
  end

  -- Leading words that start with "-" are jq options; the rest is the filter.
  local flags, rest = {}, vim.trim(opts.args)
  while true do
    local flag, after = rest:match("^(%-%S+)%s*(.*)$")
    if not flag then break end
    table.insert(flags, flag)
    rest = after
  end
  local filter = rest ~= "" and rest or "."

  local first, last = 1, vim.api.nvim_buf_line_count(0)
  if opts.range > 0 then first, last = opts.line1, opts.line2 end
  local input = table.concat(vim.api.nvim_buf_get_lines(0, first - 1, last, false), "\n")

  local cmd = vim.list_extend({ "jq" }, flags)
  table.insert(cmd, filter)
  local res = vim.system(cmd, { stdin = input, text = true }):wait()
  if res.code ~= 0 then
    vim.notify(vim.trim(res.stderr or "jq failed"), vim.log.levels.ERROR) -- jq's message starts with "jq: error"
    return
  end

  local lines = vim.split((res.stdout or ""):gsub("\n$", ""), "\n", { plain = true })
  if opts.bang then
    vim.api.nvim_buf_set_lines(0, first - 1, last, false, lines)
  else
    local raw = vim.tbl_contains(flags, "-r") or vim.tbl_contains(flags, "--raw-output")
    show(lines, raw and "text" or "json")
  end
end, {
  nargs = "?",
  range = true,
  bang = true,
  desc = "Run jq on the buffer or selection",
})
