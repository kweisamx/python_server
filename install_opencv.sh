#!/bin/bash
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
sudo apt-get install ffmpeg libavresample-dev libavutil-dev libavcodec-dev libavformat-dev libswscale-dev

cd opencv
mkdir build

cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_OPENGL=ON -D WITH_FFMPEG=ON -D WITH_V4L=ON -D WITH_LIBV4L=ON WITH_GSTREAMER=ON -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ ..
make -j8
sudo make install

