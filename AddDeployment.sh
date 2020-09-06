#!/bin/sh

rev=`git rev-parse HEAD`
message=`git show -s --format='%B' ${rev}`
user=`git show -s --format='%ae' ${rev}`

curl -X POST "https://api.newrelic.com/v2/applications/340636859/deployments.json" \
    -H "X-Api-Key:NRRA-e270621d47658ff6a48ac5bde6bba229bef46c8c27" \
    -i \
    -H "Content-Type: application/json" \
    -d \
'{
    "deployment": {
        "revision": "'${rev}'",
        "changelog": "'${message}'",
        "description": "'${message}'",
        "user": "'${user}'"
    }
}'
