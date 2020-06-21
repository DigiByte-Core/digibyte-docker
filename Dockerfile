FROM ubuntu:focal
USER digibyte
WORKDIR /home/digibyte
ARG USERNAME=user
ARG PASSWORD=pass
ARG VERSION=7.17.2
ARG ARCH=x86_64
# Enable below for ARM CPU such as RPi etc or certain Synology NAS systems
#ARG ARCH=aarch64

ARG MAINP2P=12024
ARG MAINRPC=14022
ARG TESTP2P=12026
ARG TESTRPC=14023

# Set to 1 for running it in testnet mode
ARG TESTNET=0

# We need wget
RUN apt-get update && apt-get install -y wget

# Download the Core wallet from GitHub
RUN wget -c https://github.com/DigiByte-Core/DigiByte/releases/download/v${VERSION}/digibyte-${VERSION}-${ARCH}-linux-gnu.tar.gz -O - | tar xz
RUN mkdir -vp /home/digibyte/.digibyte
VOLUME /home/digibyte/.digibyte

# Allow Mainnet P2P comms
EXPOSE 12024

# Allow Mainnet RPC
EXPOSE 14022

# Allow Testnet RPC
EXPOSE 14023

# Allow Testnet P2P comms
EXPOSE 12026

RUN cat <<EOF > ~/.digibyte/digibyte.conf\n\
server=1\n\
maxconnections=300\n\
rpcallowip=127.0.0.1\n\
daemon=1\n\
rpcuser=user\n\
rpcpassword=pass\n\
txindex=1\n\
# Uncomment below if you need Dandelion disabled for any reason but it is left on by default intentionally\n\
#disabledandelion=1\n\
testnet=${TESTNET}\n\
EOF

CMD /home/digibyte/digibyte-${VERSION}/bin/digibyted
