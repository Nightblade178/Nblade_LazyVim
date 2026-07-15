return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark",
        colors = {
          red = "#FF5F5F",
          cyan = "#87D7ff",
          -- blue = "#61AFEF",
        },
        highlights = {
          -- SnacksDashboardHeader = { fg = "#FF5F5F" },
          SnacksDashboardFooter = { fg = "#FF5F5F" },
          SnacksDashboardSpecial = { fg = "#FF5F5F" },
        },
      })
      require("onedark").load()
    end,
  },
}
