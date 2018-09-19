class Task < ApplicationRecord
  belongs_to :user

  def initialize(name)
    Task.new do |t|
      t.start_time = Time.now
      t.name = name
    end
  end
end
