#!/bin/sh

# Create Rabbitmq user
( sleep 5 ; \
rabbitmqctl add_user $RABBITMQ_ADMIN_USER $RABBITMQ_ADMIN_PASSWORD 2>/dev/null ; \
rabbitmqctl set_user_tags $RABBITMQ_ADMIN_USER administrator ; \
rabbitmqctl set_permissions -p / $RABBITMQ_ADMIN_USER  ".*" ".*" ".*" ; \
rabbitmqctl add_user $RABBITMQ_API_USER $RABBITMQ_API_PASSWORD 2>/dev/null ; \
rabbitmqctl set_user_tags $RABBITMQ_API_USER management ; \
rabbitmqctl set_permissions -p / $RABBITMQ_API_USER  ".*" ".*" ".*" ; \
rabbitmqctl delete_user guest ; \
echo "*** Admin User: '$RABBITMQ_ADMIN_USER' with password '$RABBITMQ_ADMIN_PASSWORD' completed. ***" ; \
echo "*** API User:  '$RABBITMQ_API_USER' with password '$RABBITMQ_API_PASSWORD' completed. ***" ; \
echo "*** Log in the WebUI at port 15672 (example: http:/localhost:15672) ***") &

# $@ is used to pass arguments to the rabbitmq-server command.
# For example if you use it like this: docker run -d rabbitmq arg1 arg2,
# it will be as you run in the container rabbitmq-server arg1 arg2
rabbitmq-server $@