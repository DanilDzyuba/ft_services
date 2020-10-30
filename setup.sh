minikube start --vm-driver=virtualbox

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

eval $(minikube docker-env)
minikube dashboard &

kubectl apply -f srcs/metallb_config.yaml
kubectl apply -f srcs/influx_.yaml
kubectl apply -f srcs/grafana_.yaml
kubectl apply -f srcs/nginx_.yaml
kubectl apply -f srcs/ftp_.yaml
kubectl apply -f srcs/mysql_.yaml
kubectl apply -f srcs/wordpress_.yaml
kubectl apply -f srcs/pma_.yaml

docker build -t inf_i srcs/influxDB
docker build -t grafana_i srcs/grafana
docker build -t nginx_i srcs/nginx
docker build -t ftp_i srcs/ftp
docker build -t mysql_i srcs/mysql
docker build -t wp_i srcs/wordpress
docker build -t pma_i srcs/PMA


