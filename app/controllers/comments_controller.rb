class CommentsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @comment = @company.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to company_path(@company), notice: '投稿できませんでした...' }
      end
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:company_id, :body)
  end
end

