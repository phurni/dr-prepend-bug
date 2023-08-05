class Item
  prepend Timers

  def initialize
    every(100)
  end

  def update(args)
    puts "Item#update"
    args.outputs.debug << args.gtk.framerate_diagnostics_primitives
  end
end
