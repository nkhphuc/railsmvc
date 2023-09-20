# spec/workers/birthday_email_worker_spec.rb

require 'rails_helper'

RSpec.describe BirthdayEmailWorker, type: :worker do
  describe '#perform' do
    let(:student) { create(:student, birthday: Date.today) }

    it 'sends a birthday email' do
      expect(BirthdayMailer).to receive(:send_birthday_email).with(student).and_return(double(deliver_later: true))
      described_class.new.perform(student.id)
    end
  end
end
