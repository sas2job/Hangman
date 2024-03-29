# ============================================
# Задача 15-4 — Регистронезависимая виселица
# ============================================
#
# encoding: utf-8
#
# Популярная детская игра
# https://ru.wikipedia.org/wiki/Виселица_(игра)
#
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем классы Game, ResultPrinter и WordReader
require_relative "lib/game"
require_relative "lib/result_printer"
require_relative "lib/word_reader"

# Подключаем классы гема "colorize"
require 'colorize'
require 'colorized_string'

puts "\nИгра виселица. Homework 15-4\n\n".colorize(:light_blue)
sleep 1

printer = ResultPrinter.new

word_reader = WordReader.new

words_file_name = File.dirname(__FILE__) + "/data/words.txt"

game = Game.new(word_reader.read_from_file(words_file_name))

while game.status == 0
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
