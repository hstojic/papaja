# Create environment to store metadata
apa_doc_env <- new.env()

# Create localization object in apa_doc_env
create_apa_lang <- function(lang) {
  # Run only if document is being rendered
  if(length(knitr::opts_knit$get("rmarkdown.pandoc.to")) > 0) {

    # Only one call allowed while rendering
    if(!exists("apa_lang", envir = apa_doc_env, inherits = FALSE)) {

      # Define document language and lock in global environment
      assign("apa_lang", localize(lang), envir = apa_doc_env)
    }
  } else {
    if(exists("apa_lang", envir = apa_doc_env, inherits = FALSE)) {
    }
    apa_doc_env$apa_lang <- localize(lang)
  }
}

# Defines phrases used throughout the manuscript
localize <- function(lang) {
  switch(
    lang
    , list( # Default
      abstract = "Abstract"
      , keywords = "Keywords:"
      , table = "Table"
      , figure = "Figure"
      , note = "Note."
    )
    , german = list(
      abstract = "Zusammenfassung"
      , keywords = "Stichw\u00F6rter:"
      , table = "Tabelle"
      , figure = "Abbildung"
      , note = "Anmerkung."
    )
  )
}
