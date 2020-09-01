FROM alpine
WORKDIR /zsign
COPY . src/

RUN apk add --no-cache --virtual .build-deps g++ openssl-dev && \
	apk add --no-cache libgcc libstdc++ zip unzip bash && \
	g++ src/*.cpp src/common/*.cpp -lcrypto -O3 -o zsign && \
	apk del .build-deps && \
        mv /zsign/zsign /usr/bin && \
	rm -rf src
	
