#!/usr/bin/env bash

echo "========================================================================="
echo "DockerHub Build Started"
echo "--------------------------------------------------------------------------"

cdir=$(dirname "$0")
folderPath=$(cd ${cdir}; pwd -P)
cd "$folderPath"
cd ../../../
rootPATH="$(pwd)"
echo "--------------------------------------------------------------------------"
echo "Root Path value is -----> $rootPATH"
echo "--------------------------------------------------------------------------"
# docker login -u gandhicloudlab

# Docker Image related variables
# Example : docker.io/gandhicloudlab/welathcare-web-ocp-oss:0.0.1
export IMAGE_SUFFIX=ocp-oss:0.0.1
export REGISTRY_USER=$(oc whoami)
export NAMESPACE=wealthcare-ns
export OPENSHIFT_REGISTRY_NAME=$(oc get route -n openshift-image-registry | awk '{print $2}' | awk 'NR==2')

echo "--------------------------------------------------------------------------"
# Login into OpenShift Image Registry
docker login -u $(oc whoami) -p $(oc whoami -t) ${OPENSHIFT_REGISTRY_NAME}
echo "DockerHub LOGIN SUCCESSFUL!!!"
echo "--------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------"
cd $rootPATH/wealthweb/config
sh 02-build-dockerhub.sh
echo "Wealth Web Build COMPLETED"
echo "--------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------"
cd $rootPATH/wealthusers/config
sh 02-build-dockerhub.sh
echo "Wealth Users Build COMPLETED"
echo "--------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------"
cd $rootPATH/wealthnotification/config
sh 02-build-dockerhub.sh
echo "Wealth Notification Build COMPLETED"
echo "--------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------"
cd $rootPATH/wealthfinancialplan/config
sh 02-build-dockerhub.sh
echo "Wealth Financial Plan Build COMPLETED"
echo "--------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------"
echo "DockerHub Build COMPLETED"
echo "========================================================================="
