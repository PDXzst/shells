#! /bin/bash  
# this declares that current user is a sudoer
sudo tee /etc/sudoers.d/$USER <<END
END

if ls -l /dev/ttyCH343USB0 ; then
	sudo chmod 777 /dev/ttyCH343USB0;
else
	echo "sudo chmod /dev/ttyCH343USB0 fail";
	exit 1
fi

if ls -l /dev/ttyUSB0 ;then
	sudo chmod 777 /dev/ttyUSB0;
else
	echo "sudo chmod /dev/ttyUSB0 fail";
	exit 1;
fi

cd /home/robot/ros_ws/catkin_ws;
sleep 1s
# add $SHELL to keep the terminal
gnome-terminal --tab --title="ros_1" -- bash -c "roslaunch imu_single_uwb imu_single_uwb_start.launch;"

sleep 1s
gnome-terminal --tab --title="ros_bag" -- bash -c "rosbag record --duration=4 -O /home/robot/ros_ws/dataset/imu_bag"$1".bag -a;"

sleep 5s
gnome-terminal --tab --title="ros_bag"  -- bash -c "cd /home/robot/ros_ws/dataset;rostopic echo -b imu_bag"$1".bag -p /imu_odometry > ./imu_odom/imu_odom_bag"$1".txt;rostopic echo -b imu_bag"$1".bag -p /handsfree/imu > ./imu_data/imu_data_bag"$1".txt;rostopic echo -b imu_bag"$1".bag -p /nlink_linktrack_nodeframe2 > ./uwb_data/uwb_data_bag"$1".txt;rm /home/robot/ros_ws/dataset/imu_bag"$1".bag"






