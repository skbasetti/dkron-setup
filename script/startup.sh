#! /bin/bash
# Running dkron agent in background
nohup /usr/bin/dkron agent &
# sleeping for 10 seconds for dkron to startup
sleep 10
# CURL POST job data to /v1/jobs for job creation!
url="localhost:8080/v1/jobs"
content="$(curl -si -d "@/tmp/data.json" -X POST $url | grep HTTP/1.1 | tail -1 | awk {'print $2'})"
if [ ! -z $content ] && [ $content -eq 201 ]
then
echo "Job created successfully"
else
echo "Job creation failed!"
fi
# Showing dkron agent logs in foreground
tail -f nohup.out

