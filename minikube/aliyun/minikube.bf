RUN apt-get update
RUN apt-get install -y git
RUN git clone https://github.com/paashzj/vm-scripts.git --depth 1
RUN bash vm-scripts/docker/install/ubuntu/install_docker.sh
RUN bash vm-scripts/minikube/install/install_minikube.sh
RUN bash vm-scripts/dapr/install/install_dapr.sh
