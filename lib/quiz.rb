require_relative 'estimation'

class Quiz
  attr_accessor :questions, :scores

  def initialize(questions)
    @questions = questions
    @scores = []
  end

  def result(number_of)
    <<~END
      Правильных ответов: #{scores.size} из #{number_of}
      Вы набрали #{Estimation.counting(scores.sum)}!
    END
  end
end
