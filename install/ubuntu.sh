# These base components need to be installed
sudo apt update

sudo apt install socat -y
sudo apt install conntrack -y

sudo apt install ebtables -y
sudo apt install ipset -y
sudo apt install ipvsadm -y

sudo apt install docker.io -y
sudo apt install containerd -y
sudo apt install nfs-kernel-server -y
sudo apt install nfs-common -y
sudo apt install ceph-common -y
sudo apt install glusterfs-client -y
sudo apt install glusterfs-server -y

# Install KubeSphere
curl -sfL https://get-kk.kubesphere.io | VERSION=v2.2.1 sh -
chmod +x kk

sudo su
./kk create cluster --with-kubernetes v1.22.10 --with-kubesphere v3.3.0 -yes
kubectl logs -n kubesphere-system $(kubectl get pod -n kubesphere-system -l 'app in (ks-install, ks-installer)' -o jsonpath='{.items[0].metadata.name}') -f

####Install Desktop
helm repo add edge-plus https://littlelollipop.github.io/awesome-helm-charts/
helm repo update 
helm install my-edge-desktop edge-plus/edge-desktop
