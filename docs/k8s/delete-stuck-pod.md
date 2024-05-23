# Force a pod termination

## Delete a pod when is stuck in a terminating state

```shell
#!/bin/bash

# Get all pods in Terminating state and delete them
terminating_pods=$(kubectl get pods | grep Terminating | awk '{print $1}')

if [ -n "$terminating_pods" ]; then
    echo "Deleting Terminating pods: $terminating_pods"
    kubectl patch pod $terminating_pods -n actions-runner-system -p '{"metadata":{"finalizers":null}}'
else
    echo "No pods in Terminating state found."
fi
```
