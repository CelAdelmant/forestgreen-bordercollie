## penguins script
library(palmerpenguins)
library(ggplot2)

# add packages
library(dplyr)
library(ggthemes) # package for plotting nice

#example filtering
filtered_data <- penguins %>% filter()

#plot of bill length and bill depth
ggplot(data = penguins, aes(x = bill_length_mm, y = bill_depth_mm, colour = species)) +
    geom_point(size = 4)+
    geom_smooth(method = "lm", size = 2) +
    theme_bw() +
    labs(x = "Bill Length (mm)", y = "Bill Width (mm)", title = "The association between Bill length and depth in three species of Penguins")+
    scale_colour_manual(values = c("Adelie" = "#00798c", "Chinstrap" = "#d1495b", "Gentoo" = "#edae49"))

#boxplot of flipper length, species, and sex
ggplot(data = penguins, aes(x = species, y = flipper_length_mm, fill = sex)) +
    geom_boxplot(size = 1.5, alpha = 0.8)+
    theme_bw() +
    labs(x = "Sex", y = "Flipper length (mm)", title = "The association between Bill length and depth in three species of Penguins")+
    scale_fill_manual(values = c("male" = "#00798c", "female" = "#edae49"))


#having a little look at the island counts for each species
penguins %>% group_by(species) %>% count(island)


#plot of sex and body mass
ggplot(data = penguins, aes(x = species, y = body_mass_g, fill = sex)) +
    geom_boxplot(size = 1.5, alpha = 0.8)+
    theme_bw() +
    labs(x = "Sex", y = "Body mass (g)", title = "The association between body mass and sex in three species of Penguins")+
    scale_fill_manual(values = c("male" = "skyblue", "female" = "pink"))


#plot of flipper length and body mass
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g, colour = species)) +
    geom_point(size = 4)+
    geom_smooth(method = "lm", size = 2) +
    theme_bw() +
    labs(x = "Flipper Length (mm)", y = "Body mass (g)", title = "The association between Flipper length and body mass in three species of Penguins")+
    scale_colour_manual(values = c("Adelie" = "#00798c", "Chinstrap" = "#d1495b", "Gentoo" = "#edae49"))

# add beautiful plot
ggplot(data = penguins, aes(x = island, y = body_mass_g, colour = island, fill = island)) +
  geom_boxplot() +
  ggthemes::theme_par() + # add theme here
  labs(
    x = "island",
    y = "Body mass (g)",
    title = "The association between island and body mass"
  ) +
  scale_colour_manual(values = c(
    "Biscoe"    = "#00798c",
    "Dream"     = "#d1495b",
    "Torgersen" = "#edae49"
  )) +
  scale_fill_manual(values = c(
    "Biscoe"    = "lightblue",
    "Dream"     = "pink",
    "Torgersen" = "goldenrod4"
  ))

write.csv(
  penguins,
  file = file.path("data", "penguins.csv"),
  row.names = FALSE
)
