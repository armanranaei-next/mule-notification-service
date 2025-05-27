
RANDV=$(date '+%Y%m%d%H%M%S')

echo "Generated random id for deploy on DEV: ${RANDV}"

<<<<<<< HEAD
mvn versions:set -DnewVersion=1.0.0-SNAPSHOT-${RANDV}

mvn deploy

mvn deploy -DmuleDeploy -Dmule.env=dev -Dcloudhub.environment=DEV
=======
mvn versions:set -DgenerateBackupPoms=false -DnewVersion=1.0.0-SNAPSHOT-${RANDV}

mvn clean deploy

mvn clean deploy -DmuleDeploy -Dmule.env=dev -Dcloudhub.environment=DEV
>>>>>>> feature/implementations
