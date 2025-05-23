# ensure this is executed in root of repository
library(rix)

rix(
  r_ver = "4.4.0",
  r_pkgs = c("dplyr", "kableExtra", "magrittr", "desc", "purrr", "renv", "quarto", "pkglite"),
  system_pkgs = c("dejavu_fonts", "quarto"),
  tex_pkgs = c("amsmath", "framed", "multirow", "wrapfig", "tabu", "threeparttable", "threeparttablex", "environ", "makecell", "tcolorbox", "tikzfill", "pdfcol", "fontawesome5"),
  ide = "none",
  project_path = ".",
  overwrite = TRUE,
  print = TRUE
)
