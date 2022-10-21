#!/usr/bin/env python3
import cv2
import numpy as np
import rospy
import time
from matplotlib import pyplot as plt , cm, colors
from std_msgs.msg import String, Float32
from geometry_msgs.msg import Twist,TransformStamped,PoseWithCovarianceStamped

class motor:
    def usb_goal(self,msg):
        self.dst = PoseWithCovarianceStamped()
        self.dst.pose.pose.position.x = msg.pose.pose.position.x
        self.dst.pose.pose.position.y = msg.pose.pose.position.y
        self.goal = 'not'
    def opencv_callback(self,data):
        self.camera = data.data

    def current_src(self,msg):
        self.current_source = PoseWithCovarianceStamped()
        self.current_source.pose.pose.position.x = msg.pose.pose.position.x
        self.current_source.pose.pose.position.y = msg.pose.pose.position.y
        try:
            if ((self.dst.pose.pose.position.x - 0.1 <= self.current_source.pose.pose.position.x <= self.dst.pose.pose.position.x + 0.1) and (self.dst.pose.pose.position.y - 0.1 <= self.current_source.pose.pose.position.y <= self.dst.pose.pose.position.y + 0.1)):
                self.goal = 'goal'
        except AttributeError:
            None
    def usb_emergency(self,msg):
        self.tof_warning = msg.data
        print(self.tof_warning)
    def start_msg(self,msg):
        self.stop_msg = msg.data
    def run(self):
        rospy.init_node('motor_control')
        self.tof_warning = 'safy'
        self.camera = 'no line'
        global Pub
        self.goal = rospy.Subscriber('/usb_cdc',PoseWithCovarianceStamped,self.usb_goal)
        self.src = rospy.Subscriber('/amcl_pose',PoseWithCovarianceStamped,self.current_src)
        self.emergency = rospy.Subscriber('/emergency',String,self.usb_emergency)
        self.start = rospy.Subscriber('/start',String,self.start_msg)
        Pub = rospy.Publisher('/cmd_vel',Twist,queue_size=10)
        Sub = rospy.Subscriber('/lane_detect',String,self.opencv_callback)
        self.stop_msg = 'go'
        self.goal = 'not'
        global twist 
        global anglespeed 
        global forwardspeed 
        twist = Twist()
        while not rospy.is_shutdown():
            #블루투스 받아서 해당위치까지면 break
            try:
                if (self.stop_msg == 'not'):
                    while not self.stop_msg == 'go':
                        forwardspeed = 0.0
                        anglespeed = 0.0
                else:
                    if(self.goal == 'goal'):
                        forwardspeed = 0.0
                        anglespeed = 0.0
                    elif (self.tof_warning == 'stop'):
                        while not self.tof_warning == 'safy':
                            forwardspeed = 0.0
                            anglespeed = 0.0
                    elif(self.tof_warning == 'safy'):
                        if (self.camera == 'Straight'):
                            forwardspeed = 0.07
                            anglespeed = 0.0
                            
                        elif (self.camera == 'Right Curve'):
                            anglespeed = -0.5
                            forwardspeed = 0.05
                        elif (self.camera == 'Left Curve'):
                            forwardspeed = 0.05
                            anglespeed = 0.5
                        elif(self.camera == 'Left Slide'):
                            forwardspeed = 0.01
                            anglespeed = 0.3
                        elif(self.camera == 'Right Slide'):
                            forwardspeed = 0.01
                            anglespeed = -0.3
                        else:
                            forwardspeed = 0.0
                            anglespeed = 0.0
                twist.angular.z = anglespeed
                twist.linear.x = forwardspeed
                # print(twist)
                Pub.publish(twist)
                time.sleep(0.3)
                
            except AttributeError:
                # print('not')  
                None 
        rospy.spin()


if __name__ == '__main__':
    node = motor()
    node.run()

