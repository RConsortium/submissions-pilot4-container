# ensure this is executed in root of repository
library(rix)

rix(
  r_ver = "4.4.0",
  r_pkgs = c("dplyr", "kableExtra", "magrittr", "desc", "purrr", "renv"),
  system_pkgs = NULL,
#  git_pkgs = list(
#    list(
#      package_name = "pkginfo",
#      repo_url = "https://github.com/rsquaredacademy/pkginfo",
#      commit = "8a716283eaf53b07130cc5a943cc048db3919ce6"
#    )
#  ),
  ide = "code",
  project_path = ".",
  overwrite = TRUE,
  print = TRUE
)
