return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true, -- dotfiles / 隠しファイルを表示
        ignored = false, -- .gitignore されたものは表示しない

        sources = {
          files = {
            hidden = true,
            ignored = false,
          },
        },
      },
    },
  },
}
