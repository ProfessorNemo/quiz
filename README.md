# Консольная игра `quiz + набор тестов (Rspec)`
###### Язык написания - Ruby

## Описание игры:
Программа в стиле викторины. Берутся вопросы из XML-файла со списком вопросов и ответов.
Для каждого пункта  -  вопрос, варианты ответов, правильный вариант, количество баллов и время
на ответ. Если человек тратит на ответ больше времени, чем отведено, то программа осуществляет
переход к следующему вопросу и сообщает об этом пользователю. Выбирается 5 случайных вопросов из
XML-файла.


## Установка и запуск:

**Примечание:** Это ruby-приложение, поэтому необходимо
чтобы на вашем компьютере был установлен интерпретатор Ruby.

1. Перенесите содержимое данного репозитория на свой компьютер
```
git clone git@github.com:ProfessorNemo/quiz.git
```
2. Чтобы запустить игру в этой же директории
следует воспользоваться следующей командой:
```
ruby main.rb
```
___

Также программа покрыта тестами Rspec. Если rspec не установлен, запустите следующую команду:
```
$ gem install rspec
```
Далее запустите тесты, введя в каталоге с программой команду:
```
$ rspec spec/
```
___



