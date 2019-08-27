class CounterController < ApplicationController
  def menu 
  end

  def get
    begin
      @counter = REDIS
      @value_counter = @counter.get("1")
      @result = @value_counter.to_i
    rescue Errno::ECONNREFUSED, ::Redis::CannotConnectError
      @result = "Something went wrong! Check health of your counter using this link: "
    end
  end

  def incr
    begin
      @counter = REDIS
      @value_counter = @counter.incr("1")
      @result = @value_counter.to_i
      $incr_stat.incr
    rescue Errno::ECONNREFUSED, ::Redis::CannotConnectError
      @result= "Something went wrong! Check health of your counter using this link: "
    end
  end

  def decr
    begin
      @counter = REDIS
      @value_counter = @counter.get("1")
      case
      when @value_counter.to_i == 0
        @result = @value_counter.to_i
      when @value_counter.to_i > 0
        @result = @counter.decr("1").to_i
        $decr_stat.incr
      end
    rescue Errno::ECONNREFUSED, ::Redis::CannotConnectError
      @result = "Something went wrong! Check health of your counter using this link: "
    end
  end

  def reset
    begin
      @counter = REDIS
      @counter.set("1", "0")
      @result = @counter.get("1").to_i
      $reset_stat.incr
    rescue Errno::ECONNREFUSED, ::Redis::CannotConnectError
      @result = "Something went wrong! Check health of your counter using this link: "
    end
  end

  def health
    begin
      if REDIS.ping == "PONG"
        @health = "Redis database connection is OK!"
      end
    rescue Errno::ECONNREFUSED, ::Redis::CannotConnectError
      @health = "Redis database connection Failed!"
    end
  end

  def metrics
      @incr_number = $incr_stat.print
      @decr_number = $decr_stat.print
      @reset_number = $reset_stat.print
  end

  # Intentional application crash !
  def crash
    exit!
  end
end
