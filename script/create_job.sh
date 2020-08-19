url="localhost:8080/v1/jobs"
content="$(curl -si -d "@data.json" -X POST $url | grep HTTP/1.1 | tail -1 | awk {'print $2'})"
if [ ! -z $content ] && [ $content -eq 201 ]
then
echo "Job created successfully"
else
echo "Job creation failed!"
fi
