def event(name,&block)
  @events[name] = block
end

def setup(&block)
  @setups << block
end

Dir.glob('*events.rb').each do |file|
  @setups = []
  @events = {}

  load file

  env = Object.new
  
  @setups.each {|setup| env.instance_eval &setup }
    
  @events.each_pair do |name, event|
    #env = Object.new
    #@setups.each do |setup|
    #  env.instance_eval &setup
    #end
    puts "[\033[1;31;40m ALTER \033[m]: #{name}" if env.instance_eval &event
  end

end


#puts @events
#puts @setups
