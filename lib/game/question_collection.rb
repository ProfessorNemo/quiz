# frozen_string_literal: true

module Game
  class QuestionCollection
    def self.from_xml(path)
      file = File.new(path)

      doc = REXML::Document.new(file)

      file.close

      questions = doc.get_elements('questions/question').map do |question|
        question_data = {}
        question_data[:text] = question.elements['text'].text
        question_data[:answers] = question.get_elements('variants/variant').map(&:text)
        question_data[:timer] = question.attributes['timer'].to_i
        question_data[:score] = question.attributes['score'].to_i
        question.elements.each('variants/variant') do |answer|
          question_data[:true_answer] = answer.text if answer.attributes['right']
        end

        Game::Question.new(question_data)
      end

      new(questions)
    end

    def initialize(questions)
      @questions = questions
    end

    def to_a
      @questions
    end
  end
end
