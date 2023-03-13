library(fivethirtyeight)
library(tidyverse)
library(rmarkdown)

render(input = "~/Desktop/ARP/projects/Report.Rmd")

state <- bad_drivers %>%
  pull(state)

reports <- tibble(
  input = "~/Desktop/ARP/projects/Report.Rmd",
  output_file = stringr::str_c("~/Desktop/ARP/projects/output", state, "-driving.html"),
  params = map(state, ~list(state = .))
)

reports %>%
  pwalk(render)
