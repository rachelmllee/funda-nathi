class ChatMessagesController < ApplicationController
  before_action :authenticate_user!

  # GET /chat_messages
  # GET /chat_messages.json
  def index

    @chat_messages = ChatMessage.all
    respond_to do |format|
      if params[:chat_id]
        @chat_messages = Chat.where(id: params[:chat_id]).first.chat_messages.all
        # format.html { redirect_to @chat_message, notice: 'Chat message was successfully created.' }
        format.json { render :json => {messages: @chat_messages}, status: :ok }
      else
        redirect_to root_path
      end
    end

  end

  # GET /chat_messages/new
  def new
    @chat_message = ChatMessage.new
  end

  # POST /chat_messages
  # POST /chat_messages.json
  def create
    @chat_message = ChatMessage.new(chat_message_params)

    respond_to do |format|
      if @chat_message.save
        format.html { redirect_to @chat_message, notice: 'Chat message was successfully created.' }
        format.json { render :show, status: :created, location: @chat_message }
      else
        format.html { render :new }
        format.json { render json: @chat_message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_message
      @chat_message = ChatMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_message_params
      params.require(:chat_message).permit(:creator_id, :body, :chat_id, :is_read)
    end
end
