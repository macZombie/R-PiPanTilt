#!/usr/bin/ruby

# driver.rb : I2C Driver



class I2CExpander
        
        @name
        @channel
        @address

                
        def setName(value)       ; @name = value    ; return ; end
        def setChannel(value)    ; @channel = value ; return ; end
        def setAddress(value)    ; @address = value ; return ; end
        
        def getName       ; value =  @name    ; return(value) ; end
        def getChannel    ; value =  @channel ; return(value) ; end
        def getAddress    ; value =  @address ; return(value) ; end
        
        
        def initialize(expName,chan,addr)

                
                setName(expName)
                setChannel(chan)
                setAddress(addr)
                
                return
                
        end
   
   
        def getInfo
                
                outputString = ""
                outputString << "\nI2CExpander named " << getName
                outputString << " channel = " << getChannel.to_s
                outputString << " address = " << getAddress.to_s

                return outputString
                
        end
        
        
        def read(addr)
                
		
		
		
		
                commandString = ""
                commandString << "i2cget -y "
                commandString << getChannel.to_s
                commandString << " "
                commandString << getAddress.to_s
                commandString << " " 
                commandString << addr.to_s
		commandString << " >  result.txt"
                

                #print "\n>>>--->",commandString,"<---<<<"
                
                system(commandString)
		
		myFile = File.open("result.txt","r")
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
        

        

end ; # of class I2CExpander


class GPIO < I2CExpander
        
        def initialize(name,channel,address)
                
                super(name,channel,address)
                
                
                return
        end
               
        
end ; # end of class GPIO


class GPIOA < GPIO
        
        IODIR       = 0  
        IPOL        = 2
        GPINTEN     = 4 
        DEFVAL      = 6
        INTCON      = 8 
        IOCON       = 10 
        GPPU        = 12
        INTF        = 14
        INTCAP      = 16
        GPIO        = 18
        OLAT        = 20
        
        def initialize(name,channel,address)
                super(name,channel,address)
                return
        end
        
        def enable
                write(IODIR,0)
                return
        end
        
        def disable
                write(IODIR,255)
                return
        end

        def set(value)
                write(GPIO,value)
                return
        end

        def get
                result = read(GPIO)
                return result
        end

        def pullupsOn
                write(GPPU,255)
                return
        end
        
        def pullupsOff
                write(GPPU,0)
                return
        end

end ; # of class GPIOA


class GPIOB < GPIO
        
        IODIR       = 1  
        IPOL        = 3
        GPINTEN     = 5 
        DEFVAL      = 7
        INTCON      = 9 
        IOCON       = 11 
        GPPU        = 13
        INTF        = 15
        INTCAP      = 17
        GPIO        = 19
        OLAT        = 21
        
        def initialize(name,channel,address)
                super(name,channel,address)
                return
        end
        
        def enable
                write(IODIR,0)
                return
        end
        
        def disable
                write(IODIR,255)
                return
        end

        def set(value)
                write(GPIO,value)
                return
        end

        def get
                result = read(GPIO)
                return result
        end

        def pullupsOn
                write(GPPU,255)
                return
        end
        
        def pullupsOff
                write(GPPU,0)
                return
        end

end ; # of class GPIOB




###########################################################################

gpioa = GPIOA.new("gpioa",1,32)
gpiob = GPIOB.new("gpiob",1,32)



if false 

	gpioa.enable
	
	gpiob.enable
	
	
	gpioa.set(0)
	sleep(0.5)
	gpioa.set(85)
	sleep(0.5)
	gpioa.set(170)
	sleep(0.5)
	gpioa.set(255)
	sleep(0.5)
	gpioa.set(0)
	sleep(0.5)
	gpioa.set(255)
	sleep(0.5)
	gpioa.set(0)
	sleep(0.5)
	gpioa.set(255)
	sleep(0.5)
	gpioa.set(0)
	sleep(0.5)
	gpioa.set(255)
	sleep(0.5)
	
end



while false
	gpiob.set(85)
	sleep(0.2)
	gpiob.set(170)
	sleep(0.2)
	
end


gpioa.enable
gpiob.disable
gpiob.pullupsOn


while true
	
	portb = gpiob.get
	
	gpioa.set(portb)
	
	print "\nportb = ",portb
	
end




