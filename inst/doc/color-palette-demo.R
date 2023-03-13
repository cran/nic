## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.height = 4,
  fig.width = 6
)

## ----setup--------------------------------------------------------------------
library(nic)
library(tidyr)
library(ggplot2)
library(palmerpenguins)
theme_set(theme_minimal())

## -----------------------------------------------------------------------------
names(nic_palettes)

## -----------------------------------------------------------------------------
penguins %>% 
  drop_na() %>% 
  ggplot(aes(x = bill_length_mm,y = bill_depth_mm,color=body_mass_g))+
  geom_point()+
  scale_color_gradientn(colors = nic_palette("orchid_12",12))+
  labs(x = "Length of bill in milimetres",y = "Depth of bill in milimetres",color = "Body mass in grams")+
  theme(legend.position = "top")

## -----------------------------------------------------------------------------
diamonds %>% 
  ggplot(aes(x = cut,y = price,fill = cut))+
  geom_violin()+
  scale_fill_manual(values = nic_palette("ixora_8",5))

## -----------------------------------------------------------------------------
set.seed(42)
tibble(Date = seq.Date(from = as.Date("2021-1-1"),
                       to = as.Date("2021-12-31"),by = "day"),
       Returns = as.numeric(arima.sim(n = 365,list(ar = c(0.501))))) %>% 
  ggplot(aes(x = Date,y = Returns,color = Returns))+
  geom_line()+
  scale_color_gradientn(colors = nic_palette("kandyan_dancer_6"))+
  theme(legend.position = "bottom")

## -----------------------------------------------------------------------------
penguins %>% 
  drop_na() %>% 
  ggplot(aes(x = bill_length_mm,y = bill_depth_mm,color=species))+
  geom_point()+
  scale_color_manual(values = nic_palette("moss_rose_5",4))+
  labs(x = "Length of bill in milimetres",y = "Depth of bill in milimetres",color = "Species")+
  theme(legend.position = "top")

