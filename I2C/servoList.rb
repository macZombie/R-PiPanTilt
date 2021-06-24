class ServoList < Servo
        
        @name = ""
        @thisList = Array.[]

    

        def initialize(thisName)
        
                @name = thisName
                @thisList = [ ""  ]
        
                return
        
        end
        
        

        def getName
        
                thisName = @name
                return(thisName)
    
        end
    
    
        def append(newItem)
        
                if ( @thisList.include?(newItem) )
                        print "\nWARNING: ",newItem, " is already included in the list named ",@name
                else
                        @thisList.push(newItem)
                end
    
                return
    
        end
    
    
    
        def get
        
                return @thisList
        
        end
    
    
  
    
    
        def getSize
        
                listSize = @thisList.size
        
                return listSize
        
        end




    
        

	def park
        
		get.each { |item| 
            
			thisClass = item.class.to_s ; 
            
			if ( thisClass.eql?("Servo") )
				item.park
			end
        
		}
            
		return 
	end



	def sweep
        
		get.each { |item| 
            
			thisClass = item.class.to_s ; 
            
			if ( thisClass.eql?("Servo") )
				item.sweep
			end
        
		}
            
		return 
    end


	def set(value)
        
		get.each { |item| 
            
			thisClass = item.class.to_s ; 
            
			if ( thisClass.eql?("Servo") )
				item.set(value)
			end
        
		}
            
		return 
	end


	def min
        
		get.each { |item| 
		
			thisClass = item.class.to_s ; 
            
			if ( thisClass.eql?("Servo") )
				item.min
			end
        
		}
            
		return 
		end


	def max
        
		get.each { |item| 
            
			thisClass = item.class.to_s ; 
		
			if ( thisClass.eql?("Servo") )
				item.max
			end
        
		}
            
		return 
	end


	






	def goto(position)
        
		get.each { |item| 
            
			thisClass = item.class.to_s ; 
            
			if ( thisClass.eql?("Servo") )
				item.goto(position)
			end
        
		}
            
		return 
	end
end ; # of class ServoList