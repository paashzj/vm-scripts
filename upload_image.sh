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

wget https://gosspublic.alicdn.com/ossutil/1.7.9/ossutil64
chmod +x ossutil64
./ossutil64 -i $ALI_AK -k $ALI_SK -e oss-cn-hongkong.aliyuncs.com cp ubuntu-docker-amd64.img  oss://$BUCKET_NAME/
./ossutil64 -i $ALI_AK -k $ALI_SK -e oss-cn-hongkong.aliyuncs.com cp ubuntu-minikube-amd64.img  oss://$BUCKET_NAME/
./ossutil64 -i $ALI_AK -k $ALI_SK -e oss-cn-hongkong.aliyuncs.com cp ubuntu-dapr.img  oss://$BUCKET_NAME/
