here::i_am("code/02_figure1.R")
data_location <- here::here("data", "obesity_data.csv")
obesity_data <- read.csv(data_location, header = TRUE)

library(ggplot2)

figure_1 <- ggplot(obesity_data, aes(x = Age, y = BMI)) +
  geom_point() +
  geom_smooth(method = lm) +
  theme_bw()

saveRDS(
  figure_1,
  file = here::here("output/figure_1.rds")
)