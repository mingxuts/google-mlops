FROM gcr.io/robust-multicenter-fl/train_syn_op

WORKDIR /root
COPY ./benchmark_s.bash /root
COPY ./benchmark_r.bash /root
RUN chmod +x ./benchmark_s.bash
RUN chmod +x ./benchmark_r.bash
