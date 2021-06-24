# memory.rb


	

class Memory
	
	@name
	@channel
	@controlAddress
	@sramAddress
	
	def initialize(name,channel,controlAddress,sramAddress)
		
		@name = name
		@channel = channel
		@controlAddress = controlAddress
		@sramAddress = sramAddress
		
		
		
		
		return
	end
	

	def debug
		
		print "\nMemory named ",@name
		print "\nchannel = ",@channel
		print "\ncontrolAddress = ",@controlAddress
		print "\nsramAddress = ",@sramAddress
		
		print "\n\n"
		
		return
	end
	

	def read(addr)
                
                commandString = ""
                commandString << "i2cget -y "
                commandString << getChannel.to_s
                commandString << " "
                commandString << getAddress.to_s
                commandString << " " 
                commandString << addr.to_s
		commandString << " >  memory_result.txt"
                

                #print "\n>>>--->",commandString,"<---<<<"
                
                system(commandString)
		
		myFile = File.open("memory_result.txt","r")
		data = myFile.gets
		myFile.close
		
		value = Integer(data)

        
                return value
        end
        
        
        def write(addr,data)
                
                commandString = ""
                commandString << "i2cset -y "
                commandString << getChannel.to_s
                commandString << " "
                commandString << getAddress.to_s
                commandString << " " 
                commandString << addr.to_s
                commandString << " " 
                commandString << data.to_s                
                
                # print "\n>>>--->",commandString,"<---<<<"
                
                system(commandString)
        
                return
        end
        




end
