# Foreword ####
# Title: Trip Map Shiny Dashboard
# Author: Asha Rain
# Date: 3/17/2024



# Library ####
library(shiny)
library(leaflet)
library(tidyverse)
library(osmdata) # package for working with streets
library(showtext)
library(sf)
library(shinyanimate)
library(shinythemes)
library(bslib)
library(spsComps)
library(magrittr)
library(shinyWidgets)

# Functions ####
json_path = paste("data",sep = "/")

gallery_storage = function(texts,hrefs,images,title){
  gallery(
    texts = texts, hrefs = hrefs, images = images,
    title = "",
    enlarge = TRUE,
    enlarge_method = "modal")
}


# Data ####

## Map components ####
path1 = sf::st_read(paste0(json_path,'/Path1.json'))
path2 = sf::st_read(paste0(json_path,'/Path2.json'))
path3 = sf::st_read(paste0(json_path,'/Path3.json'))
pathMP2 = sf::st_read(paste0(json_path,'/MP2.json'))
pathWFG = sf::st_read(paste0(json_path,'/WF.json'))

pts <- read.csv("Map_Pts.csv")
pts1 <- pts[pts$day1 == 1,]
pts2 <- pts[pts$day2 == 1,]
pts3 <- pts[pts$day3 == 1,]
pts4 <- pts[pts$day4 == 1,]
pts5 <- pts[pts$day5 == 1,]

#### Landing page photo gallery components ####
top_left <- "SB_Home.JPG"
top_right <-  "Ferns.JPG"
bottom_right <-  "Rialto.JPG"
bottom_left <-  "Climb.JPG"
home <- "Home Page.JPG"

####Katahdin Photo gallery components (4-8 pics each)####
texts1 <- c("First Glimpse of the big K", 
            "Abol Bridge Parking Lot", 
            "Abol Pond Crossing",
            "Abol Pond",
            "Roaring Brook Lean-To",
            "Roaring Brook")
hrefs1 <- c("", "", "", "", "", "")
images1 <- c("Big_K.JPG",
             "Abol_Parking.JPG",
             "Pond_Crossing_1.JPG",
             "Abol_Pond.JPG",
             "LeanTo_1.JPG",
             "Roaring_Brook.JPG")

g1 = gallery(
  texts = texts1, hrefs = hrefs1, images = images1,
  title = "",
  image_frame_size = 3,
  enlarge = TRUE,
  enlarge_method = "modal")

texts2 <- c("Up to Chimney Pond",
            "Winter Trail Slog",
            "Chimney Pond",
            "Cathedral through the clouds",
            "South Basin from Chimney Pond",
            "Pamola Ice Cliffs from Chimney Pond",
            "Pamola Ice Cliffs Approach",
            "Pamola Ice Cliffs")
hrefs2 <- c("", "", "", "", "", "", "", "")
images2 <- c("To_Chimney.JPG",
             "Approach_Selfie.JPG",
             "Chimney_Cheesin.JPG",
             "Cathedral_View.JPG",
             "Chimney_Selfie.JPG",
             "Pamola_Cliffs.JPG",
             "To_Pamola.JPG",
             "Pamola.JPG")
g2 = gallery(
  texts = texts2, hrefs = hrefs2, images = images2,
  title = "",
  image_frame_size = 3,
  enlarge = TRUE,
  enlarge_method = "modal")


texts3 <- c("South Basin",
            "Waterfall Gulley",
            "Chimney Pond & South Basin")
hrefs3 <- c("", "", "")
images3 <- c("SB.JPG", "WFG.JPG",
             "CP_Vid.gif")
g3 = gallery(
  texts = texts3, hrefs = hrefs3, images = images3,
  title = "",
  image_frame_size = 4,
  enlarge = TRUE,
  enlarge_method = "modal")

texts4 <- c("Mini Pinnacle 2", 
            "Soren's Approach",
            "Asha's Appraoch",
            "Soren on the First Pitch",
            "Asha getting to the first belay",
            "At the top of Mini Pinnacle 2",
            "Dudley after the mega-slog walk-off",
            "Back at Chimney Pond")
hrefs4 <- c("", "", "", "", "", "", "", "")
images4 <- c("MP2.jpg",
             "SD_Meme.PNG",
             "ADL_Meme.PNG",
             "SD_MP2.JPG",
             "MP2_Belay.JPG",
             "MP2_Top.jpg",
             "Dudley_Vid.gif",
             "MP2_Return.jpg")
g4 = gallery(
  texts = texts4, hrefs = hrefs4, images = images4,
  title = "",
  image_frame_size = 3,
  enlarge = TRUE,
  enlarge_method = "modal")

texts4b <- c("South Basin from Dudley")
hrefs4b <- c("")
images4b <- c("Dudley_Vid.gif")
g4b = gallery(
  texts = texts4b, hrefs = hrefs4b, images = images4b,
  title = "",
  image_frame_size = 6,
  enlarge = TRUE,
  enlarge_method = "modal")

texts5 <- c("Leaving Chimney Pond",
            "Pond Crossing on the way out",
            "Out we go",
            "Back to the truck at Abol Bridge")
hrefs5 <- c("", "", "", "")
images5<- c("Ski_Out.jpg",
            "Lake.jpg",
            "Sled_Out.gif",
            "Back_To_Abol.jpg")
g5 = gallery(
  texts = texts5, hrefs = hrefs5, images = images5,
  title = "",
  image_frame_size = 3,
  enlarge = TRUE,
  enlarge_method = "modal")


