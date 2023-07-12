#' table UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList

`%>%` <- dplyr::`%>%`

addResourcePath("d", "inst/app/www/")

mod_lof_ui <- function(id, name){
    ns <- NS(id)


#tabsetPanel(

       tabPanel( "PCA" ,
                 fluidRow(
                   column(5,
                          div(

                            uiOutput(ns('lout1'))

                          )

                   )

                 )
       )




#)

}




# Module Server

#' @rdname mod_lof
#' @export
#' @keywords internal

mod_lof_server <- function(input, output, session, file, file2){  #,batches,sim){
  ns <- session$ns


    output$lout1 <- renderUI({


      req(file2$goButtonp())


      tagList(

        plotOutput(ns("plot"),height=file2$size(),width=file2$wsize())
      )

    })




    output$plot <- renderPlot({

      req(file2$goButtonp())

      Arn2<<-file2$rn()
      Astst<<- file2$data_st()
      Arnrn<<- file2$rn()

      Assss<<- file2$size()
      Awwwsize<<- file2$wsize()
      Akkkksize<<- file2$ksize()

      Adffff<<- file$df()

      d<-file$df() #%>%  dplyr::filter(drop_na(!! rlang::sym(input$rn)))
      Atttt<<-d
      d<- d %>%  dplyr::filter(!is.na(!! rlang::sym(file2$rn())))
      Atttt2<<-d

      # ttt<<-"hello"
      counts<-d[, c(which(colnames(d) %in% file2$data_st()):length(d))]
      ccoco<<-counts
      # counts <- a[41:length(a)]
      # rownames(counts) <- d$reposid




      a<-(file$df())
      a <- a %>%  filter(!is.na(!! rlang::sym(file2$rn())) )
      aaaa<<-a


      rownames(a)<-make.names(t(a[which(colnames(a) %in% file2$rn())]),unique = TRUE)
      ##b<-a[, c(3,10:length(a))]
      b<-a
      rownames(b)<-make.names(t(a[which(colnames(a) %in% file2$rn())]),unique = TRUE)




      d<-b
    #  ff<-md()$infilename$name
     # ffff<<-ff

      data<-cbind(d[,1: c(which(colnames(d) %in% file2$data_st()))],
                  lofactor(d[, c(which(colnames(d) %in% file2$data_st()):length(d))], file2$ksize()))

      data<-as.tibble(data)


      colnames(data)[length(data)] <- "lof"
      data$lof<-as.numeric(data$lof)
      rownames(data)<-make.names(t(data[which(colnames(data) %in% file2$rn())]),unique = TRUE)


      stat<-file2$data_st()

      #   autoplot(prcomp(data[, c(which(colnames(data) %in% input$data_st):length(data)-1)],scale=TRUE,center=TRUE),data=data,text=TRUE,label=TRUE,size=as.numeric(data$lof))
      #,colour='Group'

      d<-as.data.frame(d)
      # res.pca <- PCA(d[, c(which(colnames(d) %in% input$data_st):length(d))], graph = FALSE)
      #fviz_pca_ind(res.pca, pointsize = as.numeric(data$V2),
      #             repel = FALSE
      #  )


      #dddd<<-input$gp


      # dfdat<- d %>% select_if(is.numeric) %>%  select(-(1:input$data_st))
      dfdat<-d[, c(which(colnames(d) %in% file2$data_st()):length(d))]

      dddfff<<-dfdat
      rownames(dfdat)<-t(d[file2$rn()])
ggg<<-file2$addgroup()
rmmms<<-file2$remove_size()


      if ((file2$addgroup() == TRUE) && (file2$remove_size() == FALSE)){
#if (file2$remove_size() == FALSE){
        fviz_pca_ind( prcomp(dfdat, scale. = TRUE), pointsize = as.numeric(data$lof),
                      repel = TRUE ,
                      habillage  = as.factor(t(data[,file2$gp()])),addEllipses = TRUE #,title = #md()$infilename$name
        )  +  theme_grey(base_size = 12)
      }



      else  if ((file2$addgroup() == TRUE && file2$remove_size() == TRUE)){
#else  if (file2$remove_size() == TRUE){
        fviz_pca_ind(prcomp(dfdat, scale. = TRUE),
                     repel = TRUE ,
                     habillage  = as.factor(t(data[,file2$gp])),addEllipses = TRUE #,title = #md()$infilename$name
        )  +  theme_grey(base_size = 12)
      }

      else{
        fviz_pca_ind(
          prcomp(dfdat, scale. = TRUE),
          #res.pca,
          pointsize = as.numeric(data$lof),
          #repel = TRUE,
          # col.ind = as.factor(t(data[,input$rn])), # Color by the quality of representation
          repel = TRUE#,title = #md()$infilename$name
          #, habillage  =as.factor(data$Group),addEllipses = TRUE
        ) +  theme_grey(base_size = 12)
      }




      #})


    })

}
## To be copied in the UI
# mod_table_ui("table_1")

## To be copied in the server
# mod_table_server("table_1")
