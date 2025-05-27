
RANDV=$RANDOM

echo "Generated random id for deploy on PROD: ${RANDV}"

mvn versions:set -DnewVersion=1.0.0-${RANDV}

mvn deploy

mvn deploy -DmuleDeploy -Dmule.env=prod -Dcloudhub.environment=PROD