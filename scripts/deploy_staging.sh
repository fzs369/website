#!/bin/bash
echo "Decrypting .env file"
openssl aes-256-cbc -K $encrypted_13c03eac0538_key -iv $encrypted_13c03eac0538_iv -in .env-staging.enc -out .env-staging -d 
echo "Placing env file..."
mv .env-staging .env
echo "Copying to server..."
rsync -r --delete-after --quiet -e "ssh -o StrictHostKeyChecking=no" $TRAVIS_BUILD_DIR $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH_STAGING
echo "Done running copy..."