#!/usr/bin/env bash

echo "========================================================================="
echo "Maven Build Started"

echo "--------------------------------------------------------------------------"
cdir=$(dirname "$0")
folderPath=$(cd ${cdir}; pwd -P)
cd "$folderPath"
cd ../../../
rootPATH="$(pwd)"
echo "Root Path value is -----> $rootPATH"
echo "--------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------"
cd $rootPATH/wealthweb
mvn clean package
echo "Wealth Web Maven Build COMPLETED"
echo "--------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------"
cd $rootPATH/wealthusers
mvn clean package
echo "Wealth Users Maven Build COMPLETED"
echo "--------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------"
cd $rootPATH/wealthnotification
mvn clean package
echo "Wealth Notification Maven Build COMPLETED"
echo "--------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------"
cd $rootPATH/wealthfinancialplan
mvn clean package
echo "Wealth Financial Plan Maven Build COMPLETED"
echo "--------------------------------------------------------------------------"

echo "ALL MAVEN BUILD COMPLETED"
echo "========================================================================="
