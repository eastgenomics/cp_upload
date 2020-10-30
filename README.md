# CP Upload
Script to perform setup for uploading Clinical Pool (CP) data to DNAnexus.

## What does this script do?
Runs initialisation of dx-toolkit and dnanexus-upload-agent for uploading CP data to DNAnexus.
If it is being run for the first time both .tar.gz are unpacked and deleted, each use then just 
requires running the dx_init.sh script to set the environment variables for connecting to DNAnexus.

## What are typical use cases for this script?

Run to initialise required DNAnexus components before uploading data. 

## What data are required for this script to run?

This requires the dnanexus_token.txt file to be added to the script directory.

Initialise dx:
`dx_init`

Single files may be uploaded to 002_CP project with the following command: `ua file_to_upload`

Directories may be uploaded to 002_CP project with the following command: `ua /path_to_dir/run_folder`

n.b: do NOT include a '/' after the dir name or the contents of the dir will be uploaded to the root of the project.

Options for upload agent may be found [here][dx-url].

### This was made by EMEE GLH

[dx-url]: https://documentation.dnanexus.com/user/objects/uploading-and-downloading-files/batch/upload-agent
