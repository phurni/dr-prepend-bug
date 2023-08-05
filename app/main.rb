require 'app/timers'

### Toggle between these 2 scenarios to show the 2 issues

# Scenario 1:
require 'app/item_prepend_allocation_error'
# When run this is the output:
# - 000001 [Game] * EXCEPTION: allocation failure
# ** Backtrace:
# *** app/item_prepend_allocation_error.rb:5:in initialize
# *** app/main.rb:30 (-1)

# Scenario 2:
#require 'app/item_prepend_superclass_lost'
# When run this is the output:
# - 000001 [Game] * EXCEPTION POSSIBLY CAUSED BY CALLING ~gtk.reset~: maybe use ~$gtk.reset_next_tick~ instead.
# An exception occurred soon after ~$gtk.reset~ was invoked.
# ...
# * EXCEPTION THROWN:
# superclass info lost [mruby limitations]
# ** Backtrace:
# *** app/timers.rb:23:in update
# *** app/main.rb:33:in tick
# *** app/main.rb:32
# * Backtrace ~$gtk.reset~ last invocation: (0)
# * 000003 [Engine] Logging shutting down

###

$item = Item.new

def tick(args)
  $item.update(args)
end
