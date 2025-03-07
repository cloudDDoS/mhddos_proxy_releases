FROM --platform=$TARGETPLATFORM debian:bullseye-slim as runtime
RUN apt-get update && apt-get install wget -y
ARG TARGETPLATFORM
WORKDIR mhddos_proxy
RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; \
    then FILENAME=mhddos_proxy_linux_arm64; \
    else FILENAME=mhddos_proxy_linux; fi \
  && wget -q https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases/releases/latest/download/$FILENAME -O mhddos_proxy_linux
RUN chmod +x mhddos_proxy_linux
ENTRYPOINT ["./mhddos_proxy_linux"]
