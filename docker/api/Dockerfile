FROM ubuntu:20.04

RUN apt-get update && apt-get -y upgrade && \
     apt-get install  wget -y

RUN useradd -m -s /bin/bash api_user

USER api_user

SHELL [ "/bin/bash", "-c"]
RUN  wget -P /home/api_user/ https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
     bash /home/api_user/Miniconda3-latest-Linux-x86_64.sh -b -p /home/api_user/miniconda && \
     rm /home/api_user/Miniconda3-latest-Linux-x86_64.sh && \
     echo "export PATH=/home/api_user/miniconda/bin:$PATH" >> ~/.bashrc && \
     . ~/.bashrc && \
     /home/api_user/miniconda/bin/conda init
