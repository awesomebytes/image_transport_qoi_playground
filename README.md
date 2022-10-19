# QOI for image_transport
Lossless image transport comparison.

Test video 560x320 px on Intel® Core™ i7-10875H CPU @ 2.30GHz × 16.

Using JPEG as baseline example.


| Compression Algorithm | Compression CPU % | Decompression CPU % | BW | HZ |
| --- | --- |--- | --- |--- |
| JPEG Quality 80 | 21 | 29-31 | 690KB/s | 30 |
| PNG Level 1 | 59-61 | 24  | 5.6MB/s | 30 |
| PNG Level 2 | 59-62 | 24  | 5.4MB/s | 30 |
| QOI qoixx | 27-30 | 32-35 | 6.1MB/s | 30 |
| QOI | 40-50 | 40-50 | 6.1MB/s | 30 |

# How to run
```bash
# Build the docker image
./build.sh
# Run ( needs `sudo apt-get install python3-rocker` from https://github.com/osrf/rocker#debians-recommended )
./run.sh
# and open other shells 
./exec.sh
# Now you can run:
# source /root/catkin_ws/devel/setup.bash && roslaunch video_stream_opencv video_file.launch
# source /root/catkin_ws/devel/setup.bash && rosrun rqt_reconfigure rqt_reconfigure
# source /root/catkin_ws/devel/setup.bash && rosrun rqt_image_view rqt_image_view
# And you can compare via 'top -c' the CPU usage
# the video_stream_opencv process is the 'driver' which compresses the images
# the rqt_image_view (choosing the /videofile/image_raw/compressed topics) will do the uncompression
# with rqt_reconfigure, by choosing video_file > image_raw > compressed, you can change format (and options of the formats)
# to observe the changes in CPU usage
```