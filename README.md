# install_ROS_Melodic
Installing ROS Melodic on Ubuntu 18.04

This file will install ROS Meodic Morenia on Ubuntu 18.04 and catkin_tools

## installROSMelodic.sh

    git clone https://github.com/Interactics/install_ROS_Melodic.git
    cd install_ROS_Melodic
    chmod +x installROSMelodic.sh
    sudo bash ./installROSMelodic.sh
    
 ## How to not use <Catkin_tools>
 
If you don't want to use catkin_tools,

    cd ~/catkin_ws
    catkin clean
    catkin_make
   
then, you can type 'catkin_make' instead of 'catkin build'
