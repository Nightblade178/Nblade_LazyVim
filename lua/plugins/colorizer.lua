return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = { "*" },
    options = {
      parsers = {
        names = { enable = false },         -- turn off "blue"/"cyan" word matching
        hex = {
          default = true,                   -- covers rgb/rgba/rrggbb
          no_hash = true,                   -- <-- this is what you need: matches bare hex like 838ba7
        },
      },
      display = {
        mode = "background",
      },
    },
  },
}
