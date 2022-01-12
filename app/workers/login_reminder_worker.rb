class LoginReminderWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

	def perform
    User.where(sign_in_count: 0).each do |user|
    	UserMailer.with(user: user).login_reminder.deliver_later
    end
	end
end