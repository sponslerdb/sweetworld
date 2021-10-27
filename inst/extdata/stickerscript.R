library(magick)
library(hexSticker)
s <- image_read("~/sweetworld/inst/extdata/hex_sticker1_baseplot.png")

sticker(s, package="sweetworld", p_size=20,
        s_x=1,
        s_y=1,
        s_width=1.5,
        s_height=1.5,
        p_y = 1.05,
        p_color = "forestgreen",
        h_fill="white", h_color="forestgreen", filename="~/sweetworld/inst/extdata/hex_sticker1.png")
