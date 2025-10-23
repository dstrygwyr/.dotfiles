return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = false,
      },
      lazygit = {
        -- Let LazyGit use its own config file
        configure = false,
      },
      picker = {
        finder = "fd",
      },
    },
  },
}
