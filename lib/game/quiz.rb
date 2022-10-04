# frozen_string_literal: true

module Game
  class Quiz
    attr_accessor :questions, :scores

    def initialize(questions)
      @questions = questions
      @scores = []
    end

    def result(number_of)
      <<~GAME_OVER
        Правильных ответов: #{scores.size} из #{number_of}
        Вы набрали #{Game::Estimation.counting(scores.sum)}!
      GAME_OVER
    end
  end
end
