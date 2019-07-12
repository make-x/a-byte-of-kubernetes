# helm 

## 下载helm
```
wget https://get.helm.sh/helm-v2.14.1-linux-amd64.tar.gz

```

## 安装加入环境变量
```
mkdir helm
tar zxvf helm-v2.14.1-linux-amd64.tar.gz -C helm
将解压的文件 helm和tiller mv到/usr/local/bin

helm init --history-max 200  --stable-repo-url http://mirror.azure.cn/kubernetes/charts/

这个--history-max是保留的最大历史记录，如果不限制就会无限增大

helm init --upgrade  升级tiller   

```


## 看看tiller安装在那个节点
```
kubectl get pods -n kube-system -o wide 

去那个节点上拉去镜像

docker pull  gcr.azk8s.cn/kubernetes-helm/tiller:v2.14.1 && docker tag gcr.azk8s.cn/kubernetes-helm/tiller:v2.14.1 gcr.io/kubernetes-helm/tiller:v2.14.1

```

## helm stable 源
```
//这个好像不好用
http://mirror.azure.cn/kubernetes/charts/

```


## 常用命令
```
helm repo list 列出所有源

helm repo remove stable  删除源
helm repo add stable http://xxx/xxx.com 添加源

helm update 更改源后执行以下

helm search 
helm install 

```


## 安装一个redis试试
```
helm search redis

helm install stable/redis-ha

报错了吗?
https://github.com/helm/helm/issues/3055


```


### 我是怎么执行成功的
```
helm repo list 

NAME  	URL
local 	http://127.0.0.1:8879/charts
stable	https://kubernetes-charts.storage.googleapis.com


开启了翻墙


```


### stable/redis-ha
```
$ helm install stable/redis-ha
NAME:   intended-panther
LAST DEPLOYED: Wed Jul  3 22:34:23 2019
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/ConfigMap
NAME                                 DATA  AGE
intended-panther-redis-ha-configmap  3     0s
intended-panther-redis-ha-probes     3     0s

==> v1/Pod(related)
NAME                                READY  STATUS   RESTARTS  AGE
intended-panther-redis-ha-server-0  0/2    Pending  0         0s

==> v1/Role
NAME                       AGE
intended-panther-redis-ha  0s

==> v1/RoleBinding
NAME                       AGE
intended-panther-redis-ha  0s

==> v1/Service
NAME                                  TYPE       CLUSTER-IP      EXTERNAL-IP  PORT(S)             AGE
intended-panther-redis-ha             ClusterIP  None            <none>       6379/TCP,26379/TCP  0s
intended-panther-redis-ha-announce-0  ClusterIP  10.110.42.147   <none>       6379/TCP,26379/TCP  0s
intended-panther-redis-ha-announce-1  ClusterIP  10.106.18.156   <none>       6379/TCP,26379/TCP  0s
intended-panther-redis-ha-announce-2  ClusterIP  10.105.246.169  <none>       6379/TCP,26379/TCP  0s

==> v1/ServiceAccount
NAME                       SECRETS  AGE
intended-panther-redis-ha  1        0s

==> v1/StatefulSet
NAME                              READY  AGE
intended-panther-redis-ha-server  0/3    0s


NOTES:
Redis can be accessed via port 6379 and Sentinel can be accessed via port 26379 on the following DNS name from within your cluster:
intended-panther-redis-ha.default.svc.cluster.local

To connect to your Redis server:
1. Run a Redis pod that you can use as a client:

   kubectl exec -it intended-panther-redis-ha-server-0 sh -n default

2. Connect using the Redis CLI:

  redis-cli -h intended-panther-redis-ha.default.svc.cluster.local

```