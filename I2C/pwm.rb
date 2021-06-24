# pwm.rb



class PWM
	
	PCA9685_ADDRESS    = 0x40
	MODE1              = 0x00
	MODE2              = 0x01
	SUBADR1            = 0x02
	SUBADR2            = 0x03
	SUBADR3            = 0x04
	PRESCALE           = 0xFE
	LED0_ON_L          = 0x06
	LED0_ON_H          = 0x07
	LED0_OFF_L         = 0x08
	LED0_OFF_H         = 0x09
	ALL_LED_ON_L       = 0xFA
	ALL_LED_ON_H       = 0xFB
	ALL_LED_OFF_L      = 0xFC
	ALL_LED_OFF_H      = 0xFD

	# Bits:
	RESTART            = 0x80
	SLEEP              = 0x10
	ALLCALL            = 0x01
	INVRT              = 0x10
	OUTDRV             = 0x04
	

	FREQ           	   = 50
	
	
	@name
	@i2cChannel
	@baseAddress
	
	
	def initialize(pwmName,i2cChannel,baseAddress)

                setName(pwmName)
                setI2cChannel(i2cChannel)
                setBaseAddress(baseAddress)
		
		start
		setFrequency(FREQ)
                
                return
                
        end
	
	def setName(value)       ; @name = value    ; return ; end
        def setI2cChannel(value)    ; @i2cChannel = value ; return ; end
        def setBaseAddress(value)    ; @baseAddress = value ; return ; end
        
        def getName       ; value =  @name    ; return(value) ; end
        def getI2cChannel    ; value =  @i2cChannel ; return(value) ; end
        def getBaseAddress    ; value =  @baseAddress ; return(value) ; end
        
	
	
	def getInfo
                
                outputString = ""
                outputString << "\nServo Controller " << getName
                outputString << " I2C channel = " << getI2cChannel.to_s
                outputString << " Base address = " << getbaseAddress.to_s

                return outputString
                
        end
	
	
	def read(addr)
		
                commandString = ""
                commandString << "i2cget -y "
                commandString << getI2cChannel.to_s
                commandString << " "
                commandString << getBaseAddress.to_s
                commandString << " " 
                commandString << addr.to_s
		commandString << " >  pwmResult.txt"
                

		#print "\n>>>--->",commandString,"<---<<<"
                
                system(commandString)
		
		myFile = File.open("pwmResult.txt","r")
		data = myFile.gets
		myFile.close
		
		value = Integer(data)

        
                return value
        end
        
        
        def write(addr,data)
                
                commandString = ""
                commandString << "i2cset -y "
                commandString << getI2cChannel.to_s
                commandString << " "
                commandString << getBaseAddress.to_s
                commandString << " " 
                commandString << addr.to_s
                commandString << " " 
                commandString << data.to_s                
                
                # print "\n>>>--->",commandString,"<---<<<"
                
                system(commandString)
        
                return
        end
        
	
	






	def start
		
		write(MODE2,OUTDRV)
		write(MODE1,ALLCALL)
		sleep(0.005)
		
		modeOne = read(MODE1)
		modeOne = modeOne & ~SLEEP
		write(MODE1,modeOne)
		sleep(0.005)
		
		
		
		return
	end
	
	
	
	
	def setFrequency(freq)
		
		prescale = 25000000.00
		prescale = prescale / 4096.0
		prescale = prescale / Float(freq)
		prescale = prescale - 1.0
		prescale = ( prescale + 0.5 )    
		prescale = prescale.floor
		prescale = Integer(prescale)
		#print "\nprescale = ",prescale," ",prescale.class.to_s
		
		
		oldMode = read(MODE1)
		newMode = (oldMode &0x7F) | 0x10
		write(MODE1,newMode)
		write(PRESCALE,prescale)
		write(MODE1,oldMode)

		return
	end
	
	
	
	def setPwm(channel,on,off)
		
		write( ( LED0_ON_L + 4 * channel ) , on & 0xFF )
		write( ( LED0_ON_H + 4 * channel ) , on >> 8 )
		write( ( LED0_OFF_L + 4 * channel ) , off & 0xFF )
		write( ( LED0_OFF_H + 4 * channel ) ,off >> 8 )
		
		return
	end
	
	
		
	def setAllPwm(on,off)
		
		write( ( ALL_LED_ON_L  ) , on & 0xFF )
		write( ( ALL_LED_ON_H  ) , on >> 8 )
		write( ( ALL_LED_OFF_L  ) , off & 0xFF )
		write( ( ALL_LED_OFF_H  ) ,off >> 8 )
		
		return
	end
	
	
	
	
	def rotate(channel,value)
		
		setPwm(channel,0,value)
		
		return
	end
	
	
	
	
	
	
	

end






