cd .\pizza\

#1 BUILD the generic flavor
tar -cvf pizza-1.0.tgz exec
cd ..
cp .\pizza\pizza-1.0.tgz  .

#2 UPLOAD the generic package to artifactory
jfrog rt u pizza-1.0.tgz generic-local/jfrog/bintray/bintray-webinar/pizza/

#3 BUILD the docker image
docker build -t ubuntu:5001/pizza:1.0 ./pizza/

#4 PUSH the docker image
docker login ubuntu:5001 -u admin
docker push ubuntu:5001/pizza:1.0

#5 we suppose all tests have been done and PROMOTE the image to prod repo
curl -uadmin -X POST "http://ubuntu:5001/artifactory/api/docker/docker-dev-local/v2/promote" -H "Content-Type: application/json" -T promote.json

#OPTIONNAL : we retag this image as latest
curl -uadmin -X POST "http://ubuntu:8081/artifactory/api/docker/docker-prod-local/v2/promote" -H "Content-Type: application/json" -T retag.json