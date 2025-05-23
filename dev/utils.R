create_app_pkglite_bundle <- function(app_dir = "submissions-pilot2") {
  # define specifications for shiny app bundle
  app_spec <- pkglite::file_spec(
    ".", 
    pattern = "\\.R$|\\.r$", 
    format = "text", 
    recursive = FALSE
  )
  
  app_source_spec <- pkglite::file_spec(
    "R",
    pattern = "\\.R",
    format = "text",
    recursive = FALSE
  )
  
  renv_spec <- pkglite::file_spec(
    ".",
    pattern = "\\.lock",
    format = "text",
    recursive = FALSE
  )
  
  renv_spec2 <- pkglite::file_spec(
    "renv",
    pattern = "\\.R$",
    format = "text",
    recursive = FALSE
  )
  
  renv_spec3 <- pkglite::file_spec(
    "renv/cellar",
    pattern = "\\.tar.gz|\\.zip",
    format = "binary",
    recursive = TRUE
  )
  
  golem_spec <- pkglite::file_spec(
    "dev",
    pattern = "^run",
    format = "text",
    recursive = FALSE
  )
  
  file_ectd2 <- pkglite::file_spec(
    ".",
    pattern = "^DESCRIPTION$|^NAMESPACE$|^README$|^README\\.md$|^NEWS$|^NEWS\\.md$|^LICENSE$|\\.Rbuildignore$|\\.Rprofile$|\\.Renviron$",
    format = "text",
    recursive = FALSE,
    ignore_case = FALSE,
    all_files = TRUE
  )

  pkglite::collate(
    pkg = app_dir,
    file_ectd2,
    pkglite::file_auto("inst"), 
    app_spec, 
    app_source_spec,
    renv_spec,
    renv_spec2,
    renv_spec3,
    golem_spec
  ) |>
    pkglite::pack(output = file.path("dev", "r1pkg.txt"))
}
