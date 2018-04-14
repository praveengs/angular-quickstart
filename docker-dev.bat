set CONTAINER_NAME=my-backend-container_DEV  
rem set WEBSITE_ASSETS=/path/to/source/frontend-codebase/assets

docker stop %CONTAINER_NAME%  
docker rm %CONTAINER_NAME%

docker run -d -p 4200:4200 --name ${CONTAINER_NAME} -e "NODE_ENV=development" 
-v ${WEBSITE_ASSETS}:/static/ -v `pwd`:/app library/node:8-alpine /app/scripts/dev_entrypoint.sh  

 docker build -f Dockerfile-dev . -t praveengs/ngappimage
docker rm mywebapp2
 docker run -p 4200:4200 --name mywebapp2 -e "NODE_ENV=development" -v `pwd`:/myapp praveengs/ngappimage

docker run -p 4200:4200 --name mywebapp2 -e "NODE_ENV=development" -v `pwd`:/home/nodejs/myapp praveengs/ngappimage 