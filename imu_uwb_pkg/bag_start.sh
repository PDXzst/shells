#! /bin/bash  
cd /home/robot/ros_ws/catkin_ws
sleep 1s
gnome-terminal --tab --title="ros_mag_bag_play" -- bash -c "roslaunch imu_single_uwb imu_single_uwb_bag.launch;"

sleep 1s
gnome-terminal --tab --title="ros_bag" -- bash -c "rosbag record --duration=4 -O /home/robot/ros_ws/dataset/imu_bag"$1".bag -a;"

sleep 5s
gnome-terminal --tab --title="ros_bag"  -- bash -c "cd /home/robot/ros_ws/dataset;rostopic echo -b imu_bag"$1".bag -p /imu_odometry > ./imu_odom/imu_odom_bag"$1".txt;rostopic echo -b imu_bag"$1".bag -p /handsfree/imu > ./imu_data/imu_data_bag"$1".txt;rostopic echo -b imu_bag"$1".bag -p /nlink_linktrack_nodeframe2 > ./uwb_data/uwb_data_bag"$1".txt;rm /home/robot/ros_ws/dataset/imu_bag"$1".bag"
