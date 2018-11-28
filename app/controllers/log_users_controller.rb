class LogUsersController < ApplicationController
  before_action :set_company, :set_group, :set_user
  skip_before_action :authenticate
  
  def show
  end

  private
  def set_company
       id = params[:company_id] ? params[:company_id] : params[:id]
       @company = Company.find(id)
    end
    
    def set_group
      group_id = params[:group_id] ? params[:group_id] : params[:id]
      @group = @company.groups.find(group_id)
    end
    
    def set_user
      user_id = params[:user_id] ? params[:user_id] : params[:id]
      @user = @group.users.find(user_id)
    end


end
