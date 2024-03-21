here::i_am("code/00_table1_data.R")
data_location <- here::here("data", "obesity_data.csv")
obesity_data <- read.csv(data_location, header = TRUE)

library(knitr)
library(dplyr)

obesity_data_table1 <- obesity_data %>%
  group_by(Gender) %>%
  summarize(count = n(),
            mean_age = mean(Age, na.rm = TRUE),
            mean_height = mean(Height, na.rm = TRUE),
            mean_weight = mean(Weight, na.rm = TRUE),
            mean_BMI = mean(BMI, na.rm = TRUE)) %>%
  ungroup()

saveRDS(
  obesity_data_table1,
  file = here::here("output/table_data_1.rds")
)