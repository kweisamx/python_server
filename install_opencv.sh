#!/bin/bash
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
sudo apt-get install ffmpeg libavresample-dev libavutil-dev libavcodec-dev libavformat-dev libswscale-dev libgtk2.0-dev -y
sudo apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools libgstreamer-plugins-base1.0-dev  python2.7 python3.5 python2.7-dev python3.5-dev

cd opencv
mkdir build

cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_OPENGL=ON -D WITH_V4L=ON -D WITH_LIBV4L=ON -D WITH_GSTREAMER=ON -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ -D INSTALL_PYTHON_EXAMPLE=ON -D PYTHON_EXECUTABLE=/usr/bin/python -D BUILD_PYTHON_SUPPORT=ON ..
make -j4
sudo make install
sudo ldconfig
