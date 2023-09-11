# frozen_string_literal: true

# Grade
class Grade < ApplicationRecord
  belongs_to :student

  enum subject: { 'Math' => 0, 'Physic' => 1 }
  enum semester: { 'I' => 0, 'II' => 1 }

  validates :score, inclusion: { in: 0..10 }
end
