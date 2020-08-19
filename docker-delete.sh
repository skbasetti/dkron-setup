images=`sudo docker images | aws '{ print $3 }'`
echo $images
