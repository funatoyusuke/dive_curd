class TopsController < ApplicationController
  skip_before_action :authenticate_log_user!
    
  def index
  end
end
