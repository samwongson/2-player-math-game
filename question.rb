
class Question
  attr_accessor :num1, :num2, :answer, :operator
  def initialize
    @num1 = 1 + rand(20)
    @num2 = 1 + rand(20)
    @operator = ["+", "-", "*"].sample
    @answer = num1.method(operator).(num2)
  end

  def generate_question
    puts "What is #{num1} #{operator} #{num2}?"

  end

  def verify_answer(user_answer)
    if user_answer.to_i == @answer
      return true 
    else 
      return false
    end
  end


end