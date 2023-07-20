# =============================================================================
# Class Survey Data
# This code creates a prepared version of the class survey data for use in the
# Repeated Operations I lab.
# Created: 2023-07-20
# Brad Cannell
# =============================================================================

library(dplyr, warn.conflicts = FALSE)
library(readr)
library(stringr)

# Import the class survey data
class_survey <- read_csv("/Users/bradcannell/Dropbox/Datasets/Class Survey/Class Survey 5141.csv")

# Remove the second row -- data labels
# Also remove the last column of all NA's
# Coerce all names to lowercase
class_survey <- class_survey %>%
  slice(-1) %>%
  rename_with(str_to_lower)

# Add the data to the datasets directory.
write_rds(class_survey, "/Users/bradcannell/Library/CloudStorage/Dropbox/Datasets/Class Survey/class_survey.Rds")
