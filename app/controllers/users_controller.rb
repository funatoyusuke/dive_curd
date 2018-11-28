class UsersController < ApplicationController
before_action :set_company, :set_group
before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = @group.users.page(params[:page]).per(6)
  end

  def show
  end

  def new
    @user = @group.users.new
  end

  def create
    @user = @group.users.new(user_params)

    if @user.save
      redirect_to [@company, @group, @user], notice: '部署を追加しました.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to [@company, @group, @user], notice: '追加しました'
    end
  end

  def destroy
    @user.destroy
    redirect_to company_group_users_path(@company, @group)
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :tel, :comment)
  end

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
