class Servo < PWM
    
    BASE_ADDR = 64
    I2C_CHANNEL = 1
    MAX 	    = 560
    MIN		   = 75
    
    @servoChannel
    @setting
    
    def initialize(servoName,servoChan)
        
        super(servoName,I2C_CHANNEL,BASE_ADDR)
        
        @servoChannel = servoChan
        
        midPoint = MAX - MIN
        
        #set(midPoint)
        
        @setting = 0
        
        return
    end
    
    
    def getMax
        value = MAX
        return value
    end
    
    def getMin
        value = MIN
        return value
    end
    
    def getMid
        value =  (  ( MAX - MIN ) / 2  ) + MIN 
        return value
    end
    
    
    def set(value)
        
        if ( value > MAX )
            value = MAX
        end
        
        if ( value < MIN )
            value = MIN
        end
        
        @setting = value
        
        rotate(@servoChannel,value)
        
        return
        
    end
    
    
    def get
        
        value = @setting
        
        return value
        
    end
    
    
    def unsafeSet(value)

        rotate(@servoChannel,value)
        
        return
        
    end
    
    
    
    
    def sweep
        
        set(MAX)
        sleep(0.25)
        set(MIN)
        sleep(0.25)
        
        
        return
    end
    
    
    def park
    
        midPoint = (  ( MAX - MIN ) / 2  ) + MIN 
        
        set(midPoint)
        
        return
        
    end
    
    
    def min
        set(MIN)
        return
    end
    
    def max
        set(MAX)
        return
    end
    
    

    
    # Experimental method using sinusoidal ramp ( slow )
    
    def goto(target)
        
        #   print "\nsetting = ",@setting
        #   print "\ntarget = ",target
        delta = target - @setting
        #   print "\ndelta = ",delta
        
        if ( delta < 0 )
            direction = false
            myStep = -1
        else
            direction = true
            myStep = 1
        end
        
        # print "\ndirection = ",direction
        # print "\nmyStep = ",myStep
        
        position = @setting
        
        
        angle = Math::PI / delta.abs.to_f
        
    
        # print "\nangle = ",angle
        
        
        rads = 0.0
        
        begin

            position = position + myStep
            
            rads = rads + angle
            
            delay = Math.sin(rads)
            
            #print "\n",position," rads = ",rads," delay = ",delay
            
            set(position)
            
            sleep(  ( 1.0 - delay ) / 100.0 )
            
            
            
        end while ( position != target )
            
            

        
        
        return
    end
    
    


    def tell
        
        print "\n",getName," = ",get
        
        
        return
    end
    

end
