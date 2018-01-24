#!/bin/bash
g++ capserver.cpp -o opencv_gst `pkg-config --cflags --libs opencv`
