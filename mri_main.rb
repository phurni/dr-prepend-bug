# Run this with MRI, it will run the code in app/ but correctly!

$:.prepend "."

### shenanigans
$tick_count = 0
Kernel.class_eval do
  def tick_count
    $tick_count
  end
end
args = Object.new
def args.state
  state = Object.new
  def state.tick_count
    $tick_count
  end
end
###

require 'app/main'

100.times do
  tick(args)
  $tick_count += 1
end
