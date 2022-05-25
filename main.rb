require 'timeout'
require 'rexml/xpath'

PW = 'lib/'.freeze
%W[#{PW}question_collection #{PW}quiz #{PW}estimation].each do |file|
  require_relative file
end

RANDOM_QUESTIONS = 5

quiz = Quiz.new(QuestionCollection.from_xml("#{__dir__}/questions.xml").to_a)

puts 'Мини-викторина. Ответьте на вопросы.'

quiz.questions.shuffle.sample(RANDOM_QUESTIONS).each do |question|
  puts "#{question} (#{Estimation.counting(question.score)})"

  question.answers.each.with_index(1) do |var, index|
    puts "#{index}. #{var}"
  end

  puts
  puts "Времени на ответ: #{question.timer} секунд"

  user_input = -1
  Timeout.timeout(question.timer) do
    until user_input.between?(1, question.answers.size)
      puts 'Введите соответствующую ответу цифру:'
      user_input = $stdin.gets.to_i
    end
  end

  result = if question.answers[user_input - 1] == question.true_answer
             quiz.scores << question.score
             'Верный ответ!'
           else
             "Неправильно. Правильный ответ #{question.true_answer}"
           end

  puts result
  puts
rescue Timeout::Error
  puts 'Время истекло:('
  puts
end

puts quiz.result(RANDOM_QUESTIONS)
