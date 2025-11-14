## penguins script
library(palmerpenguins)
library(ggplot2)

#example filtering
filtered_data <- penguins %>% filter()

#plot of bill length and bill depth 
ggplot(data = penguins, aes(x = bill_length_mm, y = bill_depth_mm, colour = species)) + 
    geom_point(size = 4)+
    geom_smooth(method = "lm", size = 2) +
    theme_bw() +
    labs(x = "Bill Length (mm)", y = "Bill Width (mm)", title = "The association between Bill legnth and depth in three species of Penguins")+
    scale_colour_manual(values = c("Adelie" = "#00798c", "Chinstrap" = "#d1495b", "Gentoo" = "#edae49"))

ggsave("bill_length_bill_depth.png")

#boxplot of flipper length, species, and sex
ggplot(data = penguins, aes(x = species, y = flipper_length_mm, fill = sex)) + 
    geom_boxplot(size = 1.5, alpha = 0.8)+
    theme_bw() +
    labs(x = "Sex", y = "Flipper length (mm)", title = "The association between Bill legnth and depth in three species of Penguins")+
    scale_fill_manual(values = c("male" = "#00798c", "female" = "#edae49"))
ggsave("flipper_length_species.png")


#having a little look at the island counts for each species
penguins %>% group_by(species) %>% count(island)



