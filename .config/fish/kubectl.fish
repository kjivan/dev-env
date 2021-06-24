function edit-kubectl -w "vi $HOME/.config/fish/kubectl.fish"; vi $HOME/.config/fish/kubectl.fish $argv; end

function k -w "kubectl"; kubectl $argv; end

function ka -w "kubectl apply"; kubectl apply $argv; end
function kaf -w "kubectl apply -f"; kubectl apply -f $argv; end

function kar -w "kubectl api-resources"; kubectl api-resources $argv; end

function kd -w "kubectl describe"; kubectl describe $argv; end
function kl -w "kubectl logs"; kubectl logs $argv; end
function kdbg -w "kubectl debug"; kubectl debug $argv; end

function kccc -w "kubectl config current-context"; kubectl config current-context $argv; end
function kcgc -w "kubectl config get-contexts"; kubectl config get-contexts $argv; end
function kcgcl -w "kubectl config get-clusters"; kubectl config get-clusters $argv; end
function kcuc -w "kubectl config use-context"; kubectl config use-context $argv; end

function kgc -w "kubectl get configmaps"; kubectl get configmaps $argv; end
function kdc -w "kubectl describe configmaps"; kubectl describe configmaps $argv; end
function kec -w "kubectl edit configmaps"; kubectl edit configmaps $argv; end
function kgd -w "kubectl get deployments"; kubectl get deployments $argv; end
function kdd -w "kubectl describe deployments"; kubectl describe deployments $argv; end
function ked -w "kubectl edit deployments"; kubectl edit deployments $argv; end
function kgdc -w "kubectl get deploymentconfigs"; kubectl get deploymentconfigs $argv; end
function kddc -w "kubectl describe deploymentconfigs"; kubectl describe deploymentconfigs $argv; end
function kedc -w "kubectl edit deploymentconfigs"; kubectl edit deploymentconfigs $argv; end
function kgp -w "kubectl get pods"; kubectl get pods $argv; end
function kdp -w "kubectl describe pods"; kubectl describe pods $argv; end
function kep -w "kubectl edit pods"; kubectl edit pods $argv; end
function kgr -w "kubectl get routes"; kubectl get routes $argv; end
function kdr -w "kubectl describe routes"; kubectl describe routes $argv; end
function ker -w "kubectl edit routes"; kubectl edit routes $argv; end
function kgs -w "kubectl get secrets"; kubectl get secrets $argv; end
function kds -w "kubectl describe secrets"; kubectl describe secrets $argv; end
function kes -w "kubectl edit secrets"; kubectl edit secrets $argv; end
function kgsvc -w "kubectl get services"; kubectl get services $argv; end
function kdsvc -w "kubectl describe services"; kubectl describe services $argv; end
function kesvc -w "kubectl edit services"; kubectl edit services $argv; end
function kgi -w "kubectl get images"; kubectl get images $argv; end
function kdi -w "kubectl describe images"; kubectl describe images $argv; end
function kei -w "kubectl edit images"; kubectl edit images $argv; end

function ks -w "kubectl scale deployments"; kubectl scale deployments $argv; end
function ksdc -w "kubectl scale deploymentconfigs"; kubectl scale deploymentconfigs $argv; end

function kroh -w "kubectl rollout history deployments"; kubectl rollout history deployments $argv; end
function krohdc -w "oc rollout history deploymentconfigs"; oc rollout history deploymentconfigs $argv; end
function kror -w "kubectl rollout restart deployments"; kubectl rollout restart deployments $argv; end
function krordc -w "oc rollout restart deploymentconfigs"; oc rollout restart deploymentconfigs $argv; end
function kros -w "kubectl rollout status deployments"; kubectl rollout status deployments $argv; end
function krosdc -w "oc rollout status deploymentconfigs"; oc rollout status deploymentconfigs $argv; end
function krou -w "kubectl rollout undo deployments"; kubectl rollout undo deployments $argv; end
function kroudc -w "oc rollout undo deploymentconfigs"; oc rollout undo deploymentconfigs $argv; end

function ku -w "kubectl kustomize"; kubectl kustomize $argv; end
function kua -w "kubectl apply -k"; kubectl apply -k $argv; end
function kug -w "kubectl get -k"; kubectl get -k $argv; end
function kud -w "kubectl describe -k"; kubectl describe -k $argv; end

function kgsl
  kubectl get secret $argv[1] -o json | jq '.data | keys[]';
end

function kgss
  kubectl get secret $argv[1] -o json |\
  jq --raw-output ". | .data.\"$argv[2]\"" |\
  base64 -D
end

function kpss
  kubectl patch secret $argv[1] \
  --type=json \
  -p="[{"op": "replace", "path": "/data/$argv[2]", "value": "\"(echo $argv[2] | base64)\""}]"
end

function kgsf
  kubectl get secret $argv[1] -o json |\
  jq --raw-output ". | .data.\"$argv[2]\"" |\
  base64 -D > $argv[2]
  echo "Created $argv[2]"
end

function kpsf
  kubectl patch secret $argv[1] \
  --type=json \
  -p="[{"op": "replace", "path": "/data/$argv[2]", "value": "\"(base64 $argv[2])\""}]"
end
