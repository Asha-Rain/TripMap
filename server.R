
##### Define server logic ####
server = function(input, output){
  
  output$map1 = renderLeaflet(
    leaflet() %>% 
      setView(lng = -68.85029, lat = 45.86758, zoom = 11) %>% 
      addProviderTiles(providers$Esri.WorldTopoMap) %>%
      addMarkers(data = pts1, 
                 label = ~ Name,
                 labelOptions = labelOptions(noHide = F)) %>%
      addPolylines(data = path1, weight = 3, color = 'orange', opacity = 1))
  
  output$map2 = renderLeaflet(
    leaflet() %>% 
      setView(lng = -68.85029, lat = 45.86758, zoom = 11) %>% 
      addProviderTiles(providers$Esri.WorldTopoMap) %>%
      addMarkers(data = pts2, 
                 label = ~ Name,
                 labelOptions = labelOptions(noHide = F)) %>%
      addPolylines(data = path1, weight = 2, color = 'grey', opacity = 1)%>%
      addPolylines(data = path2, weight = 3, color = 'orange', opacity = 1))
  
  output$map3 = renderLeaflet(
    leaflet() %>% 
      setView(lng = -68.91000, lat = 45.91250, zoom = 14) %>% 
      addProviderTiles(providers$Esri.WorldTopoMap) %>%
      addMarkers(data = pts3, 
                 label = ~ Name,
                 labelOptions = labelOptions(noHide = F)) %>%
      addPolylines(data = path1, weight = 2, color = 'grey', opacity = 1)%>%
      addPolylines(data = path2, weight = 2, color = 'grey', opacity = 1) %>%
      addPolylines(data = pathWFG, weight = 3, color = 'orange', opacity = 1))
  
  output$map4 = renderLeaflet(
    leaflet() %>% 
      setView(lng = -68.91000, lat = 45.91250, zoom = 14) %>% 
      addProviderTiles(providers$Esri.WorldTopoMap) %>%
      addMarkers(data = pts4, 
                 label = ~ Name,
                 labelOptions = labelOptions(noHide = F)) %>%
      addPolylines(data = path1, weight = 2, color = 'grey', opacity = 1)%>%
      addPolylines(data = path2, weight = 2, color = 'grey', opacity = 1) %>%
      addPolylines(data = pathWFG, weight = 2, color = 'grey', opacity = 1) %>%
      addPolylines(data = pathMP2, weight = 3, color = 'orange', opacity = 1))
  
  output$map5 = renderLeaflet(
    leaflet() %>% 
      setView(lng = -68.85029, lat = 45.86758, zoom = 11) %>% 
      addProviderTiles(providers$Esri.WorldTopoMap) %>%
      addMarkers(data = pts5, 
                 label = ~ Name,
                 labelOptions = labelOptions(noHide = F)) %>%
      addPolylines(data = path1, weight = 2, color = 'grey', opacity = 1)%>%
      addPolylines(data = path2, weight = 2, color = 'grey', opacity = 1) %>%
      addPolylines(data = pathWFG, weight = 2, color = 'grey', opacity = 1) %>%
      addPolylines(data = pathMP2, weight = 2, color = 'grey', opacity = 1) %>%
      addPolylines(data = path3, weight = 3, color = 'orange', opacity = 1))
  
  output$png1 <- renderImage({
    
    list(src = "./www/png1.png", width = "100%")
  }, deleteFile = FALSE)
  
  output$png2 <- renderImage({
    
    list(src = "./www/png2.png", width = "100%")
  }, deleteFile = FALSE)
  
  output$png3 <- renderImage({
    
    list(src = "./www/png3.png", width = "100%")
  }, deleteFile = FALSE)
  
  output$png4 <- renderImage({
    
    list(src = "./www/png4.png", width = "100%")
  }, deleteFile = FALSE)
  
  output$png5 <- renderImage({
    
    filename <- normalizePath(file.path("./www/png5.png"))
    
    list(src = filename, width = "100%")
  }, deleteFile = FALSE)
  
  output$dudley_gif <- renderImage({
    filename <- normalizePath(file.path("./www/Dudley_Vid.gif"))
    list(src = filename, width = "60%",
         contentType = "image/gif")
  }, deleteFile = FALSE)
}
