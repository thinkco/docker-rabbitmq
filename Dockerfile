FROM rabbitmq:3.7-management

ENV RABBITMQ_ADMIN_USER admin
ENV RABBITMQ_ADMIN_PASSWORD adminpass
ENV RABBITMQ_API_USER api
ENV RABBITMQ_API_PASSWORD apipass
ENV RABBITMQ_HIPE_COMPILE 1

RUN rabbitmq-plugins enable --offline rabbitmq_management && \
    rabbitmq-plugins enable --offline rabbitmq_mqtt && \
    rabbitmq-plugins enable --offline rabbitmq_web_mqtt && \
    rabbitmq-plugins enable --offline rabbitmq_federation && \
    rabbitmq-plugins enable --offline rabbitmq_federation_management && \
    rabbitmq-plugins enable --offline rabbitmq_shovel && \
    rabbitmq-plugins enable --offline rabbitmq_shovel_management && \
    rabbitmq-plugins enable --offline rabbitmq_stomp && \
    rabbitmq-plugins enable --offline rabbitmq_web_stomp

ADD init.sh /init.sh

EXPOSE 1883 5671 5672 15671 15672 15674 15675 25672 61613

CMD ["/init.sh"]