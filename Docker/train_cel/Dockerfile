FROM gcr.io/robust-multicenter-fl/data_op

WORKDIR /root
COPY ./training.bash /root
COPY ./training_poison.bash /root
RUN chmod +x ./training.bash
RUN chmod +x ./training_poison.bash
