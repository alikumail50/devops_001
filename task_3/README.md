# Kubernetes Cluster Management 


### Steps to troubleshoot Kubernetes pod crashing

When a Kubernetes pod keeps crashing, the first thing I’d do is check its status using kubectl get pods to see if it’s stuck in something like *CrashLoopBackOff*. Then, I’d dig deeper with *kubectl describe pod <pod-name>* to look for any errors or warnings in the events section. Next, I’d check the logs using kubectl logs <pod-name> to see what’s going on inside the container, if it’s already crashed, I’d add the *--previous* flag to see logs from the last run. 

Sometimes, the issue might be related to the cluster itself, so I’d run kubectl get events to check for things like resource shortages or scheduling problems. If the pod is hitting CPU or memory limits, I’d review its YAML or use kubectl top pod to see resource usage. Finally, if I’m still stuck, I’d exec into the pod with kubectl exec to poke around and see what’s happening in real time. It’s like being a detective, but for Kubernetes!


### Scale up a deployment and monitor CPU and memory

To scale up a deployment, I'll use cmd:
> kubectl scale deployment /deployment-name/ --replicas= /desired-replica-count/

To monitor CPU and memory usage:
> kubectl top pods  #CPU and memory usage of pods.
> kubectl top nodes #CPU and memory usage at the node level.


### Using ArgoCD for GitOps Deployment

You need to first install and define application manifest in a repo and then you need to create ArgoCD app to connect and sync Git repo with the cluster. ArgoCD will automatically deploy and sync changes from the git repo.