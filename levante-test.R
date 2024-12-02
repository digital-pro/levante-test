# Test script to use Michael Frank's rlevante package

library(dplyr)
library(purrr)
library(rlang)
library(knitr)
library(rmarkdown)
library(httr)
library(jsonlite)
library(tryCatchLog)

# Use either the official version or our local version
devtools::install(pkg = '../rlevante')
library(rlevante)

# Don't use load as it masks some other functions
# use redivis::<function> to use its functions
loadNamespace("redivis") 

# Setup Redivis parameters
org_name <- "levante"
tbls <- c("groups", "runs", "trials", "user_groups", "users")
dataset_names <- c("DE-pilot")

# Get dataset(s)
#our_dataset <- get_datasets_full(dataset_name, org_name)
#our_dataset_properties <- rlevante::get_dataset_properties(org_name, dataset_names)


our_dataset <- get_datasets(dataset_names, org_name, tables = tbls)

# We _might_ want to save a version here for caching
#debug_data <- cache_dataset(our_dataset[[1]], our_dataset_properties)


