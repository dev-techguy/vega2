#!/bin/sh

cd jwt-grant-generator/
GRANT=$(java -jar target/jwt-grant-generator-1.0-SNAPSHOT-jar-with-dependencies.jar ../application.properties)
TOKEN=$(curl -kX POST "https://oidc-ver2.difi.no/idporten-oidc-provider/token" -H "Content-type: application/x-www-form-urlencoded" -d "grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Ajwt-bearer&assertion=$GRANT" | jq -r .access_token)

echo "Authorization: Bearer $TOKEN"

