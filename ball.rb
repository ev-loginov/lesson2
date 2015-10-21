require 'yaml'
class Ball
  ANSWERS = YAML.load_file('answers.yml')
  RED = 31
  GREEN = 32
  YELLOW = 33
  CYAN = 34
  def color(random)
    case random
    when 0..4
      RED
    when 5..9
      GREEN
    when 10..14
      YELLOW
    when 15..19
      CYAN
    end
  end

  def shake
    random = Random.rand(ANSWERS.size)
    puts "\e[#{color(random)}m#{ANSWERS[random]}\e[0m"
    ANSWERS[random]
  end
end

puts 'Ask Magic 8 ball a question'
gets.chomp
ball = Ball.new
puts ball.shake
