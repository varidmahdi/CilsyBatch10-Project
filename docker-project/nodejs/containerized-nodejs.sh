#!/bin/sh

git clone https://github.com/varidmahdi/CilsyBatch10-Project.git

cp -r CilsyBatch10-Project/nodejs-project/ /home/ubuntu/nodejs/nodejs_restapi/

rm -rf CilsyBatch10-Project

cp Dockerfile nodejs-project
         
cd nodejs-project
         
#untuk mengcompile agar menjadi image
docker build -t varidmahdi/nodejs_restapi:1 .
             
#untuk menjalankan container dengan nama image varidmahdi/nodejs_restapi:1
#docker container run -p 3000:3000 -it varidmahdi/nodejs_restapi:1
    
