# OpenCV + Tensorflow

A [Docker](http://docker.com) file to build images for AMD & ARM devices over a base image based with a minimal installation of [Tensorflow](https://www.tensorflow.org/) an open source software library for numerical computation using data flow graphs.
Over this base will be installed [OpenCV](https://opencv.org/) a library of programming functions mainly aimed at real-time computer vision.

> Be aware! You should read carefully the usage documentation of every tool!

## Details

- [GitHub](https://github.com/DeftWork/tf-opencv)
- [Deft.Work my personal blog](http://deft.work/tensorflow_for_raspberry)


| Docker Hub | Docker Pulls | Docker Stars | Docker Build | Size/Layers |
| --- | --- | --- | --- | --- |
| [tf-opencv](https://hub.docker.com/r/elswork/tf-opencv "elswork/tf-opencv on Docker Hub") | [![](https://img.shields.io/docker/pulls/elswork/tf-opencv.svg)](https://hub.docker.com/r/elswork/tf-opencv "tf-opencv on Docker Hub") | [![](https://img.shields.io/docker/stars/elswork/tf-opencv.svg)](https://hub.docker.com/r/elswork/tf-opencv "tf-opencv on Docker Hub") | [![](https://img.shields.io/docker/build/elswork/tf-opencv.svg)](https://hub.docker.com/r/elswork/tf-opencv "tf-opencv on Docker Hub") | [![](https://images.microbadger.com/badges/image/elswork/tf-opencv.svg)](https://microbadger.com/images/elswork/tf-opencv "tf-opencv on microbadger.com") |

## Build Instructions

Build for amd64 or arm32v7 architecture (thanks to its [Multi-Arch](https://blog.docker.com/2017/11/multi-arch-all-the-things/) base image)

```sh
docker build -t elswork/tf-opencv:latest .
```

## My Real Usage Example

In order everyone could take full advantages of the usage of this docker container, I'll describe my own real usage setup.

```sh
docker run -it elswork/tf-opencv:latest
```