# frozen_string_literal: true

# Train list
class TrainList
  def initialize(trains = [])
    @trains = trains
  end

  def each_train
    @trains.each do |train|
      yield train
    end
  end
end
