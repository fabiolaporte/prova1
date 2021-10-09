FROM debian

RUN apt-get update && \
    apt-get install -y wget

RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz
RUN tar xzf hadoop-3.3.1.tar.gz
RUN apt-get install -y default-jre
ENV JAVA_HOME=/usr/lib/jvm/default-java
WORKDIR /hadoop-3.3.1
RUN mkdir input
RUN cp etc/hadoop/*.xml input
RUN mkdir teste
CMD bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.1.jar grep input output 'dfs[a-z.]+'

#CMD /bin/bash


