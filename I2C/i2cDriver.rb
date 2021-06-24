#!/usr/bin/ruby

# i2Driver.rb : I2C Driver



class I2CExpander
        
        @name
        @i2cChannel
        @baseAddress

                
        def setName(value)       ; @name = value    ; return ; end
        def setI2cChannel(value) ; @i2cChannel = value ; return ; end
        def setBaseAddress(value)    ; @baseAddress = value ; return ; end
        
        def getName       ; value =  @name    ; return(value) ; end
        def getI2cChannel    ; value =  @i2cChannel ; return(value) ; end
        def getBaseAddress    ; value =  @baseAddress ; return(value) ; end
        
        
        def initialize(expanderName,interfaceChannel,baseAddr)

                
                setName(expanderName)
                setI2cChannel(interfaceChannel)
                setBaseAddress(baseAddr)
                
                return
                
        end
   
   
        def getInfo
                
                outputString = ""
                outputString << "\nI2CExpander named " << getName
                outputString << " I2C Interface Channel = " << getI2cChannel.to_s
                outputString << " Base address = " << getBaseAddress.to_s

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
        

        

end ; # of class I2CExpander


