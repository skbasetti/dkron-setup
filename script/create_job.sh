#! /bin/bash

# Wait for service to start
url="localhost:8080/v1/jobs"
while :
do
   out=$(curl -si $url | grep HTTP/1.1 | tail -1 | awk {'print $2'})
   if [[ $out != 200 ]]
   then
       echo "Waiting for service to start!"
       sleep 5;
   else
       echo "Service has started, performing Job creation!"
       break
   fi
done

# CURL POST job data to /v1/jobs for job creation!
content="$(curl -si -d "@/tmp/data.json" -X POST $url | grep HTTP/1.1 | tail -1 | awk {'print $2'})"
if [ ! -z $content ] && [ $content -eq 201 ]
then
echo "Job created successfully"
else
echo "Job creation failed!"
fi
