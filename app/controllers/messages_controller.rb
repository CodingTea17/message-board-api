class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  include Response

  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @messages= @messages.time_at(params[:time]) if params[:time].present?
    json_response(@messages)
  end

  def show
    @message = Message.find(params[:id])
    json_response(@message)
  end

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.create(message_params)
    json_response(@message, :created)
  end

  def update
    @message = Message.find(params[:id])
    if @message.author === params[:author]
      if @message.update(message_params)
        render status: 200, json: {
          updated: "Your Message has been updated, Let the Spice Flow"
        }
      end
    else
      render status: :unauthorized, json: {
        not_authorized: "You are nont authorized to update this message"
      }
    end
  end


  def destroy
    @message = Message.find(params[:id])
    if @message.author === params[:author]
      json_response(@message.destroy)
    else
    render status: :unauthorized, json: {
      not_authorized: "You are nont authorized to delete this message"
    }
    end
  end

  private

  def message_params
    params.permit(:author, :content, :title)
  end
end
