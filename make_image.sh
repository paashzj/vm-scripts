#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

wget https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img

cp ubuntu-20.04-server-cloudimg-amd64.img ubuntu-docker-amd64.img

apt-get update
sudo apt-get install -y qemu-kvm qemu libguestfs-tools
virt-customize -a ubuntu-20.04-server-cloudimg-amd64.img --root-password password:"$VM_PASSWORD"
virt-customize -a ubuntu-docker-amd64.img --run-command "apt-get update; apt-get install -y git; cd /root; git clone https://github.com/paashzj/vm-scripts.git --depth 1; bash /root/vm-scripts/docker/install/ubuntu/install_docker.sh"

cp ubuntu-docker-amd64.img ubuntu-minikube-amd64.img
virt-customize -a ubuntu-minikube-amd64.img --run-command "bash /root/vm-scripts/mini-kube/install/install_minikube.sh"

cp ubuntu-minikube-amd64.img ubuntu-dapr.img
virt-customize -a ubuntu-dapr.img --run-command "bash /root/vm-scripts/dapr/install/install_dapr.sh"
