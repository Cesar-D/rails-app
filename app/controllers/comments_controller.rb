class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ edit update destroy ]

  def edit
  end

  def create
    @comment = current_user.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_path(@comment.article_id), notice: "Comment was successfully created." }
      else
        format.html { redirect_to article_path(@comment.article_id), alert: "Failed to create comment.", status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated.", status: :see_other }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to comments_path, notice: "Comment was successfully destroyed.", status: :see_other }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text, :article_id)
    end
end
