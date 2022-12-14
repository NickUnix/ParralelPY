#!/bin/bash
curl -X POST "localhost:8081/library?storage=qdpsolr&type=molecules" -H "accept: */*" -H "Content-Type: application/json" -d "{ \"name\": \"10m_xaa\"}"
mkdir /var/opt/data/upload/molecules/xaa
cd /var/opt/data/upload/molecules/xaa && ls | xargs -I {} unlink {}
cd /var/opt/data/
while read -r line;do ln -s /var/opt/data/$line /var/opt/data/upload/molecules/xaa/$line;done < xaa;
ls /var/opt/data/upload/molecules/xaa/
curl -X GET "localhost:8081/library" -H  "accept: */*" | grep 10m_xaa
curl -X GET "localhost:8081/upload/storage/qdpsolr/library/name/10m_xaa?libraryType=molecules" -H  "accept: */*"
