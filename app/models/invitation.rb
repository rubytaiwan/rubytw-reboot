class Invitation
  require "http"
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :email
  validates :email, presence: true

  URL = "https://#{ENV['SLACK_TEAM']}.slack.com/api/users.admin.invite"

  def create_and_send
    return unless valid?

    response = HTTP.post(URL, form: options).parse
    if response["ok"]
      true
    else
      errors.add(:email, response["error"])
      false
    end
  end

  private

  def options
    {
      email: @email,
      channels: ENV["SLACK_CHANNELS"],
      token: ENV["SLACK_TOKEN"],
      set_active: "true",
      _attempts: 1
    }
  end
end
