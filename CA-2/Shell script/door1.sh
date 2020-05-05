#!/bin/bash
echo "Set replicas=0 to delete the pod"
startTime=$(date -u +%Y-%m-%dT%H:%M:%SZ)
kubectl scale deploy door1-deployment --replicas=0
echo "Set relicas=1 to create the pod"
kubectl scale deploy door1-deployment --replicas=1
echo "Sleep for 10 sec to run the container"
sleep 10
newPod=$(kubectl get pods | grep "door1-deployment" | awk '{print $1}')
newPodReadyTime=$(kubectl get pod $newPod -o json | jq -r '.status.containerStatuses[0].state.running.startedAt')
echo "Pod deletion time"
echo $startTime
echo "New Pod Ready time"
echo $newPodReadyTime
t=$(date -d $newPodReadyTime +%s)
t1=$(date -d $startTime +%s)
diff=$(expr $t - $t1)
echo "Pod Uptime in seconds:"$diff
