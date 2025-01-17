#!/bin/bash
set -ex

BOT_BUCKET="$(aws cloudformation describe-stacks --stack-name "Id42BotAppStack" --query 'Stacks[0].Outputs[?OutputKey==`BotBucketName`].OutputValue' --output text)"
echo "$BOT_BUCKET"
aws s3 cp id42_bot/target/dist/* "s3://$BOT_BUCKET/"
pushd id42_cdk
cdk deploy --require-approval=never --all
popd

echo "id42 deploy completed"