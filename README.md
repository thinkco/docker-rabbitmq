# RabbitMQ

![RabbitMQ](https://upload.wikimedia.org/wikipedia/en/thumb/7/71/RabbitMQ_logo.svg/800px-RabbitMQ_logo.svg.png)

Fully loaded RabbitMQ container, pre-configured for convenience. This container is based on the ```rabbitmq:3.7-management``` RabbitMQ official image.

The following protocols are enabled:

| Protocol          | Port          | Plugin                |
| ----------------- | ------------- | --------------------- |
| mqtt              |   1883        | rabbitmq_mqtt         |
| amqp              |   5672        | *base system*         |
| clustering        |   25672       | *base system*         |
| http              |   15672       | rabbitmq_management   |
| http/web-stomp    |   15674       | rabbitmq_web_stomp    |
| http/web-mqtt     |   15675       | rabbitmq_web_mqtt     |
| stomp             |   61613       | rabbitmq_stomp        |

The following plugins are enabled:
* rabbitmq_federation_management
 * rabbitmq_shovel_management
 * rabbitmq_management
 * rabbitmq_web_mqtt
 * rabbitmq_mqtt
 * rabbitmq_web_dispatch
 * rabbitmq_web_stomp
 * rabbitmq_stomp
 * rabbitmq_shovel
 * rabbitmq_federation
 * rabbitmq_management_agent

 ## Usage

 Launch:
 ```docker
 docker run -d --hostname rabbitmq --name rabbitmq -p 15671:15671/tcp -p 15672:15672/tcp \
            -p 15674:15674/tcp -p 15675:15675/tcp -p 1883:1883/tcp -p 25672:25672/tcp \
            -p 4369:4369/tcp -p 5671:5671/tcp -p 5672:5672/tcp -p 61613:61613/tcp \
            thinkcode-rabbitmq:latest
```

Stop:
```docker
docker stop rabbitmq
```

Start:
```docker
docker start rabbitmq
```

Remove:
```docker
docker rm rabbitmq
```
 ## Environment Variables

 ### Users

The following variables can be set to specify a user+password with administrator permissions:
```bash
ENV RABBITMQ_ADMIN_USER
ENV RABBITMQ_ADMIN_PASSWORD 
```
By detault, this is set to user ```admin``` and password ```adminpass```.

The following varibles can be set to specify a user+password with management permissions (to access the API):
```bash
ENV RABBITMQ_API_USER api
ENV RABBITMQ_API_PASSWORD api
```
By detault, this is set to user ```api``` and password ```apipass```.
### Virtual Host Configuration
```bash
RABBITMQ_DEFAULT_VHOST
```

### SSL Configuration

For SSL configuration without the management plugin:
```bash
RABBITMQ_SSL_CACERTFILE
RABBITMQ_SSL_CERTFILE
RABBITMQ_SSL_DEPTH
RABBITMQ_SSL_FAIL_IF_NO_PEER_CERT
RABBITMQ_SSL_KEYFILE
RABBITMQ_SSL_VERIFY
```

For SSL configuration using the management plugin:
```bash
RABBITMQ_MANAGEMENT_SSL_CACERTFILE
RABBITMQ_MANAGEMENT_SSL_CERTFILE
RABBITMQ_MANAGEMENT_SSL_DEPTH
RABBITMQ_MANAGEMENT_SSL_FAIL_IF_NO_PEER_CERT
RABBITMQ_MANAGEMENT_SSL_KEYFILE
RABBITMQ_MANAGEMENT_SSL_VERIFY
```

### Other

Please refer to the official [RabbitMQ Docker Hub](https://hub.docker.com/_/rabbitmq) for more parameters.

---
Brought to you by Thinkco.de!

![ThinkCode](https://avatars2.githubusercontent.com/u/31565447?s=200) 
