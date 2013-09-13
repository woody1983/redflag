def event(name,&block)
  @events[name] = block
end

def setup(&block)
  @setups << block
end

Dir.glob('*events.rb').each do |file|
  @setups = []
  @events = {}
#puts @setups.size
  load file
#puts @setups

  @events.each_pair do |name, event|
    env = Object.new
puts "event.each_pair>>>#name: #{name}"
puts "event.each_pair>>>#event: #{event}"
    @setups.each do |setup|
      env.instance_eval &setup
puts  "setups.each>>>#setup: #{setup}"
    end
    puts "ALTER: #{name}" if env.instance_eval &event
  end
end


#puts @events
#puts @setups
