#!/usr/bin/env bash
docker exec -it qoi bash

# Now you can run:
# source /root/catkin_ws/devel/setup.bash && roslaunch video_stream_opencv video_file.launch
# source /root/catkin_ws/devel/setup.bash && rosrun rqt_reconfigure rqt_reconfigure
# source /root/catkin_ws/devel/setup.bash && rosrun rqt_image_view rqt_image_view