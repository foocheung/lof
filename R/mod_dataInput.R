#' dataInput UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#'
addResourcePath("d", "inst/app/www/")
mod_dataInput_ui <- function(id){
  ns <- NS(id)

  tagList(
   # tabsetPanel(
    #  tabPanel(
    shinydashboard::dashboardSidebar(
      shinydashboard::sidebarMenu(id = "Options",
      fileInput(ns("id"), label="Upload tab delimited file",
              multiple = FALSE,
              accept = c("text/csv",
                         "text/comma-separated-values,text/plain",
                         ".csv",
                         ".tsv"
            )
    )
    ))
  )

}

#' dataInput Server Functions
#'
#' @noRd
mod_dataInput_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    userFile <- reactive({
      validate(need(input$id !="", "Hello Please import a data file"))
      input$id
    })

    datafile <- reactive({
     # read.csv(userFile()$datapath, header=T, fill=TRUE, sep="\t")


      readr::read_tsv(userFile()$datapath)

      # utils::read.table(userFile()$datapath,
      #                   header = FALSE,
      #                   sep = "\t",
      #                   row.names = NULL,
      #                   skip = 1,
      #                   stringsAsFactors = FALSE)

    })


    return(list(df =datafile
                )
           )

    #bat <- reactive({
    #  input$integer
    #})
    #return(
    #list(
    #    c(
    #    "dat"=datafile
        #,
        #"batches" = reactive({ input$integer }),
        #"sim" = reactive({ input$sim })
    #  ))
    #)



   # return(list(c("datafile" = datafile, "userFile" = userFile)))
  })

}

## To be copied in the UI
# mod_dataInput_ui("dataInput_1")

## To be copied in the server
# mod_dataInput_server("dataInput_1")
