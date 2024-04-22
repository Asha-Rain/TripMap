#### Define UI ####
ui <- fluidPage(
  
  navbarPage(title = 'Asha Rain Data & Design',
             # Routes & Revelations by Asha Rain Designs
             # Asha Rain Data & Design
             # Asha Rain: Rain Date Data & Design
             # Rain Date Designs
             # Rainy Day Data & Designs
             
             
             ####Landing page CSS ####
             tags$style(".landing-wrapper {}",
                        
                        ".landing-wrapper .landing-block{
                        width: 100%;
                        height: 100vh;
                      }",
                        
                        ".landing-wrapper .background-content{
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        height: 100%;
                      }",
                        
                        #display: grid;
                        #grid-template-columns: 50% 50%;
                        #grid-row-gap: 0;
                        #grid-row-columns: 0
                        
                        ".landing-wrapper .background-content img{
                              display: block;
                              width: auto; /* Adjust image width as needed */
                              max-width: 100%; /* Ensure image doesn't exceed container width */
                              max-height: 100%; /* Ensure image doesn't exceed container height */
                              height: auto; /* Maintain aspect ratio */
                      }",
                        
                        ".landing-wrapper .foreground-content{
                        position: absolute;
                        top: 10%;
                        z-index: 9999;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                      }",
                        
                        ".landing-wrapper .foreground-content .foreground-text{
                        width: 50%;
                        padding: 2%;
                        color: black;
                        background-color: white;
                        text-align: center;
                      }",
                        
                        ".landing-wrapper .foreground-content .foreground-text h1{font-size: 3rem;}",
                        ".landing-wrapper .foreground-content .foreground-text p{font-size: 2rem;}"
             ),
             
             
             #### tab 1: landing page ####
             tabPanel(title = "Home", 
                      # parent container
                      tags$div(class="landing-wrapper",
                               # child element 1: images
                               tags$div(class="landing-block background-content",
                                        # top left
                                        img(src=home)),
                                        # top right
                                       ## img(src=top_right),
                                        # bottom left
                                      ##  img(src=bottom_left), 
                                        # bottom right
                                      ##  img(src=bottom_right)),
                               
                               # child element 2: content
                               tags$div(class="landing-block foreground-content",
                                        tags$div(class="foreground-text",
                                                 tags$h1("Welcome!"),
                                                 tags$p("This shiny app is an attempt to catalog, 
                                                        celebrate, and share some of my favorite
                                                        trips and adventures via maps, 
                                                        data visualization, and story."),
                                                 tags$p("Enjoy!"),
                                                 tags$p("- Asha Rain"))))),
             
             #### tab 2: Trip 1 ####
             tabPanel(title = "Winter Katahdin 2024",
                      
                      setBackgroundImage(src = "contour_background2.jpg"),
                      
                      titlePanel("  Winter Katahdin 2024"),
                      
                  #    sidebarLayout(
                        #sidebarPanel(
                       # radioButtons("Explore", label = h3("Explore:"),
                        #             choices = list("Route Map" = 1, "Photos" = 2), 
                         #            selected = 1),
                        #width = 2
                    #  ),
                      
                      mainPanel(width = 12,
                                tabsetPanel(
                                  tabPanel("Day 1", br(), fluidRow(
                                    column(width = 8, imageOutput("png1")),
                                    column(width = 4, leafletOutput('map1'))), g1),
                                  
                                  tabPanel("Day 2", br(), fluidRow(
                                    column(width = 8, imageOutput("png2")),
                                    column(width = 4, leafletOutput('map2'))), g2), 
                                  
                                  tabPanel("Day 3", br(), fluidRow(
                                    column(width = 8, imageOutput("png3")),
                                    column(width = 4, leafletOutput('map3'))), g3), 
                                  
                                  tabPanel("Day 4", br(), fluidRow(
                                    column(width = 8, imageOutput("png4")),
                                    column(width = 4, leafletOutput('map4'))), g4), 
                                  
                                  tabPanel("Day 5", br(), fluidRow(
                                    column(width = 8, imageOutput("png5")),
                                    column(width = 4, leafletOutput('map5'))), g5)))
                                          ) #tabpanel
                              ) #navbarpage
                ) #fluidpage
