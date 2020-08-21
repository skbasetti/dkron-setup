#! /bin/bash

/tmp/create_job.sh &

exec /usr/bin/dkron agent
