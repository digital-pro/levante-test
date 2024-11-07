# Test script to use Michael Frank's rlevante package
library(dplyr)
library(purrr)
library(rlang)
library(knitr)
library(rmarkdown)
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
trial_table <- use_dataset$trials

