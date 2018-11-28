class CommentGroupsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @comment = @group.comment_groups.build(comment_params)
    
    respond_to do |format|
      if @comment.save!
        format.js { render :index }
      else
        format.html { redirect_to blog_path(@group), notice: '投稿できませんでした...' }
      end
    end
  end

  private
  def comment_params
    params.require(:comment_group).permit(:group_id, :body)
  end

end
