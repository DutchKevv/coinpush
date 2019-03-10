# check if minikube is already running
if pgrep -x "minikube" > /dev/null
then
    echo 'minikube already running'
else
    echo 'minikube not running. starting minikube now'
    minikube start
    # minikube start --mount --mount-string ~/Projects/coinpush:/mount/
fi

# set current window as docker build environment and build for minikube
eval $(minikube docker-env)

# add autocomplete permanently to your bash shell.
echo "source <(kubectl completion bash)" >> ~/.bashrc

# # start FE pods
# cd ../coinpush-client-web 
# npm run k-delete-pod 
# npm run k-create-pod

# start mongo pod
cd ../coinpush-mongo 
npm run k-delete-pod
npm run k-create-pod

# # start API pods
# cd ../coinpush-api 
# npm run k-delete-pod
# npm run k-create-pod