event "The sky is falling" do 
  @sky_height < 300
end

event "it's getting closer" do
  @sky_height < @mountains_height
end

setup do
  puts "[\033[1;36;40m Setting up \033[m] [\033[1;37;40m Sky \033[m]"
  @sky_height = 100
end

setup do 
  puts "[\033[1;36;40m Setting up \033[m] [\033[1;37;40m Mountains \033[m]"
  @mountains_height = 200
end
