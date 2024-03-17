
##### Define server logic ####
server = function(input, output){
  
  output$map1 = renderLeaflet(
    leaflet() %>% 
      setView(lng = -68.85029, lat = 45.86758, zoom = 11) %>% 
      addProviderTiles(providers$Esri.WorldTopoMap) %>%
      addPolylines(data = path1, weight = 3, color = 'orange', opacity = 1))
  
  output$map2 = renderLeaflet(
    leaflet() %>% 
      setView(lng = -68.85029, lat = 45.86758, zoom = 11) %>% 
      addProviderTiles(providers$Esri.WorldTopoMap) %>%
      addPolylines(data = path1, weight = 2, color = 'grey', opacity = 1)%>%
      addPolylines(data = path2, weight = 3, color = 'orange', opacity = 1))
  
  output$map3 = renderLeaflet(
    leaflet() %>% 
      setView(lng = -68.91000, lat = 45.91250, zoom = 14) %>% 
      addProviderTiles(providers$Esri.WorldTopoMap) %>%
      addPolylines(data = path1, weight = 2, color = 'grey', opacity = 1)%>%
      addPolylines(data = path2, weight = 2, color = 'grey', opacity = 1) %>%
      addPolylines(data = pathWFG, weight = 3, color = 'orange', opacity = 1))
  
  output$map4 = renderLeaflet(
    leaflet() %>% 
      setView(lng = -68.91000, lat = 45.91250, zoom = 14) %>% 
      addProviderTiles(providers$Esri.WorldTopoMap) %>%
      addPolylines(data = path1, weight = 2, color = 'grey', opacity = 1)%>%
      addPolylines(data = path2, weight = 2, color = 'grey', opacity = 1) %>%
      addPolylines(data = pathWFG, weight = 2, color = 'grey', opacity = 1) %>%
      addPolylines(data = pathMP2, weight = 3, color = 'orange', opacity = 1))
  
  output$map5 = renderLeaflet(
    leaflet() %>% 
      setView(lng = -68.85029, lat = 45.86758, zoom = 11) %>% 
      addProviderTiles(providers$Esri.WorldTopoMap) %>%
      addPolylines(data = path1, weight = 2, color = 'grey', opacity = 1)%>%
      addPolylines(data = path2, weight = 2, color = 'grey', opacity = 1) %>%
      addPolylines(data = pathWFG, weight = 2, color = 'grey', opacity = 1) %>%
      addPolylines(data = pathMP2, weight = 2, color = 'grey', opacity = 1) %>%
      addPolylines(data = path3, weight = 3, color = 'orange', opacity = 1))
  
  output$png1 <- renderImage({
    
    list(src = "./www/png1.png", width = "100%")
  }, deleteFile = FALSE)
  
  output$png2 <- renderImage({
    
    filename <- normalizePath(file.path("png2.png"))
    
    list(src = filename, width = "100%")
  }, deleteFile = FALSE)
  
  output$png3 <- renderImage({
    
    filename <- normalizePath(file.path("png3.png"))
    
    list(src = filename, width = "100%")
  }, deleteFile = FALSE)
  
  output$png4 <- renderImage({
    
    filename <- normalizePath(file.path("png4.png"))
    
    list(src = filename, width = "100%")
  }, deleteFile = FALSE)
  
  output$png5 <- renderImage({
    
    filename <- normalizePath(file.path("png5.png"))
    
    list(src = filename, width = "100%")
  }, deleteFile = FALSE)
  
  output$png6 <- renderImage({
    
    filename <- normalizePath(file.path("C:/Users/staff/Documents/PetraOutdoorMap/www/topo3.png"))
    
    list(src = filename, width = "100%")
  }, deleteFile = FALSE)
}
