library(ggmap)
library(ggrepel)

# library(ggsubplot)
library(ggplot2)
library(maps)
# library(plyr)

# install.packages("ggmap")
# install.packages("maps")
# install.packages("ggrepel")
# install.packages("ggplot2")
# install.packages("ggsubplot")

# get basic location
nj <- get_map (location = ("livingston,nj"),
    maptype="roadmap",
    zoom=13,
    color="bw")

nj2 <- get_map (location = ("east hanover,nj"),
               maptype="roadmap",
               zoom=12,
               color="bw")

nj3 <- get_map (location = ("Florham park,nj"),
               maptype="roadmap",
               zoom=12,
               color="bw")

# get basemap
njBaseMap <- ggmap(nj,extent="device")

# read in geo location data as points
centers <- read.csv("https://raw.githubusercontent.com/cynthia0611/Geo-Coding-NJ-Daycare-Center/master/Licensed_Child_Care_Centers.csv")

# head(data)

# allocate points in the basemap
map <- njBaseMap +  geom_point(data=centers,
                               aes(x=lon, y=lat),
                               size=1.8, 
                              col="#e6550d",alpha=0.8) + 
                              scale_size_area(max_size = 9)

# get label besides the points
map + geom_text_repel(data=centers,
                              aes(x=lon, y=lat,label = CENTER),
                              size=3,
                              color="#081d58",
                              fontface="bold",
                              alpha=0.8) 

