class Grade < ApplicationRecord
  belongs_to :student

  enum subject: {'Math': 0, 'Physic': 1}
  enum semester: {'I': 0, 'II': 2}
end
