#' Convert Excel Date Columns in a Data Frame
#'
#' Transforms specified columns in a data frame from Excel serial date numbers
#' to R date format. This function allows for multiple columns to be converted
#' simultaneously. The origin is set to account for Excel's leap year bug in 1900.
#' Columns specified are overwritten with the new date values, retaining their original names.
#'
#' @param data A data frame containing one or more columns to be converted.
#' @param dates A character vector with the names of the columns in `data` that need to be converted to date format.
#' @return A data frame with the specified columns converted to dates and overwritten.
#' @examples
#' df <- data.frame(id = 1:3, date1 = c(39338, 39339, 39340), date2 = c(39341, 39342, 39343))
#' converted_df <- excel_date(df, c("date1", "date2"))
#' @importFrom dplyr mutate
#' @importFrom base as.Date
#' @import tidyverse

excel_date <- function(data, dates) {
  require(tidyverse)
  
  data %>%
    mutate(across(all_of(dates), ~as.Date(., origin = "1899-12-30")))
}