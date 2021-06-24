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







