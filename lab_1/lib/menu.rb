# frozen_string_literal: true

require 'tty-prompt'
require_relative 'train_list'
require_relative 'train'
require_relative 'stop'

# The main class
class Menu
  def initialize
    @prompt = TTY::Prompt.new
    @train_list = TrainList.new([
                                  Train.new(155, [
                                              Stop.new(1, 'Some', '12:55', 10, 10),
                                              Stop.new(2, 'Some1', '13:55', 10, 10),
                                              Stop.new(3, 'Some2', '14:55', 10, 10)
                                            ]),
                                  Train.new(110, [
                                              Stop.new(4, 'First', '12:05', 10, 10),
                                              Stop.new(5, 'Sec', '13:05', 10, 10),
                                              Stop.new(6, 'Third', '14:05', 10, 10)
                                            ])
                                ])
  end

  MAIN_MENU_CHOICES = [
    { name: 'Вывести расписание движения поездов', value: :rasp },
    { name: 'Вывести список поездов, отсортировав их по корличеству реальных остановок', value: :stops },
    { name: 'Завершить работу приложения', value: :exit }
  ].freeze

  def show_menu
    loop do
      action = @prompt.select('Выберите действие', MAIN_MENU_CHOICES)
      break if action == :exit

      show_rasp if action == :rasp
    end
  end

  def show_rasp
    train_id = @prompt.select('Выберите поезд') do |menu|
      @train_list.each_train do |train|
        menu.choice(train, train.id)
      end
    end
    pp train_id
  end
end
