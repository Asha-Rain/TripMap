# Foreword ####
# Author: Asha Rain

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

#### Landing page photo gallery components ####
top_left <- "https://raw.githubusercontent.com/Asha-Rain/Shiny_photos/main/www/SB.JPG"
top_right <-  "https://photos.google.com/share/AF1QipNO0EkSFNZDc4EaJrDabeDFJ-07Tlci0DnJxpl1sZNWdlWyAo5S6KroXJF8cu1PWA?key=ZGxQYkJ4T1Vqa2lVelN6ZS1LYUJNdUZzNE5oQU9R"
bottom_right <-  "https://photos.app.goo.gl/fgyxD7PCvCCnrH7P8"
bottom_left <-  "https://photos.app.goo.gl/EkiaXg2YNaFRcG6d8"

####Trip 1 Photo gallery components####
texts1 <- c("First Glimpse of the big K", "Abol Bridge Parking Lot", "Abol Pond Crossing", "Abol Pond", "Roaring Brook", "Roaring Brook Lean-To")
hrefs1 <- c("https://github.com/Asha-Rain/TripMap/blob/main/www/SB.JPG",
            "https://raw.githubusercontent.com/Asha-Rain/Shiny_photos/main/www/SB.JPG",
            "Dudley.JPG",
            "https://lh3.googleusercontent.com/pw/AP1GczNbiER5qyW0IahuCcApGUkOkSs2zlf_loxrIiR7GNDZtES6RLX8STxGKrulzMDwuEr_nVjvA80ATRLvC7Fm1zqdWewTRZPhZcUKanDexOly258shTane7DCOMoGvvOm55wlwrfIl6D6vqQTV3uobIeVfvf-kBaEl2oBU0KLvpZLmGzgBm8XM08hwSnnaJ6XflbHCA9v4qxlVv7fXCHmga0riWru5dZCWoaEpZHysNQq9YEi-mJ0gf-31-cRZrwamkmXODTDyS5YZF5gV_avJdVexYGiZpYqSzhT-d_08jHJjDrlq-ybjoIiep4reiwFzplsqzO28DO1MouJvF-lXNqmiTlSUw0NT0-OT06ghkpSZ52lurMcnt42Wjom6q1k1z2PkuCnjQxICWVltks9rQ4D8yc1hA1rh5kNMgObw1hJKkg9fq78oWR1quDtJTE6rv6bjYnq-FlJeszMfgrPS7tsmiTJc9rUixxwNfjma-JHWBsO6I3V1aU-wHw-G3AVN0PvFWFNOQR_58m-tqVENskuo9DDUFg6kKF0wbKu0A-2DleadXvxvuWPwpynch-45H7JTZpqinuZ9kC5-jgio3GItZiXnFPVSXjLPL_fGTB4RFvYkgO0XR6rBW3z7C1Fh-52MSId4vTI3Tdswpvi_pX-QJwqDUlLSjsrHjNw5IRb3-BwpuizwsL_BsQH591EvtQUPf61PJS5fuwc1hH7ynVCRQ9mOByMop61vAhQ3g_T2hs9ky1VGWF6JozLUGIgtg4Vwbr6UQgnXtkis4jvCWoMGw9zV0MkWsAJ3paSCjpWBTlYbFHU3C5QpFXZiWslGTPj_9wF_K74FobIIczJhKqmLYgbtQP573_vNM8osJDsd44D0WBS5l9av3EkWlhoz4w1mBctvblKkxomHZa0kj6EzLrni5fzR8dG_dutN-bspWAH5W6QWyT98FEOfDs=w620-h827-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/AP1GczMNncHt7ppskqdTOYJEk5u4mfQ2icutmxj9DOemQ1VaISBmtQ_2YShPJ1w_rme6Yvmlk9rhkz3sc7xXIIV8H14_C-8W1ymFc7iLUafQp76V9ucQYSazH4xSk5YiMYeN9iP5N4GnLT9y0TaMMC21iRVXbz5DOsKh3Di5-93xyP3uFAqP_-8KPQ5f1ChQDXwYAm4xX8fn0TJDoE8AwhW9CT1OSX2TpczJgBAgPC856DgG88Ts163ObZ3IHCW5cCMFAfOKrivkbd7P-_YucRwRBK7H5UKZ3fADpxqc8I1fMwmXu1uVTF9zCcHsr-_o3xB_1DBgUnxHV_s1WANSD67BTgEDIt0EVt2A6S12SEKisJmL9TBnlbbmcGWVZ5bMej1IAzn2kpG70S8TRqXMoTQpVeZyEo4nLXuV358618HxONmOuD_2A39OtRdgiIbXeyRJAFXbsE4PWkIJlSg7mYaR5ljJsiACPDdKdhuVN5-oIm8DSR-SZnyQICSKsRy4DvlFoHaDZxDcErUwJQ-MG72Y5z9tCrbnLeQX6twL-UH0oooAxE34vmd2DblEPnjcMrvdC96epNf6uxbpveMjWG9uG6aulj22dZkkG_MZhWfc_30xkcoYaOcFoHFPyrz7QM1kumNDBZYZ535fWL1Cp2slH0Ty8wKqkwoKk_5Qjhpq0kAnO_1uEzzjDxjpDZAR41YRnBFXTfKR8ghBYLf_H6KewirkV-ZvpBnXFy9EBGJMgDjL8jlNe-BeJJfGSEjTs73cLdu71DM1s8RlFy1Bkntnwp8MjzXJ6HO4_ZOit4yN1wBgXfScyIJ7fIh_OW8metw1f5AmKF2SKGjgmq3jVuMVBt34_pUQIrek5o_UteUDVKRQRKAAOicCK0DaWysu3a7kAL948qyK4R_AQZqT-QgYmOLHxmo1EArlgMzCjUKnLbpzmUNFbVerTCHSBda-jg=w1103-h827-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/AP1GczPuKdf6CdTn7OoKJ5eN7T8AtXOhmUfEUo-Z1nSVn7CVMpOaH8k459XEuU-8yXawRJ8izNDikZeuvMVmo2QzDzac3qNR-wjP24R1AjPVnYoluviAZhlR-GK9O8Y1SCJQgfmN3WjHsi84MiLZSS5U5_WWoqiCqwiHrJReiSyfaI2e4HqJkZ8FHzF2JLY7tyilOa0UOyScVj6nWSdic9R45FJ4kCqAv-8XrO-wQ4HNhDxhB4RN6Y4Ui5PYdTV4x7nfPWf2sGn8G0FewVpp-ogxtAB4JylXnbvVbTcVir5qG3tRRhTD7K9PZLIiXJ0eaJzLrbON95AbCwa7yX_0_WSjSPOhmIQxHO_u-lrhE1KNt0-H9Te1Sat9mZKdTzm75jLimqJgbbvQB-UDT2y6_PJsqA4DaNYE1flofRPPo9dHFNpl62yzwSee_bejrK9JDwI52sn0F128rRv1YV-JSzhMG1FQrLzFdoMKToXCsdJ9ou2tdSD0Gy-pfTfDkFi6Fcoxzt7xNAS7WuK21mELAxvrmC6KaVuAEeZK7mtJbWvxj7pzr10--mcuRdrepVTEN5ADhjlX12PbkFhm_1i4JfO5tCjUrhMQClkpaWoq0I_DnFioqGYkBgB6MbXrKxozeexd6f-xS_FVn-sFCTjydmjutOW4A3GuT9fmq2mPxTnK-5gLLbX6CWeWEAzhZ37sYy5sFNDvt3aj5O1Ie2F4Wd6jX4TWoPZpw1Ysg5XiKRsO5va94spgMzH50Hz0cYKgO4fH4ITC5ZKv9iR-w-0rh4luAf5qIE0eLLqLlekFyWvvl168bWI4fpmykhtJmXG2g5FiletgKF1epW43UKSXMcIXsL2jCv5CRgZcZOdPt9Q2WLLGvYPZyn10Man6C9TFtmcZy5xR68bT-b9Flo5587UiT0ACOfzkF6UNDW7A3CAJa3GNhQmd-H-b84WXts3FYEc=w1103-h827-s-no-gm?authuser=0")
images1 <- c("https://github.com/Asha-Rain/TripMap/blob/main/www/SB.JPG",
             "https://raw.githubusercontent.com/Asha-Rain/Shiny_photos/main/www/SB.JPG",
             "Dudley.JPG",
             "https://lh3.googleusercontent.com/pw/AP1GczNbiER5qyW0IahuCcApGUkOkSs2zlf_loxrIiR7GNDZtES6RLX8STxGKrulzMDwuEr_nVjvA80ATRLvC7Fm1zqdWewTRZPhZcUKanDexOly258shTane7DCOMoGvvOm55wlwrfIl6D6vqQTV3uobIeVfvf-kBaEl2oBU0KLvpZLmGzgBm8XM08hwSnnaJ6XflbHCA9v4qxlVv7fXCHmga0riWru5dZCWoaEpZHysNQq9YEi-mJ0gf-31-cRZrwamkmXODTDyS5YZF5gV_avJdVexYGiZpYqSzhT-d_08jHJjDrlq-ybjoIiep4reiwFzplsqzO28DO1MouJvF-lXNqmiTlSUw0NT0-OT06ghkpSZ52lurMcnt42Wjom6q1k1z2PkuCnjQxICWVltks9rQ4D8yc1hA1rh5kNMgObw1hJKkg9fq78oWR1quDtJTE6rv6bjYnq-FlJeszMfgrPS7tsmiTJc9rUixxwNfjma-JHWBsO6I3V1aU-wHw-G3AVN0PvFWFNOQR_58m-tqVENskuo9DDUFg6kKF0wbKu0A-2DleadXvxvuWPwpynch-45H7JTZpqinuZ9kC5-jgio3GItZiXnFPVSXjLPL_fGTB4RFvYkgO0XR6rBW3z7C1Fh-52MSId4vTI3Tdswpvi_pX-QJwqDUlLSjsrHjNw5IRb3-BwpuizwsL_BsQH591EvtQUPf61PJS5fuwc1hH7ynVCRQ9mOByMop61vAhQ3g_T2hs9ky1VGWF6JozLUGIgtg4Vwbr6UQgnXtkis4jvCWoMGw9zV0MkWsAJ3paSCjpWBTlYbFHU3C5QpFXZiWslGTPj_9wF_K74FobIIczJhKqmLYgbtQP573_vNM8osJDsd44D0WBS5l9av3EkWlhoz4w1mBctvblKkxomHZa0kj6EzLrni5fzR8dG_dutN-bspWAH5W6QWyT98FEOfDs=w620-h827-s-no-gm?authuser=0",
             "https://lh3.googleusercontent.com/pw/AP1GczMNncHt7ppskqdTOYJEk5u4mfQ2icutmxj9DOemQ1VaISBmtQ_2YShPJ1w_rme6Yvmlk9rhkz3sc7xXIIV8H14_C-8W1ymFc7iLUafQp76V9ucQYSazH4xSk5YiMYeN9iP5N4GnLT9y0TaMMC21iRVXbz5DOsKh3Di5-93xyP3uFAqP_-8KPQ5f1ChQDXwYAm4xX8fn0TJDoE8AwhW9CT1OSX2TpczJgBAgPC856DgG88Ts163ObZ3IHCW5cCMFAfOKrivkbd7P-_YucRwRBK7H5UKZ3fADpxqc8I1fMwmXu1uVTF9zCcHsr-_o3xB_1DBgUnxHV_s1WANSD67BTgEDIt0EVt2A6S12SEKisJmL9TBnlbbmcGWVZ5bMej1IAzn2kpG70S8TRqXMoTQpVeZyEo4nLXuV358618HxONmOuD_2A39OtRdgiIbXeyRJAFXbsE4PWkIJlSg7mYaR5ljJsiACPDdKdhuVN5-oIm8DSR-SZnyQICSKsRy4DvlFoHaDZxDcErUwJQ-MG72Y5z9tCrbnLeQX6twL-UH0oooAxE34vmd2DblEPnjcMrvdC96epNf6uxbpveMjWG9uG6aulj22dZkkG_MZhWfc_30xkcoYaOcFoHFPyrz7QM1kumNDBZYZ535fWL1Cp2slH0Ty8wKqkwoKk_5Qjhpq0kAnO_1uEzzjDxjpDZAR41YRnBFXTfKR8ghBYLf_H6KewirkV-ZvpBnXFy9EBGJMgDjL8jlNe-BeJJfGSEjTs73cLdu71DM1s8RlFy1Bkntnwp8MjzXJ6HO4_ZOit4yN1wBgXfScyIJ7fIh_OW8metw1f5AmKF2SKGjgmq3jVuMVBt34_pUQIrek5o_UteUDVKRQRKAAOicCK0DaWysu3a7kAL948qyK4R_AQZqT-QgYmOLHxmo1EArlgMzCjUKnLbpzmUNFbVerTCHSBda-jg=w1103-h827-s-no-gm?authuser=0",
             "https://lh3.googleusercontent.com/pw/AP1GczPuKdf6CdTn7OoKJ5eN7T8AtXOhmUfEUo-Z1nSVn7CVMpOaH8k459XEuU-8yXawRJ8izNDikZeuvMVmo2QzDzac3qNR-wjP24R1AjPVnYoluviAZhlR-GK9O8Y1SCJQgfmN3WjHsi84MiLZSS5U5_WWoqiCqwiHrJReiSyfaI2e4HqJkZ8FHzF2JLY7tyilOa0UOyScVj6nWSdic9R45FJ4kCqAv-8XrO-wQ4HNhDxhB4RN6Y4Ui5PYdTV4x7nfPWf2sGn8G0FewVpp-ogxtAB4JylXnbvVbTcVir5qG3tRRhTD7K9PZLIiXJ0eaJzLrbON95AbCwa7yX_0_WSjSPOhmIQxHO_u-lrhE1KNt0-H9Te1Sat9mZKdTzm75jLimqJgbbvQB-UDT2y6_PJsqA4DaNYE1flofRPPo9dHFNpl62yzwSee_bejrK9JDwI52sn0F128rRv1YV-JSzhMG1FQrLzFdoMKToXCsdJ9ou2tdSD0Gy-pfTfDkFi6Fcoxzt7xNAS7WuK21mELAxvrmC6KaVuAEeZK7mtJbWvxj7pzr10--mcuRdrepVTEN5ADhjlX12PbkFhm_1i4JfO5tCjUrhMQClkpaWoq0I_DnFioqGYkBgB6MbXrKxozeexd6f-xS_FVn-sFCTjydmjutOW4A3GuT9fmq2mPxTnK-5gLLbX6CWeWEAzhZ37sYy5sFNDvt3aj5O1Ie2F4Wd6jX4TWoPZpw1Ysg5XiKRsO5va94spgMzH50Hz0cYKgO4fH4ITC5ZKv9iR-w-0rh4luAf5qIE0eLLqLlekFyWvvl168bWI4fpmykhtJmXG2g5FiletgKF1epW43UKSXMcIXsL2jCv5CRgZcZOdPt9Q2WLLGvYPZyn10Man6C9TFtmcZy5xR68bT-b9Flo5587UiT0ACOfzkF6UNDW7A3CAJa3GNhQmd-H-b84WXts3FYEc=w1103-h827-s-no-gm?authuser=0")

g1 = gallery(
  texts = texts1, hrefs = hrefs1, images = images1,
  title = "",
  enlarge = TRUE,
  enlarge_method = "modal")

g2 = gallery_storage(texts = c("SB","Pamola"),href = c("SB.jpg","Pamola.jpg"), images = c("www/SB.jpg","www/Pamola.jpg"))


texts3 <- c("Waterfall Gulley")
hrefs3 <- c("WFG.JPG")
images3 <- c("WFG.JPG")
g3 = gallery(
  texts = texts3, hrefs = hrefs3, images = images3,
  title = "",
  enlarge = TRUE,
  enlarge_method = "modal")

texts4 <- c("Mini Pinnacle 2", "Dudley")
hrefs4 <- c("MP2.jpg",
            "Dudley.jpg")
images4 <- c("MP2.jpg",
             "Dudley.jpg")
g4 = gallery(
  texts = texts4, hrefs = hrefs4, images = images4,
  title = "",
  enlarge = TRUE,
  enlarge_method = "modal")

texts5 <- c("Pond Crossing")
hrefs5 <- c("Lake.jpg")
images5<- c("MP2.jpg")
g5 = gallery(
  texts = texts5, hrefs = hrefs5, images = images5,
  title = "",
  enlarge = TRUE,
  enlarge_method = "modal")


