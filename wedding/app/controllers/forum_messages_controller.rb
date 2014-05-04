class ForumMessagesController < ApplicationController
  before_action :set_forum_message, only: [:show, :edit, :update, :destroy]

  # GET /forum_messages
  # GET /forum_messages.json
  def index
    @forum_messages = ForumMessage.all
  end

  # GET /forum_messages/1
  # GET /forum_messages/1.json
  def show

  end

  # GET /forum_messages/new
  def new
    @forum_message = ForumMessage.new
  end

  # GET /forum_messages/1/edit
  def edit
  end

  # POST /forum_messages
  # POST /forum_messages.json
  def create
    @forum_message = ForumMessage.new(forum_message_params)
    @forum_message.user = current_user
    @forum_thread = @forum_message.forum_thread

    respond_to do |format|
      if @forum_message.save
        format.html { redirect_to @forum_thread, notice: 'Forum message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @forum_message }
      else
        format.html { render action: 'new' }
        format.json { render json: @forum_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum_messages/1
  # PATCH/PUT /forum_messages/1.json
  def update
    respond_to do |format|
      if @forum_message.update(forum_message_params)
        format.html { redirect_to @forum_thread, notice: 'Forum message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @forum_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_messages/1
  # DELETE /forum_messages/1.json
  def destroy
    @forum_message.destroy
    respond_to do |format|
      format.html { redirect_to forum_messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_message
      @forum_message = ForumMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_message_params
      params.require(:forum_message).permit(:forum_thread_id, :content, :user_id)
    end
end
