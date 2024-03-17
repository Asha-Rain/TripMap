#### Define UI ####
ui <- fluidPage(
  
  navbarPage(title = 'Asha Rain Designs',
             ####Landing page CSS ####
             tags$style(".landing-wrapper {}",
                        
                        ".landing-wrapper .landing-block{
                        width: 100%;
                        height: 100vh;
                      }",
                        
                        ".landing-wrapper .background-content{
                        display: grid;
                        grid-template-columns: 50% 50%;
                        grid-row-gap: 0;
                        grid-row-columns: 0;
                      }",
                        
                        ".landing-wrapper .background-content img{
                        display: block;
                        width: 100%;
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
                                        img(src=top_left),
                                        # top right
                                        img(src=top_right),
                                        # bottom left
                                        img(src=bottom_left), 
                                        # bottom right
                                        img(src=bottom_right)),
                               
                               # child element 2: content
                               tags$div(class="landing-block foreground-content",
                                        tags$div(class="foreground-text",
                                                 tags$h1("Welcome!"),
                                                 tags$p("This shiny app is an attempt to catalog, 
                                                        celebrate, and share some of my favorite
                                                        trips and adventures via maps, 
                                                        data visualization, and story."),
                                                 tags$p("Enjoy!"),
                                                 tags$p("- Asha"))))),
             
             #### tab 2: Trip 1 ####
             tabPanel(title = "Winter Katahdin 2024",
                      
                      setBackgroundImage(src = "https://lh3.googleusercontent.com/pw/AP1GczNQcw1k5hnyengBlr6_4X1kbkUWSFkp1CsTnbobGQQBg0SEdhtFZccVpoSufBxLkr5l3d5UkDk7WHI0WqwryjSKDFntYib2BBLT_xngPYtcsWAs6I2cEH1gNJFwn_dq3yEOI_nJVQoBfQ2KHVK2mu8ca3k0xQabvuGwGMKfFSNb3NF-atGWsM8suWwexm2w4Sw8zjVH_d-1-trPc1DixW3nUtXy3dwXB7-ZRqaUbteI4jrTrO8qSF_O_RP0A2RaBaKa2i7FxKBcXmS4PzB-ip8Ihb8l5j6Hm2texibi6pu437-EiK8YMipdeT44J8TtP_sFkcsLGtaEWOI_6mp_FB4TF2PsvrXunaKOqktRKq5zE9WncQN-bHkYDHa7bHGNfps8f5_WQnHuhDnKw-sanVGwljUAfm6SLSviQksK4XaW0ObgVVAsIS0iEOvChs0NPuXxgApnzXZqwcpCM5AJT3yinGGpU0s0zvYh9uKIoACtptIyPxhnPLq64fEWeGrxjJhx4v12LiqCkDzh0gk5Ac4qM0qwvE_C_oXxNQiyEjhR4QE4rIxjyZgbNYyK4WnqLphAqAXelIhbmV4oax8mCULMoAlzUS_0T7thSCYERSH9c_w111xWOaEDJd9Hi3bDIX77DVb_WS1SUy9VJMwzY1w1J0uTpq3-LcIVOaqs9-0A_N9Tt6YnLilWqUa9NIjXD8CoobWGUZEL7fArOVg4nVWuK0OPPngpD1lpkZzE5Vb5t2E2R6DOjlRuCfOHik-GMlANjtIW3KPKS1YZqRWKhtstv0BXBDqIKn-qsfk12ria-VXQfH0fNC0zEUyKQzXVMRhotRmpdnkyMhOxnLELYpGWOdRJSHMM3YePX7zHyB3Dh0xBhFwNJ2iHH1XBPaF3e0EYiIzSyUY3kr-2o1DwtB3FPNLdhKxcTXUX4Zm-z-jCk87LYrweKj1OvaDAF0U=w827-h827-s-no-gm?authuser=0"),
                      
                      titlePanel("Winter Katahdin 2024"),
                      
                      sidebarLayout(sidebarPanel(
                        radioButtons("Explore", label = h3("Explore:"),
                                     choices = list("Route Map" = 1, "Photos" = 2), 
                                     selected = 1),
                        width = 2
                      ),
                      
                      mainPanel(width = 8,
                                tabsetPanel(
                                  tabPanel("Day 1", br(), imageOutput("png1"), br(), leafletOutput('map1'), g1), 
                                  tabPanel("Day 2", br(), imageOutput("png2"), br(), leafletOutput('map2'), g2), 
                                  tabPanel("Day 3", br(), imageOutput("png3"), br(), leafletOutput('map3'), g3),
                                  tabPanel("Day 4", br(), imageOutput("png4"), br(), leafletOutput('map4'), g4),
                                  tabPanel("Day 5", br(), imageOutput("png5"), br(), leafletOutput('map5'), g5)))
                      
                      )
             )))
