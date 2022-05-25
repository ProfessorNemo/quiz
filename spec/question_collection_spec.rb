require 'question_collection'
require 'quiz'
require 'estimation'

describe QuestionCollection do
  let(:quests) do
    [
      Question.new(text: 'Сколько байт в килобайте?', answers: %w[1000 2048 1024 512], timer: 10, score: 3,
                   true_answer: '1024'),
      Question.new(text: 'В каком году Гагарин полетел в космос?', answers: %w[1905 1945 1961 1991], timer: 10,
                   score: 3, true_answer: '1961'),
      Question.new(text: 'Сколько дней в високосном году?', answers: %w[367 364 340 366], timer: 10, score: 2,
                   true_answer: '366')
    ]
  end

  let(:questions_from_file) { QuestionCollection.from_xml('questions.xml') }

  let(:collection) { QuestionCollection.new(quests) }

  describe '#from_xml' do
    it 'the array is a array' do
      expect(questions_from_file.to_a.is_a?(Array)).to be true
    end

    it 'the array is a hash' do
      expect(questions_from_file.to_a.is_a?(Hash)).to be false
    end
  end

  describe '#to_a' do
    context 'reads all array xml files' do
      it 'the total number of questions is 14' do
        expect(questions_from_file.to_a.size).to eq 14
      end

      it 'in array 3 hash' do
        expect(collection.to_a.size).to eq 3
      end

      it 'array is not empty' do
        expect(collection.to_a.empty?).to eq false
      end
    end
  end

  describe '#new' do
    it 'checks for compliancen' do
      expect(collection).to be_an_instance_of QuestionCollection
    end
  end
end
