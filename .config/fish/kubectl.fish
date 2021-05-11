alias edit-kubectl='vi $HOME/.config/fish/kubectl.fish'

alias k='kubectl'

alias ka='kubectl apply'
alias kaf='kubectl apply -f'

alias kar='kubectl api-resources'

alias kd='kubectl describe'
alias kl='kubectl logs'
alias kdbg='kubectl debug'

alias kccc='kubectl config current-context'
alias kcgc='kubectl config get-contexts'
alias kcgcl='kubectl config get-clusters'
alias kcuc='kubectl config use-context'

alias kgc='kubectl get configmaps'
alias kdc='kubectl describe configmaps'
alias kec='kubectl edit configmaps'
alias kgd='kubectl get deployments'
alias kdd='kubectl describe deployments'
alias ked='kubectl edit deployments'
alias kgdc='kubectl get deploymentconfigs'
alias kddc='kubectl describe deploymentconfigs'
alias kedc='kubectl edit deploymentconfigs'
alias kgp='kubectl get pods'
alias kdp='kubectl describe pods'
alias kep='kubectl edit pods'
alias kgr='kubectl get routes'
alias kdr='kubectl describe routes'
alias ker='kubectl edit routes'
alias kgs='kubectl get secrets'
alias kds='kubectl describe secrets'
alias kes='kubectl edit secrets'
alias kgsvc='kubectl get services'
alias kdsvc='kubectl describe services'
alias kesvc='kubectl edit services'

alias ks='kubectl scale deployments'
alias ksdc='kubectl scale deploymentconfigs'

alias kroh='kubectl rollout history deployments'
alias krohdc='oc rollout history deploymentconfigs'
alias kror='kubectl rollout restart deployments'
alias krordc='oc rollout restart deploymentconfigs'
alias kros='kubectl rollout status deployments'
alias krosdc='oc rollout status deploymentconfigs'
alias krou='kubectl rollout undo deployments'
alias kroudc='oc rollout undo deploymentconfigs'

alias ku='kubectl kustomize'
alias kua='kubectl apply -k'
alias kug='kubectl get -k'
alias kud='kubectl describe -k'

function kgts
  kubectl get secret $argv[1] -o json |\
  jq --raw-output ". | .data.\"$argv[2]\"" |\
  base64 -D > $argv[2]
  echo "Created $argv[2]"
end

function kpts
  kubectl patch secret $argv[1] \
  --type=json \
  -p="[{"op": "replace", "path": "/data/$argv[2]", "value": "\"(base64 $argv[2])\""}]"
end
