local M = {}

local function qf_isopen()
  local r = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      r = true
    end
  end
  return r
end

M.setup = function()
  M.ctoggle = function ()
    if qf_isopen() then
      vim.cmd "cclose"
    else
      vim.cmd "copen"
    end
  end

  M.cc_wo_focus = function()
    local qfwin = vim.api.nvim_get_current_win();
    vim.cmd ".cc"
    vim.api.nvim_set_current_win(qfwin)
  end
end

return M
