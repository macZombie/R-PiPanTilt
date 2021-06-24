#!/usr/bin/ruby

# runme.rb

require './i2cDriver.rb'
require './gpio.rb'
require './pwm.rb'
require './servo.rb'
require './servoList.rb'
require './motor.rb'
require './robot.rb'
require './memory.rb'


robot = Robot.new("robot",3,0,4,1)


memory = Memory.new("memory",1,24,80)


memory.debug


if false
	
	robot.forward
	sleep(0.5)
	robot.stop
	sleep(0.5)
	robot.back
	sleep(0.5)
	robot.stop
	sleep(2.0)
	robot.left
	sleep(0.5)
	robot.stop
	sleep(0.5)
	robot.right
	sleep(0.5)
	
	
	robot.stop
	sleep(1.0)
	
	4.times do
	
		robot.left
		sleep(0.2)
		robot.stop
		sleep(0.2)
		robot.right
		sleep(0.2)
		
	end
	
	robot.stop
	
end	





