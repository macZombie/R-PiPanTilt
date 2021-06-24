#!/usr/bin/ruby

# in their hierarchical order of inheritance
require './pwm.rb'		# PCA9685 with base address hard-coded
require './servo.rb'
require './servoList.rb'

require 'raspi-gpio'

BEGIN { print  "\nStart of " + $PROGRAM_NAME  + "\n"  }


		
	neck = Servo.new("neck",0)
	head= Servo.new("head",1)
	
	everything = ServoList.new("everything")
	everything.append(neck)
	everything.append(head)
	
	
	everything.park
	sleep(1)
	
	head.tell
	head.goto(500)
	head.tell
	head.goto(300)
	head.tell
	head.goto(400)
	head.tell
	
	neck.tell
	neck.goto(450)
	neck.tell

	neck.goto(100)
	neck.tell
	
	neck.goto(350)
	neck.tell
	
	if ( false )
		neck.min
		sleep(1)
		neck.max
		sleep(1)
		neck.park
	end
	
	

	

	
		




		
END { print  "\nEnd of " + $PROGRAM_NAME  + "\n"  }
		
		
	
	
	
	
	
	
	
	