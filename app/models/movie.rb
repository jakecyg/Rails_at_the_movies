class Movie < ApplicationRecord
  validates :title, :year, :duration, :description, :average_vote, presence: true
  validates :title, uniqueness: true
  validates :year, :duration, numericality: { only_integer: true }
  validates :average_vote, numericality: true
  belongs_to :production_company
end
