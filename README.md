# Docker file for Robot framework container
*************************************************************************
***AUTHOR NAME*** - Jitender kumar
***AUTHOR EMAIL*** - jitender.telecom123@gmail.com
*************************************************************************
1. ***Remove below lines*** from Dockerfile if you are not behind proxy

- ENV http_proxy http://192.168.1.1:8080/
- ENV https_proxy http://192.168.1.1:8080/
- RUN pip --proxy=http://192.168.1.1:8080 install robotframework 
- RUN pip --proxy=http://192.168.1.1:8080 install robotframework-sshlibrary
- RUN pip --proxy=http://192.168.1.1:8080 install selenium
- RUN pip --proxy=http://192.168.1.1:8080 install robotframework-HttpLibrary
- RUN pip --proxy=http://192.168.1.1:8080 install robotframework-jsonlibrary
- RUN pip --proxy=http://192.168.1.1:8080 install robotframework-requests
- RUN pip --proxy=http://192.168.1.1:8080 install jsonpath_rw
- RUN pip --proxy=http://192.168.1.1:8080 install jsonpath_rw_ext

2. If you are behind proxy, then ***replace 192.168.1.1 IP and port 8080 with your actual proxy IP and port***

3. After modification, copy Dockerfile in any directory and build the image using command "***docker build -t robotframework .***"

4. Run docker using command "***docker run -d -p 8022:22 --name robot --restart always robotframework /usr/sbin/sshd -D***"

5. Login inside container using command "***docker exec -it robot***" and run below commands to start sshd service
- ***ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key***
- ***/usr/sbin/sshd -D***

6. Now container is ready for use