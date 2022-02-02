FROM gcr.io/robust-multicenter-fl/base

COPY ./data_fem.bash /root
RUN ["chmod", "+x", "/root/data_fem.bash"]
CMD ["/root/data_femnist.bash"]
