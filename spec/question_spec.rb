require 'question_collection'
require 'quiz'
require 'estimation'

describe Question do
  let(:questions) do
    Question.new(text: 'Сколько дней в високосном году?', answers: %w[367 364 340 366], timer: 10, score: 2,
                 true_answer: '366')
  end

  describe '#new' do
    it 'defines instance variables' do
      expect(questions).to have_attributes(text: 'Сколько дней в високосном году?', answers: %w[367 364 340 366],
                                           timer: 10, score: 2, true_answer: '366')
    end
  end

  describe '#read_file' do
    it "returns instance of #{Question}" do
      expect(questions).to be_an_instance_of Question
    end

    it 'read file correctly' do
      expect(questions.score).to eq 2
      expect(questions.answers).to eq %w[367 364 340 366]
      expect(questions.timer).to eq 10
      expect(questions.true_answer).to eq '366'
    end
  end

  describe '#to_s' do
    it 'returns string representation of object' do
      expect(questions.to_s).to eq 'Сколько дней в високосном году?'
    end
  end
end
