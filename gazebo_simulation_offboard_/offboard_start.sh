#! /bin/bash
# a bash for starting the offboard mode which is used in the gazebo simulation
cd ~ 
gnome-terminal --tab --title="px4_start" -- bash -c "roslaunch px4 fast_test.launch;"
sleep 1s

if ls -l ~/QGroundControl.AppImage ; then
	 ./QGroundControl.AppImage
else
	echo "error open QGC";
	exit 1
fi

gnome-terminal --tab --title="offboard_node" -- bash -c "roslaunch offboard_pkg offboard_node_start.launch;"
sleep 1s
