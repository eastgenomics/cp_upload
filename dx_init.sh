#!/bin/bash
# Script to initialise dx toolkit for uploading CP data to DNAnexus
# DNAnexus auth token must be stored in dnanexus_token.txt and NOT in version control

echo "Initialising required DNAnexus components"

path="/software/packages/cp_upload"

token=$(cat $path/dnanexus_token.py)

if [ -z "$token" ]; then
    echo "Token not found, ensure is in the same dir as dx_init.sh. Exiting now."
    exit 1
fi

# get just token from file from between quotes
token=$(grep -oP '(?<=").*?(?=")' <<< "$token")

if [ -n "$(find $path -name 'dx-toolkit*.tar.gz')" ]; then
    # toolkit still tarred, unpack
    tar -xzf $path/dx-toolkit*.tar.gz
    rm $path/dx-toolkit*.tar.gz
    chmod -R a+x $path/dx-toolkit
fi

if [ -n "$(find $path -name 'dnanexus-upload-agent*.tar.gz')" ]; then
    # upload agent still tarred, unpack
    tar -xzf $path/dnanexus-upload-agent*.tar.gz
    mv $path/dnanexus-upload-agent*/ua ./ua
    rm -r $path/dnanexus-upload-agent*
fi

# sources toolkit ready for use
source $path/dx-toolkit/environment

# export required env variables
export DX_APISERVER_PROTOCOL=https
export DX_APISERVER_HOST=api.dnanexus.com
export DX_APISERVER_PORT=443
export DX_PROJECT_CONTEXT_ID=project-FqJ1xy84y2kyXKY70kQKJJzZ
export DX_SECURITY_CONTEXT='{"auth_token_type": "bearer", "auth_token": "$token"}'

echo "Initialisation complete."
echo ""
echo "Single files may be uploaded to 002_CP project with the following command: ua file_to_upload"
echo "Directories may be uploaded to 002_CP project with the following command: ua /data/CP/run_folder"
echo "NOTE: do NOT include a '/' after the dir name or the contents of the dir will be uploaded to the root of the project"
echo ""
echo "Documentation for the upload agent is available at:"
echo "https://documentation.dnanexus.com/user/objects/uploading-and-downloading-files/batch/upload-agent"
