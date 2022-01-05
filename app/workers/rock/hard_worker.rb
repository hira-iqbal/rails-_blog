class Rock::HardWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    if user
      user.update_password
    end
  end
end
