return {  -- Shows colors next to various types of color codes/names.
  -- For this to work, you need to do:
  -- 1. cd ~/.local/share/nvim/lazy/vim-hexokinase | Or the dir lazy stores it in
  -- 2. make hexokinase
  'RRethy/vim-hexokinase',
  config = function()
    vim.g.Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'
  end,
}
