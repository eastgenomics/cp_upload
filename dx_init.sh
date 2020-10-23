#!/bin/bash
# Script to initialise dx toolkit for uploading CP data to DNAnexus
# DNAnexus auth token must be stored in dnanexus_token.txt and NOT in version control

echo "Initialising required DNAnexus components"

token=$(cat dnanexus_token.txt)

if [ -z "$token" ]; then
    echo "Token not found, ensure is in the same dir as dx_init.sh. Exiting now."
    exit 1
fi

if [ -n "$(find . -name 'dx-toolkit*.tar.gz')" ]; then
    # toolkit still tarred, unpack
    tar -xzf ./dx-toolkit*.tar.gz
    rm ./dx-toolkit*.tar.gz
    chmod -R a+x dx-toolkit
fi

if [ -n "$(find . -name 'dnanexus-upload-agent*.tar.gz')" ]; then
    # upload agent still tarred, unpack
    tar -xzf ./dnanexus-upload-agent*.tar.gz
    mv ./dnanexus-upload-agent*/ua ./ua
    rm ./dnanexus-upload-agent*
fi

# sources toolkit ready for use
./dx-toolkit/environment

# export required env variables
export DX_APISERVER_PROTOCOL=https
export DX_APISERVER_HOST=api.dnanexus.com
export DX_APISERVER_PORT=443
export DX_PROJECT_CONTEXT_ID=project-FqJ1xy84y2kyXKY70kQKJJzZ
export DX_SECURITY_CONTEXT='{"auth_token_type": "bearer", "auth_token": "$token"}'

echo "Initialisation complete."
echo "Files may be uploaded to 002_CP project with the following command: ./ua --recursive dir_to_upload"
