# frozen_string_literal: true

module Game
  class Question
    attr_reader :answers, :score, :timer, :true_answer, :text

    def initialize(tags)
      @text = tags[:text]
      @answers = tags[:answers]
      @timer = tags[:timer]
      @score = tags[:score]
      @true_answer = tags[:true_answer]
    end

    def to_s
      @text
    end
  end
end
