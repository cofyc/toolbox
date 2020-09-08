# toolbox

## examples

```
docker run -it --rm --net container:$CONTAINER_ID --pid container:$CONTAINER_ID cofyc/toolbox
```

```
kubectl run -n default -it --rm toolbox --generator=run-pod/v1 --image cofyc/toolbox
```
