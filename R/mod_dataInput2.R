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
mod_dataInput_ui2 <- function(id){
  ns <- NS(id)

  tagList(
   # tabsetPanel(
    #  tabPanel(
    shinydashboard::dashboardSidebar(
      shinydashboard::sidebarMenu(id = "Options",
              sliderInput(inputId=ns("ksize"), label = "K", min=1, max=100, value=20, width=300,step = 1, ticks=T),

              sliderInput(ns("size"), label = "Plot Height Size:", min=300, max=2000, value=760, width=300,step = 10, ticks=T),
              sliderInput(inputId=ns("wsize"), label = "Plot Width Size:", min=300, max=2000, value=1000, width=300,step = 10, ticks=T),

                                  # HTML('<BR><BR><BR><BR>'),
              uiOutput(ns("col")),

              actionButton(ns("goButtonp"), "Go!",icon("paper-plane"),
              style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
              screenshotButton(ns("scrB"),label="Captureentirepage")

    ))
  )

}


# Module Server

#' @noRd
#' @export
#' @keywords internal

mod_dataInput_server2 <- function(input, output, session, file){  #,batches,sim){
  ns <- session$ns


  output$col <- renderUI({
    ##sliderInput(inputId="dat_st", label = "Data Starts Here"),

    res<<-file$df()

      tagList(

      selectInput(ns("rn"), "Column Containing Row Name ",  colnames(res) ),
      selectInput(ns("data_st"), "Data Starts Here",  colnames(res)),

      checkboxInput(ns("addgroup"), "Add Group Info", FALSE),
      checkboxInput(ns("remove_size"), "Remove Size Info", FALSE),
      conditionalPanel(condition="input.addgroup=='1'",  ns = ns ,
                       selectInput(ns("gp"), "Group Column",  colnames(res))
      )

    )


  })


  return(list(rn = reactive({input$rn}),
              data_st   = reactive({input$data_st}),
              addgroup   = reactive({input$addgroup}),
              remove_size   = reactive({input$remove_size}),
              gp   = reactive({input$gp}),
              size   = reactive({input$size}),
              wsize   = reactive({input$wsize}),
              ksize   = reactive({input$ksize}),
              goButtonp= reactive({input$goButtonp})


  )
  )



}

## To be copied in the UI
# mod_dataInput_ui("dataInput_1")

## To be copied in the server
# mod_dataInput_server("dataInput_1")
