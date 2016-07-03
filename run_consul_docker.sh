#!/bin/bash

EXTERNAL_IP="<external ip>"
ROOT_AGENT_IP="<root agent ip>"
AGENT_CNT=1

docker run -d \
       --net=host -e 'CONSUL_LOCAL_CONFIG={"skip_leave_on_interrupt": true}' consul agent \
       -server -bind=${EXTERNAL_IP} \
       -retry-join=${ROOT_AGENT_IP} \
       -bootstrap-expect=${AGENT_CNT}
