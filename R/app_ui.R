#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
#'
## usethis::use_pipe()
app_ui <- function() {
#  tagList(
    # Leave this function for adding external resources
    # golem_add_external_resources(),
    # List the first level UI elements here
    shinyUI( pageWithSidebar(
      HTML("<CENTER><H2>Anomaly detection with Local Outlier Factor (LOF)"),
        # "",
      #theme="paper",
      tabPanel(
  "Test Load Data",
        sidebarPanel(
          mod_dataInput_ui(
            "dataInput_ui_meta"
          ),
          mod_dataInput_ui2(
            "dataInput_ui_meta2"
          )
          )
        ),
      mainPanel(

        tabsetPanel(

        mod_box_ui("tbl_box"),
        mod_lof_ui("lof_box")
#)
        )
 #     )
    )
  )
)
}


golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = ''
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
