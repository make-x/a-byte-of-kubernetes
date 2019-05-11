
`https://time.geekbang.org/column/article/39724`

按照极客时间的是无法安装成功的，报一个 not namespace 的错无，应该是太旧了

官方文档 `https://rook.io/docs/rook/v1.0/ceph-quickstart.html`
极客时间使用的是ceph

rook 文档写的：Ceph是一种高度可扩展的分布式存储解决方案，适用于具有多年生产部署的块存储，对象存储和共享文件系统。

ceph 还包含一些仪表盘检测状态相关的功能。

```
kubectl apply -f https://raw.githubusercontent.com/rook/rook/master/cluster/examples/kubernetes/ceph/common.yaml
输出
[root@master ~]# kubectl apply -f https://raw.githubusercontent.com/rook/rook/master/cluster/examples/kubernetes/ceph/common.yaml
namespace/rook-ceph created
customresourcedefinition.apiextensions.k8s.io/cephclusters.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephfilesystems.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephnfses.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephobjectstores.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephobjectstoreusers.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/cephblockpools.ceph.rook.io created
customresourcedefinition.apiextensions.k8s.io/volumes.rook.io created
clusterrole.rbac.authorization.k8s.io/rook-ceph-cluster-mgmt created
clusterrole.rbac.authorization.k8s.io/rook-ceph-cluster-mgmt-rules created
role.rbac.authorization.k8s.io/rook-ceph-system created
clusterrole.rbac.authorization.k8s.io/rook-ceph-global created
clusterrole.rbac.authorization.k8s.io/rook-ceph-global-rules created
clusterrole.rbac.authorization.k8s.io/rook-ceph-mgr-cluster created
clusterrole.rbac.authorization.k8s.io/rook-ceph-mgr-cluster-rules created
serviceaccount/rook-ceph-system created
rolebinding.rbac.authorization.k8s.io/rook-ceph-system created
clusterrolebinding.rbac.authorization.k8s.io/rook-ceph-global created
serviceaccount/rook-ceph-osd created
serviceaccount/rook-ceph-mgr created
role.rbac.authorization.k8s.io/rook-ceph-osd created
clusterrole.rbac.authorization.k8s.io/rook-ceph-mgr-system created
clusterrole.rbac.authorization.k8s.io/rook-ceph-mgr-system-rules created
role.rbac.authorization.k8s.io/rook-ceph-mgr created
rolebinding.rbac.authorization.k8s.io/rook-ceph-cluster-mgmt created
rolebinding.rbac.authorization.k8s.io/rook-ceph-osd created
rolebinding.rbac.authorization.k8s.io/rook-ceph-mgr created
rolebinding.rbac.authorization.k8s.io/rook-ceph-mgr-system created
clusterrolebinding.rbac.authorization.k8s.io/rook-ceph-mgr-cluster created


kubectl apply -f https://raw.githubusercontent.com/rook/rook/master/cluster/examples/kubernetes/ceph/operator.yaml
输出
[root@master ~]# kubectl apply -f https://raw.githubusercontent.com/rook/rook/master/cluster/examples/kubernetes/ceph/operator.yaml
deployment.apps/rook-ceph-operator created


kubectl apply -f https://raw.githubusercontent.com/rook/rook/master/cluster/examples/kubernetes/ceph/cluster.yaml

输出
[root@master ~]# kubectl apply -f https://raw.githubusercontent.com/rook/rook/master/cluster/examples/kubernetes/ceph/cluster.yaml
cephcluster.ceph.rook.io/rook-ceph created


```

### 获取rook状态
```
kubectl -n rook-ceph get pod
多刷新几次，到全部都都是run为止
[root@master ~]# kubectl -n rook-ceph get pod
NAME                                  READY   STATUS    RESTARTS   AGE
rook-ceph-agent-k4pwx                 1/1     Running   0          56s
rook-ceph-agent-ts89m                 1/1     Running   0          56s
rook-ceph-mon-a-6c7b68dd69-n74gc      1/1     Running   0          41s
rook-ceph-mon-b-67f6845f5b-lblpx      1/1     Running   0          32s
rook-ceph-operator-775cf575c5-tcd7q   1/1     Running   0          102s
rook-discover-49d9r                   1/1     Running   0          56s
rook-discover-httwv                   1/1     Running   0          56s

看到这样的状态应该是安装好了

装了再说 反正不会用

```
