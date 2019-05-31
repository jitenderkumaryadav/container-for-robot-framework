FROM centos:7
ENV http_proxy http://192.168.1.1:8080/
ENV https_proxy http://192.168.1.1:8080/
RUN yum update
RUN yum install epel-release -y
RUN yum install python -y
RUN yum install subversion -y
RUN yum install python-pip -y
RUN yum install openssh-server -y
RUN yum install openssh-clients -y
RUN yum install iproute -y
RUN yum install net-tools -y
RUN yum install tcpdump -y
RUN yum install iperf3 -y
RUN yum install wget -y
RUN yum install wireshark -y
RUN pip --proxy=http://192.168.1.1:8080 install robotframework 
RUN pip --proxy=http://192.168.1.1:8080 install robotframework-sshlibrary
RUN pip --proxy=http://192.168.1.1:8080 install selenium
RUN pip --proxy=http://192.168.1.1:8080 install robotframework-HttpLibrary
RUN pip --proxy=http://192.168.1.1:8080 install robotframework-jsonlibrary
RUN pip --proxy=http://192.168.1.1:8080 install robotframework-requests
RUN pip --proxy=http://192.168.1.1:8080 install jsonpath_rw
RUN pip --proxy=http://192.168.1.1:8080 install jsonpath_rw_ext
RUN echo 'root:test123' | chpasswd
RUN ssh-keygen -A
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]