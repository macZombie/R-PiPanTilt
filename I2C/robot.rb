#robot.rb


class Robot
	
	
	@name
	@left
	@right
	
	def initialize(name,lChan,lDir,rChan,rDir)
		
		@name = name
		@left = Motor.new("left",lChan,lDir)
		@right = Motor.new("right",rChan,rDir)
		
		@left.stop
		@right.stop
		
	
		return
		
	end
	
	def forward
		@left.forward
		@right.forward
		return
	end
	
	def back
		@left.back
		@right.back
		return
	end
	
	def stop
		@left.stop
		@right.stop
		return
	end
	
	
	def left
		@left.back
		@right.forward
		return
	end
	
	
	def right
		@left.forward
		@right.back
		return
	end
	
	




end
