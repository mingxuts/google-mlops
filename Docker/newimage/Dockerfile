FROM gcr.io/deeplearning-platform-release/tf-cpu.1-15
RUN git clone https://github.com/mingxuts/multi-center-fed-learning
WORKDIR multi-center-fed-learning
RUN pip install --no-cache-dir pot
RUN pip install cmake
RUN pip install --no-cache-dir -r requirements.txt
