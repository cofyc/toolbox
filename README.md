# toolbox

## examples

```
docker run -it --rm --net container:$CONTAINER_ID --pid container:$CONTAINER_ID cofyc/toolbox
```

```
kubectl run -n default -it --rm toolbox --generator=run-pod/v1 --image cofyc/toolbox
```

## alternative images

- registry.cn-shanghai.aliyuncs.com/fuyecheng/toolbox:latest


## change mirror

```
sed -i -r 's/(deb|security).debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
```
