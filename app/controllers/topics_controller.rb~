class TopicsController < ApplicationController

  skip_before_filter :authorize, :only => [:index, :show]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    #@forum = Forum.find(params[:topic][:forum_id])
    #@topic = @forum.topics.new(params[:topic])
    @topic = Topic.new(params[:topic])
    @topic.user = @current_user
    #@topic.forum.last_poster_id = session[:user_id]
    #@topic.forum.last_post_at=Time.now
    #@topic.forum.save

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { redirect_to new_forum_topic_path(@topic.forum), :alert => "Please fill up all fields." }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    
    @forum = Forum.find_by_last_topic_id(@topic.id)
    @forum.last_topic_id = 0
    @forum.save
 
    respond_to do |format|
      format.html { redirect_to @topic.forum, notice: 'Topic was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
