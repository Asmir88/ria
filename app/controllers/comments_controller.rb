class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new(params[:comment])
    @comment.user = @current_user
    #@comment.reply_id = params[:comment][:reply_id]
    @comment.topic.forum.last_post_at = Time.now
    @comment.topic.forum.last_poster_id = session[:user_id]
    @comment.topic.forum.last_topic_id = @comment.topic.id
    @comment.save
    @comment.topic.forum.save
    redirect_to @topic
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @replies = Comment.find_all_by_reply_id(params[:id])
    if @replies != []
      @replies.each do |f|
        f.reply_id = nil
        f.save
      end
    end

    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to(@comment.topic) }
      format.xml  { head :ok }
    end
  end

end
