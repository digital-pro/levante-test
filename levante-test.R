# Test script to use Michael Frank's rlevante package
library(dplyr)
library(purrr)
library(rlang)
library(knitr)
library(rmarkdown)
library(httr)
library(jsonlite)

# Use either the official version or our local version
devtools::install(pkg = '../rlevante')
library(rlevante)

# Don't use load as it masks some other functions
# use redivis::<function> to use its functions
loadNamespace("redivis") 

# Setup Redivis parameters
dataset_name <- "DE-pilot"
org_name <- "levante"

# Retrieve dataset(s)
our_dataset <- get_datasets_full(dataset_name, org_name)
our_dataset_properties <- get_dataset_properties(org_name, dataset_name)
#trials_table <- get_datasets(dataset_name, org_name, 'trials')


# We want to save a version here for caching
debug_data <- cache_dataset(our_dataset[[1]], our_dataset_properties)

