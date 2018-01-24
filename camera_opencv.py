import cv2
from base_camera import BaseCamera


class Camera(BaseCamera):
    #video_source = "http://192.168.31.246:8080/"
    #video_source = 0
    video_source = "udpsrc port= 5000 ! tsparse ! tsdemux ! h264parse ! avdec_h264 ! videoconvert ! appsink sync=false"
    #video_source = "udp://@localhost:5000"
    @staticmethod
    def set_video_source(source):
        Camera.video_source = source

    @staticmethod
    def frames():
        print(cv2.getBuildInformation())
        camera = cv2.VideoCapture(Camera.video_source)
        if not camera.isOpened():
            raise RuntimeError('Could not start camera.')

        while True:
            # read current frame
            _, img = camera.read()

            # encode as a jpeg image and return it
            yield cv2.imencode('.jpg', img)[1].tobytes()
