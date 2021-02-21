FROM cm2network/steamcmd:root
# Install valheim server

ENV VALHEIM_PATH=/home/steam/valheim

RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir ${VALHEIM_PATH} +app_update 896660 validate +exit

RUN apt-get update 
RUN apt-get install -y  wget zip file libc6-dev

USER steam

ENV PLUS_VERSION=0.8
ENV PLUS_FILE=UnixServer.zip
ENV PLUS_URL=https://github.com/nxPublic/ValheimPlus/releases/download/${PLUS_VERSION}/${PLUS_FILE}

WORKDIR  /tmp
RUN wget -q ${PLUS_URL} 
RUN unzip -o ${PLUS_FILE} -d ${VALHEIM_PATH}

WORKDIR ${VALHEIM_PATH}

