#motor.rb

class Motor < Servo
	
	@direction
	
	def initialize(value,servoChan,dir)
		
		super(value,servoChan)
		
		@direction = dir
		
		
		return
		
	end
	

	def set(value)
		
		rotate(@servoChannel,value)
		
		return
		
	end
	
	
	def forward
		
		if ( @direction == 0 )
			
			set(1)
			
		else
			
			set(511)
			
		end
		
		return
		
	end
	
	
	def back
		
		if ( @direction == 0 )
			
			set(511)
			
		else
			
			set(1)
			
		end
		
		return
		
	end
	
		
	def stop
		
		set(0)
		
		return
		
	end
	
	



end
