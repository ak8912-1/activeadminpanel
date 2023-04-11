class SendMailJob
  include Sidekiq::Job

  def perform(user_id)
    user = User.find_by_id(user_id)
    UserMailer.with(user:user).welcome.deliver_later
  end
end
