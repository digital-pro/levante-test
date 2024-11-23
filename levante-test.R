# Test script to use Michael Frank's rlevante package
library(dplyr)
library(purrr)
library(rlang)
library(knitr)
library(rmarkdown)
library(httr)
library(jsonlite)

# Use either the official version or our local version
library(rlevante)

# Don't use load as it masks some other functions
# use redivis::<function> to use its functions
loadNamespace("redivis") 

# Setup Redivis parameters
dataset_names <- "DE-pilot"
org_name <- "levante"

# Retrieve dataset(s)
our_datasets <- get_datasets(dataset_names, org_name, 'trials')
use_dataset <- our_datasets$`DE-pilot`
trials_table <- use_dataset$trials
users_table <- use_dataset$users

our_datasets_full <- get_datasets_full(dataset_names, org_name)

# We want to save a version here for caching
cache_dataset(use_dataset)

# clean up ragged tables
trials_table <- fix_table_types(trials_table)
tables_to_combine <- list(trials_table, users_table)

all_users <- collect_users(use_dataset)

all_data <- combine_tables(tables_to_combine)

# This is sample code for a client script
our_datasets <- list_organization_datasets()
found_dataset <- find_dataset(our_datasets, 'DE-pilot')
dataset_properties <- get_dataset_properties(found_dataset[[1]])

compare_name <- function(dataset) {
  if (dataset$properties$name == 'DE-pilot')
    return(TRUE)
  else
    return(FALSE)
  
}
found_dataset <- our_datasets[sapply(our_datasets, compare_name)]


