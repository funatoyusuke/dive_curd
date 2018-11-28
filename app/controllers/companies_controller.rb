class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :new, :create]
    
  def index
    @q = Company.ransack(params[:q])
    @companies = @q.result(distinct: true).page(params[:page]).per(6)
  end

  def show
    @comments = @company.comments
    @comment = @company.comments.build
  end

  def new
    @company = Company.new
  end

  def edit
  end


  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company, notice: '会社を追加しました'
    else
      render action: 'new'
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: '更新しました'
    else
      render action: 'edit'
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url
  end


  def comment
    @company_comment = Company.find(params[:id])
    @comment = Comment.new(comment_params.merge(company_id: @company_comment.id))
    @comment.save!
      redirect_to action: :show, notice: '成功'
    rescue
      render action: :show, notice: '失敗'
  end

  def search
    @q = Company.search(search_params)
    @companies = @q.result(distinct: true)
  end


  private

  def company_params
    params.require(:company).permit(:name, :address, :tel, :fax, :url, :comment)
  end

  def comment_params
    params.require(:comment).permit(:name, :body)
  end

  def search_params
     params.require(:q).permit(:name_cont)
  end

  def set_company
     id = params[:company_id] ? params[:company_id] : params[:id]
     @company = Company.find(id)
  end

  def must_login
     if current_user.nil?
       redirect_to root_path, notice: "ログインしてください"
     end
  end

end
