app_server <- function(input, output, session) {
  # List the first level callModules here

  metafile <<- mod_dataInput_server("dataInput_ui_meta")

  metafile2<-callModule(mod_dataInput_server2, "dataInput_ui_meta2", metafile)
  callModule(mod_box_server, "tbl_box", metafile,metafile2)
  callModule(mod_lof_server, "lof_box", metafile,metafile2)
  #genefile <- mod_dataInput_server("dataInput_ui_gene")

  #callModule(mod_table_server, "table_ui_2", genefile,10, 2)

}
