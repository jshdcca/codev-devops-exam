# how to use:

## this ansible playbook is assumming that:
1. you have setup ssh logins to the hosts in the host file
2. is assumming that the servers listed in the host file are running debian based systems, if not apt commands will not work.

## I included a Dockerfile that will:
1. install openssh, curl and ansible binaries
2. setup passwordless ssh login to itself
3. to build the image run
```
docker build -t ubuntu-ansible .
```
4. to run the image
```
docker run -it -v .:/opt -p 80:80 ubuntu-ansible
```
5. to run the playbook
    a. cd into /opt
    b. run
    ```
    ansible-playbook -i hosts setup-nginx.yml
    ```