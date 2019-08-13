class CounterController < ApplicationController
  def menu
      @counter = REDIS
      @number = @counter.get("1")
  end

  def incr
    @counter = REDIS
    @number = @counter.incr("1")
  end

  def decr
    @counter = REDIS
    @value_counter = @counter.get("1")
    case
    when @value_counter.to_i == 0
      @number = @value_counter
    when @value_counter.to_i > 0
      @number = @counter.decr("1")
    end
  end

  def reset
    @counter = REDIS
    @counter.set("1", "0")
    @number = @counter.get("1")
  end
end
