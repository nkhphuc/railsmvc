# frozen_string_literal: true

namespace :db do
  desc 'Generate students and grades'
  task gen_students: :environment do
    arr = ('A'..'Z').to_a
    100.times do |_n|
      Student.create(name: "Nguyen Van #{arr.sample}",
                     grades_attributes: [
                       { subject: rand(0..1), score: rand(1..9), semester: rand(0..1) },
                       { subject: rand(0..1), score: rand(1..9), semester: rand(0..1) }
                     ])
    end
  end
end
