
local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
    stdin = true
 }
end

local rome = function()
  return {
    exe = "rome ",
    args = {"format --stdin-file-path", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), ''},
    stdin = true
 }
end

--plugin-search-dir=./dir-with-plugins --plugin=prettier-plugin-foo

require('formatter').setup({
  filetype = {
    json = { rome },
    javascript = { rome },
    javascriptreact = { rome},
    html= { rome },
    css = { rome },
    scss = { rome }
  }
})
