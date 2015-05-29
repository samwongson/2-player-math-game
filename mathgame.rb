require 'pry'
require 'colorize'
@current_player = true
@player1 = 3
@player2 = 3


def generate_question
  num1 = 1 + rand(20)
  num2 = 1 + rand(20)
  operator = ["+", "-", "*", "/"].sample
  @answ = num1.method(operator).(num2)
    if @current_player
    puts "Player 1:  What is #{num1} #{operator} #{num2}?"
    @current_player = false
    else
    puts "Player 2: What is #{num1} #{operator} #{num2}?"
    @current_player = true
  end
end



def verify_answer
  answ_input = gets.chomp
  if answ_input.to_i == @answ
    puts "Good job! Your score: #{}".colorize(:light_green)
  else
    if @current_player == false    #needs to start at false because player status was set during the question generation
      
      @player1 -= 1
      puts "wrong answer! Your score: #{@player1}".colorize(:red)
    else
      @player2 -= 1
      puts "wrong answer! Your score: #{@player2}".colorize(:red)
    end
  end
end

def game
  while @player1 > 0 && @player2 > 0
    generate_question
    verify_answer
  end
  puts "game over!"
end


game



