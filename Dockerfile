ARG BASEIMAGE=elswork/tensorflow-diy:latest
FROM ${BASEIMAGE}

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL mantainer="Eloy Lopez <elswork@gmail.com>" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="tf-opencv" \
    org.label-schema.description="OpenCV + Tensorflow for amd64 and arm32v7" \
    org.label-schema.url="https://deft.work" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/DeftWork/tf-opencv" \
    org.label-schema.vendor="Deft Work" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

RUN apt update && apt install -y --no-install-recommends \
    libatlas3-base libwebp-dev libtiff5 libjasper1 libilmbase12 \ 
    libopenexr22 libilmbase12 libgstreamer1.0-0 libavcodec-dev \ 
    libavformat-dev libavutil-dev libswscale-dev libgtk-3-0 libpangocairo-1.0-0 \ 
    libpango-1.0-0 libatk1.0-0 libcairo-gobject2 libcairo2 libgdk-pixbuf2.0-0 libjpeg62 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 --no-cache-dir install webp opencv-python-headless==3.4.0.14