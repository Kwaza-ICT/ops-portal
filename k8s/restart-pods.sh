#!/bin/bash

# Check if namespace argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <namespace>"
  exit 1
fi

NAMESPACE=$1

# Get all pod names within the specified namespace
POD_NAMES=$(kubectl get pods -n $NAMESPACE -o=jsonpath='{.items[*].metadata.name}')

# Restart each pod
for POD_NAME in $POD_NAMES; do
  echo "Restarting pod: $POD_NAME"
  kubectl delete pod $POD_NAME -n $NAMESPACE --grace-period=0 --force
done

echo "All pods in namespace $NAMESPACE have been restarted."
