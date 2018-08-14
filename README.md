# OpenCV + Tensorflow

A [Docker](http://docker.com) image for AMD & ARM devices with [Tensorflow](https://www.tensorflow.org/) an open source software library for numerical computation using data flow graphs that will let you play and learn distinct Machine Learning techniques. [OpenCV](https://opencv.org/)is a library of programming functions mainly aimed at real-time computer vision.

> Be aware! You should read carefully the usage documentation of every tool!

## Details

- [GitHub](https://github.com/DeftWork/tf-opencv)
- [Docker Hub](https://hub.docker.com/r/elswork/tf-opencv)
- [Deft.Work my personal blog](http://deft.work/tensorflow_for_raspberry)

## Build Instructions

Build

```sh
docker build -t elswork/tf-opencv:latest .
```

## My Real Usage Example

In order everyone could take full advantages of the usage of this docker container, I'll describe my own real usage setup.

Run for amd64 or arm32v7 architecture (thanks to [Multi-Arch](https://blog.docker.com/2017/11/multi-arch-all-the-things/))

```sh
docker run -it elswork/tf-opencv:latest
```