class Pet
  VALUE = 1
  MAX_VALUE = 10
  MIN_VALUE = 0

  def initialize(name)
    @animal = 'dog'
    @name = name
    @health = MAX_VALUE
    @mood = MAX_VALUE
    @hungry = MIN_VALUE
    @asleep = false
    @cleanliness = MIN_VALUE
    @fatigue = MIN_VALUE
  end

  def start
    puts "Welcome! Your dog #{@name} created! Enter 'help' for more info!"
    send_help = gets.chomp
    send(send_help)
  end

  def help
    puts 'You may use command: feed, walk, sleep, clean, play, training, watch.'
    command = ''
    until command == 'exit'
      puts "#{@name}: health #{@health}, mood #{@mood},
      hungry #{@hungry}, cleanliness #{@cleanliness}, fatigue #{@fatigue}"
      command = gets.chomp
      send(command)
    end
  end

  def feed
    puts "You feed #{@name}."
    @hungry = MIN_VALUE - VALUE
    passage_of_time
  end

  def walk
    puts "You walk with #{@name}."
    @mood = MAX_VALUE - VALUE
    @hungry += VALUE
    @fatigue += VALUE
    passage_of_time
  end

  def sleep
    puts "#{@name} sleeping now."
    @asleep = true
    @health += VALUE
    @hungry = MAX_VALUE - VALUE
    @fatigue = MIN_VALUE
    passage_of_time
  end

  def clean
    puts "You clean up after #{@name}."
    @cleanliness = MIN_VALUE - VALUE
    passage_of_time
  end

  def play
    puts "You play with #{@name}."
    @mood = MAX_VALUE + VALUE
    @hungry += VALUE
    passage_of_time
  end

  def training
    puts "You train #{@name}."
    @health -= VALUE
    @mood -= VALUE
    @fatigue += VALUE
    passage_of_time
  end

  def watch
    watch_action
  end

  private

  def passage_of_time
    @hungry += VALUE
    @mood -= VALUE
    @cleanliness += VALUE
    health_value
  end

  def health_value
    if @hungry > 6
      @health -= VALUE
    elsif @mood < 2
      @health -= VALUE
    end
    end_of_tamagochi
  end

  def watch_action
    if @hungry > 6
      puts "#{@name} wants to eat! He bit you!"
    elsif @mood > 6
      puts "#{@name} licks you!"
    end
  end

  def end_of_tamagochi
    if @health < MIN_VALUE
      puts "#{@name} die! Try again!"
      exit
    elsif @mood < MIN_VALUE
      puts "#{@name} ran away! Try again!"
      exit
    end
  end
end

puts 'ENTER NAME OF YOUR DOG:'
pet = Pet.new(gets.chomp)
puts pet.start
