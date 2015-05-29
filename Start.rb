class Player
  attr_accessor :name, :lives
  def initialize(name)
    @name = name
    @lives = 3
  end
end

class Question
  attr_accessor :num1, :num2, :answer, :operator
  def initialize
    @num1 = 1 + rand(20)
    @num2 = 1 + rand(20)
    @operator = ["+", "-", "*"].sample
    @answer = num1.method(operator).(num2)
  end

  def generate_question
    puts "#{@current_player.name}, What is #{num1} #{operator} #{num2}?"

  end

  def verify_answer(user_answer)
    if user_answer.to_i == @answer
      return true 
    else 
      return false
    end
  end


end




class Game
  
  attr_reader :p1, :p2, :current_player
  def initialize
    puts "Enter first player name: "
    p1name = gets.chomp
    @p1 = Player.new(p1name)
    puts "Enter second player name: "
    p2name = gets.chomp
    @p2 = Player.new(p2name)
    @current_player = @p1
  end

  def start
    while @p1.lives > 0 && @p2.lives > 0
      ask_question
    end
      puts "#{@current_player.name} loses!"

  end

  def switch_player
    if @current_player == @p1
      @current_player = @p2
    else
      @current_player = @p1
    end
  end



  def ask_question
    
    # generate_question
    q = Question.new
    q.generate_question
    answ_input = gets.chomp
    result = q.verify_answer(answ_input)

    if result == true 
      puts "good job" 
      puts "#{@current_player.name} score: #{@current_player.lives}"
    else
      puts "bad job"
      p @current_player
      @current_player.lives -= 1
      puts "#{@current_player.name} score: #{@current_player.lives}"
    end
    switch_player

  end

  # def verify_answer(q)
  #   answ_input = gets.chomp
  #   if answ_input.to_i == q.answer
  #     puts "Good job! Your score: #{}".colorize(:light_green)
  #   else
  #     if @current_player == false    #needs to start at false because player status was set during the question generation
        
  #       @player1 -= 1
  #       puts "wrong answer! Your score: #{@player1}".colorize(:red)
  #     else
  #       @player2 -= 1
  #       puts "wrong answer! Your score: #{@player2}".colorize(:red)
  #     end
  #   end
  # end


end
game = Game.new
game.start

