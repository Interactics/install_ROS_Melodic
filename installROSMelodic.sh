#!/bin/bash
# Install ROS Melodic On Ubuntu 18.04
# Created by Interactics
echo ""
echo ""
echo "---------------------------------------------------------"
echo "-[INSTALLATION ROS Melodic FOR Ubuntu 18.04 (Bionic)    -"
echo "-Catkin workspace -> ~/catkin_ws                        -"
echo "-Install - ROS Melodic                                  -"
echo "-CONTINUE -> PRESS [ENTER], CANCLE -> PRESS [CTRL]+[C]  -"
echo "---------------------------------------------------------"
read

ROS_VER=${ROS_VER:="melodic"}
NAME_CATKIN_WS=${NAME_CATKIN_WS:="catkin_ws"}

#Add Repository
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt-add-repository restricted

#Setup source.list and keys
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
#Setup keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654


#Installation
echo "Updating apt"
sudo apt update -y

echo "Install ros-melodic-desktop-full"
sudo apt install -y ros-melodic-desktop-full

#initilaize rosdep and update
sudo sh -c "rosdep init"
sudo apt-get install python-rosdep -y
rosdep update

grep -q -F 'source /opt/ros/melodic/setup.bash' ~/.bashrc || echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

#Env Setting"
echo "Environment setup"
source $HOME/.bashrc


#Install Dep for catkin-tools
echo "Install Catkin tools dependencies"
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential 


#Create catkin_ws 
echo "Create Catkin_ws Dir"
mkdir -p $HOME/$NAME_CATKIN_WS/src
cd $HOME/$NAME_CATKIN_WS/src
catkin_init_workspace
cd $HOME/$NAME_CATKIN_WS
catkin_make


#Set Source
grep -q -F 'source ~/catkin_ws/devel/setup.bash' ~/.bashrc || echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc


#Set ROS Network
sh -c "echo \"export ROS_HOSTNAME=localhost" >> ~/.bashrc
sh -c "echo \"export ROS_MASTER_URI=http://localhost:11311\" >> ~/.bashrc"

#Set Aalias command
sh -c "echo \"alias eb='vi ~/.bashrc'\" >> ~/.bashrc"
sh -c "echo \"alias sb='source ~/.bashrc'\" >> ~/.bashrc"
sh -c "echo \"alias cw='cd ~/$NAME_CATKIN_WS'\" >> ~/.bashrc"
sh -c "echo \"alias cs='cd ~/$NAME_CATKIN_WS/src'\" >> ~/.bashrc"
sh -c "echo \"alias cm='cd ~/$NAME_CATKIN_WS && catkin_make'\" >> ~/.bashrc"
echo "Bashrc setting"
echo "  eb : vi $HOME/.bashrc"
echo "  sb : source $HOME/.bashrc"
echo "  cw : cd $HOME/Catkin_ws"
echo "  cs : Entering $HOME/Catkin_ws/src"
echo "  cm : run [catkin_make] at $HOME/catkin_ws"

source $HOME/.bashrc

echo "Done! Happy ROS!"
exit 0
