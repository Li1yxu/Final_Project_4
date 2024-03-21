here::i_am("code/01_table1.R")

obesity_data_table1 <- readRDS(file = here::here("output/table_data_1.rds"))

library(kableExtra)

table_1 <- kable(x = obesity_data_table1,
      digits=2,
      col.names = c("Gender", "n", "Mean Age", "Mean Height(cm)", "Mean Weight(kg)", "Mean BMI"),
      caption = "Table 1: Descriptive Statistics for Patients") %>%
  kable_classic(full_width = FALSE, html_font = "Cambria", font_size=14)

saveRDS(
  table_1,
  file = here::here("output/table_1.rds")
)