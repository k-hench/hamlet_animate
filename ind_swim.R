library(hypoimg)
library(ggtext)
library(gganimate)

ind <-ggplot()+
  hypo_anno_r("indigo") + 
  theme_void()+
  theme(plot.background = element_rect(fill = "#EBEBEB",color = "#EBEBEB"))

ggsave(plot = ind, filename = "ind.png", width = 6, height = 3, type = "cairo", bg = "transparent")

data <- tibble(x = seq(0,6*pi,length.out = 200),
               y = sin(x),
               time = 1:200)

data %>%
  ggplot(aes(x = x, y = y))+
  coord_equal(xlim = c(-1,19),ylim = c(-3, 3))+
  geom_richtext(aes(label = "<img src='ind.png' width='100'/>"),
                fill = NA, label.color = NA,
                label.padding = grid::unit(rep(0, 4), "pt"))+
  theme(panel.grid = element_blank())+
  transition_time(time) +
  ease_aes('linear')

anim_save("ind.gif")

# data2 <- tibble(x = seq(0,6*pi,length.out = 200),
#                y = sin(x),
#                time = 1:200,
#                grob = rep(list(ggplotGrob(ind)),200)) %>%
#   mutate(x = scales::rescale(x, from = range(x), to = c(.1,.9)),
#          y = scales::rescale(y, from = range(y), to = c(.2,.8)))
# 
# data2 %>%
#   ggplot()+
#   coord_equal(xlim = c(-1,19),ylim = c(-3, 3))+
#   geom_hypo_grob(aes(grob = grob, x = x, y = y),width = .2, height = .4, angle = 0)+
#   transition_time(time) +
#   ease_aes('linear')
