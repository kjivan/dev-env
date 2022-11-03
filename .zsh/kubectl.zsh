alias edit-kubectl="vi $HOME/.config/fish/kubectl.fish \"$@\""

alias k="kubectl \"$@\""

alias ka="kubectl apply \"$@\""
alias kaf="kubectl apply -f \"$@\""
alias kadir="kubectl apply -f \"$@\""
alias kastdin="kubectl apply -f - \"$@\""

alias kar="kubectl api-resources \"$@\""

alias kd="kubectl describe \"$@\""
alias kl="kubectl logs \"$@\""
alias kld="kubectl logs deployments/\"$@\""
alias kldc="kubectl logs deploymentconfigs/\"$@\""
alias kdbg="kubectl debug \"$@\""

alias kccc="kubectl config current-context \"$@\""
alias kcgc="kubectl config get-contexts \"$@\""
alias kcgcl="kubectl config get-clusters \"$@\""
alias kcuc="kubectl config use-context \"$@\""

alias kgc="kubectl get configmaps \"$@\""
alias kdc="kubectl describe configmaps \"$@\""
alias kec="kubectl edit configmaps \"$@\""

alias kgd="kubectl get deployments \"$@\""
alias kdd="kubectl describe deployments \"$@\""
alias ked="kubectl edit deployments \"$@\""
alias ksd="kubectl scale deployments \"$@\""
alias krord="kubectl rollout restart deployments \"$@\""
alias krosd="kubectl rollout status deployments \"$@\""
alias krohd="kubectl rollout history deployments \"$@\""
alias kroud="kubectl rollout undo deployments \"$@\""

alias kgss="kubectl get statefulsets \"$@\""
alias kdss="kubectl describe statefulsets \"$@\""
alias kess="kubectl edit statefulsets \"$@\""
alias ksss="kubectl scale statefulsets \"$@\""
alias krorss="kubectl rollout restart statefulsets \"$@\""
alias krosss="kubectl rollout status statefulsets \"$@\""
alias krohss="kubectl rollout history statefulsets \"$@\""
alias krouss="kubectl rollout undo statefulsets \"$@\""

alias kgrs="kubectl get replicasets \"$@\""
alias kdrs="kubectl describe replicasets \"$@\""
alias kers="kubectl edit replicasets \"$@\""

alias kgp="kubectl get pods \"$@\""
alias kdp="kubectl describe pods \"$@\""
alias kep="kubectl edit pods \"$@\""

alias kgr="kubectl get routes \"$@\""
alias kdr="kubectl describe routes \"$@\""
alias ker="kubectl edit routes \"$@\""

alias kgi="kubectl get ingress \"$@\""
alias kdi="kubectl describe ingress \"$@\""
alias kei="kubectl edit ingress \"$@\""

alias kges="kubectl get externalsecrets \"$@\""
alias kdes="kubectl describe externalsecrets \"$@\""
alias kees="kubectl edit externalsecrets \"$@\""
alias kgs="kubectl get secrets \"$@\""
alias kds="kubectl describe secrets \"$@\""
alias kes="kubectl edit secrets \"$@\""

alias kgsvc="kubectl get services \"$@\""
alias kdsvc="kubectl describe services \"$@\""
alias kesvc="kubectl edit services \"$@\""

alias kgimg="kubectl get images \"$@\""
alias kdimg="kubectl describe images \"$@\""
alias keimg="kubectl edit images \"$@\""

alias ku="kubectl kustomize \"$@\""
alias kua="kubectl apply -k \"$@\""
alias kug="kubectl get -k \"$@\""
alias kud="kubectl describe -k \"$@\""

alias kexec="kubectl exec -it \"$@\""

kgsl() {
  kubectl get secret \"$@\" -o json | jq '.data | keys[]';
}

kgsstr() {
  kubectl get secret \"$@\"[1] -o json |\
  jq --raw-output ". | .data.\"\"$@\"[2]\"" |\
  base64 -D
}

kpsstr() {
  kubectl patch secret $1 \
  --type=json \
  -p="[{"op": "replace", "path": "/data/$2", "value": "\"(echo $3 | base64)\""}]"
}

kgsf() {
  kubectl get secret $1 -o json |\
  jq --raw-output ". | .data.$2" |\
  base64 -D > $2
  echo "Created $2"
}

kpsf() {
  kubectl patch secret $1 \
  --type=json \
  -p="[{"op": "replace", "path": "/data/$2", "value": "\"(base64 $2)\""}]"
}

kgsaf() {
  kubectl get secret $1 -o json |\
  jq --raw-output ".data | to_entries | map([.key, .value]) | .[] | @tsv" |\
  xargs -n2 -P 2 -- bash -c 'echo "$1" | base64 -D > $0'
}
