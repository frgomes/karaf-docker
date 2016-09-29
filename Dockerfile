FROM java:8-jdk
MAINTAINER skliche
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ENV KARAF_VERSION=4.0.7
ENV KARAF_INSTALL_DIR=/opt/karaf

RUN wget http://ftp.fau.de/apache/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir ${KARAF_INSTALL_DIR}; \
    tar --strip-components=1 -C ${KARAF_INSTALL_DIR} -xzf apache-karaf-${KARAF_VERSION}.tar.gz; \
    rm apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir /deploy; \
    sed -i 's/^\(felix\.fileinstall\.dir\s*=\s*\).*$/\1\/deploy/' ${KARAF_INSTALL_DIR}/etc/org.apache.felix.fileinstall-deploy.cfg; \   
    sed -i 's/featuresBoot =/featuresBoot = war,/g' ${KARAF_INSTALL_DIR}/etc/org.apache.karaf.features.cfg

VOLUME ["/deploy"]
EXPOSE 1099 8101 8181 44444
ENTRYPOINT ["/opt/karaf/bin/karaf"]
