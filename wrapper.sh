#!/usr/bin/env bash

# Configure endpoints allowed to authenticate with CAS using file-based 
# service registry. 
if [ -n "${PRIVATE_GIT_SERVICE_REGISTRY+isset}" ] && [ -n "${BRANCH+isset}" ]
then
  git clone -b ${BRANCH} ${PRIVATE_GIT_SERVICE_REGISTRY} /tmp/service-registry
fi

# Run CAS as a standalone web application using the embedded servlet container
# Use server optimized JVM, and don't verify bytecode.  


exec java -server -noverify -Xmx2048M "org.springframework.boot.loader.WarLauncher"
