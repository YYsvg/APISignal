class ApplicationController < ActionController::Base
before_action :set_gon

private

  def set_gon
    gon.app_id = ENV['APP_ID']
  end
end
