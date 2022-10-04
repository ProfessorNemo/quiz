# frozen_string_literal: true

RSpec.describe Game::Quiz do
  let(:file_path) { File.expand_path('./lib/game/questions.xml') }

  let(:quiz) { described_class.new(Game::QuestionCollection.from_xml(file_path).to_a) }

  let(:quest) { Game::QuestionCollection.new(questions) }

  describe '#to_a' do
    it 'reads all array xml files' do
      expect(quiz.questions.size).to eq 14
    end
  end

  describe '#new' do
    it 'checks for compliancen' do
      expect(quiz).to be_an_instance_of described_class
    end
  end

  describe 'my_describe' do
    it 'search for a question by keyword' do
      question = []
      quiz.questions.map.with_index do |quest, _index|
        question << quest.text
        break if question.join(' ').freeze.match?(/Земля/)
      end
      expect(question.last.freeze.match?(/Земля/)).to be true
    end
  end

  describe '#result' do
    it 'maximum value of balls' do
      max_scor = []
      quiz.questions.map do |question|
        max_scor << Game::Estimation.counting(question.score).to_i
      end

      sum = max_scor.sum
      quiz.scores = max_scor

      expect(quiz.result(14))
        .to eq <<~GAME_OVER
          Правильных ответов: #{quiz.questions.size} из 14
          Вы набрали #{Game::Estimation.counting(sum, false)}!
        GAME_OVER
    end
  end
end
