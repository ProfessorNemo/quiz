# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Quiz do
  let(:quiz) { Quiz.new(QuestionCollection.from_xml("#{__dir__}/questions.xml").to_a) }

  let(:quest) { QuestionCollection.new(questions) }

  describe '#to_a' do
    it 'reads all array xml files' do
      expect(quiz.questions.size).to eq 14
    end
  end

  describe '#new' do
    it 'checks for compliancen' do
      expect(quiz).to be_an_instance_of Quiz
    end
  end

  describe 'my_describe' do
    it 'search for a question by keyword' do
      question = []
      quiz.questions.map.with_index do |quest, _index|
        question << quest.text
        break if question.join(' ').freeze.match?(/город/)
      end
      expect(question.last.freeze.match?(/город/)).to be true
    end
  end

  describe '#result' do
    it 'maximum value of balls' do
      max_scor = []
      quiz.questions.map do |question|
        max_scor << Estimation.counting(question.score).to_i
      end

      sum = max_scor.reduce(:+)
      quiz.scores = max_scor

      expect(quiz.result(14))
        .to eq <<~END
          Правильных ответов: #{quiz.questions.size} из 14
          Вы набрали #{Estimation.counting(sum, false)}!
        END
    end
  end
end
