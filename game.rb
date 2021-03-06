

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
      puts "#{@current_player.name} wins!"
      puts "play again?"
      cont = gets.chomp.downcase
      if cont == "yes"
        @p1.lives = 3
        @p2.lives = 3
        start

      else
        puts "GAME OVER"
      end
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
      puts "Good job" 
      puts "#{@current_player.name} score: #{@current_player.lives}"
    else
      puts "Bad job!"
      print "#{@current_player.name} loses one point!".colorize(:red)
      @current_player.lives -= 1
      puts " #{@current_player.name} score: #{@current_player.lives}"
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

