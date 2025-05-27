
RANDV=$(date '+%Y%m%d%H%M%S')

echo "Generated random id for deploy on DEV: ${RANDV}"

REPLICA=1
VCORE=0.1
MULE_ENV=dev

echo "\n\n#####INIT PROPERTIES####\n"
GROUP_ID=$(cat pom.xml | xq -x //project/groupId)
ORIGINAL_VERSION=$(cat pom.xml | xq -x //project/version)
ARTIFACT_ID=$(cat pom.xml | xq -x //project/artifactId)
APP_NAME=${ARTIFACT_ID}-${MULE_ENV}

RUNTIME_VERSION=$(cat pom.xml | xq -x //project/properties/app.runtime)
VERSION="$(cat pom.xml | xq -x //project/version)-${RANDV}"
PUBLIC_ENDPOINT=https://${ARTIFACT_ID}-${MULE_ENV}.sbx.api.florencenext.com/
PRIVATE_SPACE_ID=fce0a214-5063-4384-a592-2e907477aebb

echo "GROUP_ID: ${GROUP_ID},\nARTIFACT_ID:${ARTIFACT_ID},\nVERSION:${VERSION}\n"

echo "\n\n#####DEPLOY TO EXCHANGE####\n"

mvn versions:set -DnewVersion=${VERSION}
mvn deploy


echo "\n\n#####DEPLOY TO CH2####\n"


EXISTING_APP_ID=$(anypoint-cli-v4 runtime-mgr:application:list --output json | jq -r ".[]| select(.name==\"${APP_NAME}\") | .id")


if [ -z "$EXISTING_APP_ID" ]
then
    echo "deploy:: App not exist,first deploy"
    anypoint-cli-v4 runtime-mgr:application:deploy \
    ${APP_NAME} \
    ${PRIVATE_SPACE_ID} \
    ${RUNTIME_VERSION} \
    ${ARTIFACT_ID} \
    --assetVersion ${VERSION} \
    --groupId ${GROUP_ID}
    --publicEndpoints ${PUBLIC_ENDPOINT}
else
    echo "deploy:: App already exist with id: ${EXISTING_APP_ID}"
    anypoint-cli-v4 runtime-mgr:application:modify \
    ${EXISTING_APP_ID} \
    --runtimeVersion ${RUNTIME_VERSION} \
    --artifactId ${ARTIFACT_ID} \
    --assetVersion ${VERSION} \
    --groupId ${GROUP_ID} \
    --publicEndpoints ${PUBLIC_ENDPOINT}
fi