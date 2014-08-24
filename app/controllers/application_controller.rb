require 'mailchimp'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :setup_mcapi

  def setup_mcapi
    @vfmc = Mailchimp::API.new(ENV['VFMC_API_KEY'].to_s)
    @vf_list_id = ENV['VF_LIST_ID'].to_s
  end
end
