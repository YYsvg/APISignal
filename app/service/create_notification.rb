class CreateNotification
  include HTTParty

  API_URI = 'https://onesignal.com/api/v1/notifications'.freeze

  def self.call(*args)
    new(*args).call
  end

  def initialize(contents:, type:)
    @contents = contents
    @type     = type
  end

  def call
    HTTParty.post(API_URI, headers: headers, body: body)
  end

  private

  attr_reader :contents, :type

  def headers
    {
      'Authorization' => "Basic #{ENV['AUTH_KEY']}",
      'Content-Type'  => 'application/json'
    }
  end

  def body
    {
      'app_id' => ENV['APP_ID'],
      'url'    => 'https://guitars-parent-hc-editors.trycloudflare.com',
      'data'   => { 'type': type },
      'included_segments' => ['All'],
      'contents' => contents
    }.to_json
  end
end
