# Access to Kubernetes Dashboard

After installing Kubernetes on the Mac as a feature of Docker Desktop no overview UI is present.

## Installing Kubernetes Dashboard

The following [Dashboard Guide](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/) shows how to install the Kubernetes Dashboard.

``` sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
```

In the next step the tutorial expects to create a bearer token. We need a service account for this and follow the [Tutorial](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md).

``` yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
```

This account can access the dashboard but will have restricted function. As described in the tutorial we need to bind the correct role.

``` yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
```

Each of the .yaml are present in this folder and can can be applied via `kubectl apply -f <file>`.

The token can be generated using the following command.

``` sh
kubectl -n kubernetes-dashboard create token admin-user
```
