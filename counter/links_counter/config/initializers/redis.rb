REDIS = Redis.new(host: 'localhost', port: 6379, db: 1, password: 'georgiman')

# Class definition needed for our metrics statistics
class Observability
    def initialize
      @count = 0
    end
  
    def incr
      @count += 1
    end
  
    def print
      @count
    end 
end

# Defining 3 global variables needed for the statistics
$incr_stat = Observability.new
$decr_stat  = Observability.new
$reset_stat = Observability.new
