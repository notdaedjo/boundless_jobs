class Job < ApplicationRecord
  LEVELS = %i[junior intermediate senior].freeze
  enum level: LEVELS

  validates :position, presence: true
end
