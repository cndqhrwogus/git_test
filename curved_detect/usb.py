#!/usr/bin/env python3

import serial
import rospy
from geometry_msgs.msg import PoseWithCovarianceStamped
from std_msgs.msg import String

class number():
    one: int = 0
    two: int = 0

class usb:
    def main(self):
        num = number()
        pose_pub = rospy.Publisher('/usb_cdc',PoseWithCovarianceStamped,queue_size=30)
        emergency = rospy.Publisher('/emergency',String,queue_size=1)
        start = rospy.Publisher('/start',String,queue_size=1)
        rospy.init_node('usb_cdc')
        Sub = rospy.Subscriber('/amcl_pose',PoseWithCovarianceStamped,self.position)
        self.first = PoseWithCovarianceStamped()
        second = PoseWithCovarianceStamped()
        first = PoseWithCovarianceStamped()
        error = 'stop'
        global a
        a = PoseWithCovarianceStamped()
        stop = 'not'
        self.ser = serial.Serial('/dev/ttyACM0',115200,timeout = 1)
        self.ser.flush()
            
        while not rospy.is_shutdown():
            if self.ser.in_waiting>0:
                self.line = self.ser.read().decode('utf-8').rstrip()
                # print(self.line)
                if(self.line == 'p'):
                    error = 'stop'
                    emergency.publish(error)
                elif(self.line == 'y'):
                    error = 'safy'
                    emergency.publish(error)
                elif (self.line == '1'):
                    if num.one == 0:
                        first.pose.pose.position.x = a.pose.pose.position.x
                        first.pose.pose.position.y = a.pose.pose.position.y
                        num.one = 1
                    elif num.one == 1:
                        stop = 'go'
                        start.publish(stop)
                        pose_pub.publish(first)
                
                elif (self.line == '2'):
                    if(num.two == 0):
                        second.pose.pose.position.x = a.pose.pose.position.x
                        second.pose.pose.position.y = a.pose.pose.position.y
                        num.two = 1
                    elif(num.two ==1):
                        stop = 'go'
                        start.publish(stop)
                        pose_pub.publish(second)
                elif(self.line == '0'):
                    stop = 'not'
                    start.publish(stop)
                    

    def position(self,msg):
        a.pose.pose.position.x = msg.pose.pose.position.x
        a.pose.pose.position.y = msg.pose.pose.position.y
        
        
if __name__ == '__main__':
    node = usb()
    node.main()
