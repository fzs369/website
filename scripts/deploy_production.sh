openssl aes-256-cbc -K $encrypted_13c03eac0538_key -iv $encrypted_13c03eac0538_iv -in .env-production.enc -out .env-staging -d && mv .env-staging .env && rsync -r --delete-after --quiet -e "ssh -o StrictHostKeyChecking=no" $TRAVIS_BUILD_DIR $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH