class EveryTimer
  def initialize(duration_ticks, block)
    @block = block
    @duration_ticks = duration_ticks
    @target_tick_count = Kernel.tick_count + @duration_ticks
  end

  def tick(args)
    if args.state.tick_count >= @target_tick_count
      @target_tick_count = Kernel.tick_count + @duration_ticks
      @block.call
    end
  end
end

module Timers
  def update(args)
    @_timers ||= []
    @_timers.each {|timer| timer.tick(args) }

    # Because this `Timers` module was mixed-in with `prepend` in the `Item` class,
    # `super` should call `update` in the `Item` class!
    super(args)
  end

  def every(duration, options = {}, &block)
    @_timers ||= []
    EveryTimer.new(duration / 16.6666666666666667, block).tap {|timer| @_timers << timer }
  end
end
