FROM gcr.io/robust-multicenter-fl/base

WORKDIR /root
RUN git clone https://github.com/TalwalkarLab/leaf
COPY ./preprocess.bash ./
RUN chmod +x ./preprocess.bash
RUN ./preprocess.bash
COPY ./training.bash /root
COPY ./training_alter.bash /root
COPY ./training_poison.bash /root
RUN chmod +x ./training.bash
RUN chmod +x ./training_alter.bash
RUN chmod +x ./training_poison.bash
