# For container, process is run as PID 1. PID 1 is special in linux, it ignore
# any signal with the default action. So process will not terminate on SIGINT
# or SIGTERM unless it is coded to do so.
# https://github.com/kubernetes/kubernetes/pull/64015
trap exit TERM
