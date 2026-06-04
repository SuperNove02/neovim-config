return {
  'tomtomjhj/vsrocq.nvim',
  filetypes = 'coq',
  dependecies = {
    {
      'whonore/Coqtail',
      init = function()
          vim.g.loaded_coqtail = 1
          vim.g["coqtail#supported"] = 0
      end,
    },

  },
  opts = {
    vsrocq = {  },
    lsp = {  },
  },

}



