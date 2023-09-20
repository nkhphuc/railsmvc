class BirthdayEmailWorker
  include Sidekiq::Worker

  def perform(student_id)
    student = Student.find(student_id)
    BirthdayMailer.send_birthday_email(student).deliver_later
  end
end
