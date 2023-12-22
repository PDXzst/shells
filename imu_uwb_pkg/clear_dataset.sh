#! /bin/bash  
# this declares that current user is a sudoer

echo "do you want to remove the datas? y/n ";
read choose;

if [ $choose == 'y' ];then
	cd /home/robot/ros_ws/dataset;
	rm ./uwb_data/uwb_data_bag*;
	rm ./imu_odom/imu_odom_bag*;
	rm ./imu_data/imu_data_bag*;
elif [ $choose == 'Y' ];then
	cd /home/robot/ros_ws/dataset;
	rm ./uwb_data/uwb_data_bag*;
	rm ./imu_odom/imu_odom_bag*;
	rm ./imu_data/imu_data_bag*;
else
	exit 0 ;
fi
