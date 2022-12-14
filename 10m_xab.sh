#!/bin/bash
curl -X POST "localhost:8081/library?storage=qdpsolr&type=molecules" -H "accept: */*" -H "Content-Type: application/json" -d "{ \"name\": \"10m_xab\"}"
mkdir /var/opt/data/upload/molecules/xab
cd /var/opt/data/upload/molecules/xab && ls | xargs -I {} unlink {}
cd /var/opt/data/
while read -r line;do ln -s /var/opt/data/$line /var/opt/data/upload/molecules/xab/$line;done < xab;
ls /var/opt/data/upload/molecules/xab/
curl -X GET "localhost:8081/library" -H  "accept: */*" | grep 10m_xab
curl -X GET "localhost:8081/upload/storage/qdpsolr/library/name/10m_xab?libraryType=molecules" -H  "accept: */*"
