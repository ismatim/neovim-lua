
local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
    stdin = true
 }
end

require('formatter').setup({
  filetype = {
    json = { prettier },
    javascript = { prettier },
    javascriptreact = { prettier },
    html= { prettier },
    css = { prettier },
    scss = { prettier }
  }
})
