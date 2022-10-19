FROM ros:noetic-perception

# Setup testing package and video
RUN apt-get update && apt-get install ros-noetic-video-stream-opencv -y
RUN cp /opt/ros/noetic/share/video_stream_opencv/test/small.mp4 /tmp/small.mp4

# Get the fork of image_transport with qoi support
RUN apt-get install git -y
WORKDIR /root
RUN mkdir -p catkin_ws/src &&\
    cd catkin_ws/src &&\
    git clone -b noetic-devel_add_qoi_compression_support-with-qoixx https://github.com/wx257osn2/ros-perception-image_transport_plugins
# git clone -b noetic-devel_add_qoi_compression_support https://github.com/awesomebytes/image_transport_plugins # slower
SHELL ["/bin/bash", "-c"]
RUN cd catkin_ws && source /opt/ros/noetic/setup.bash && catkin_make -DCMAKE_BUILD_TYPE=Release
RUN apt-get install ros-noetic-rqt-image-view ros-noetic-rqt-reconfigure -y


# Now you can run:
# source /root/catkin_ws/devel/setup.bash && roslaunch video_stream_opencv video_file.launch
# source /root/catkin_ws/devel/setup.bash && rosrun rqt_reconfigure rqt_reconfigure
# source /root/catkin_ws/devel/setup.bash && rosrun rqt_image_view rqt_image_view
# And you can compare via 'top -c' the CPU usage