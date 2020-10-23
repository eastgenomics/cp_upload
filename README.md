# CP Upload
Script to perform setup for uploading CP data to DNAnexus

## What does this script do?
Runs initialisation of dx-toolkit and dnanexus-upload-agent for uploading CP data to DNAnexus.
If it is being run for the first time both .tar.gz are unpacked and deleted, each use then just 
requires running the dx_init.sh script to set the environment variables for connecting to DNAnexus.

## What are typical use cases for this script?

Run to initialise required DNAnexus components before uploading data. 

## What data are required for this script to run?

This requires the dnanexus_token.txt file to be added to the script directory.

### This was made by EMEE GLH
