class ChatbotController < ApplicationController
  def index
  end

  def ask_watson(query)
    require 'net/http'
    require 'json'

    # This is a standard HTTP Post using the net/http built into rails
    # It mimics this curl command as per the Watson Conversation API standards
    # curl -u 0a64fe2a-b01a-43c2-98e4-401f4f5131df:BaWjpCOtXXce -H "Content-Type:application/json" -d "{\"input\": {\"text\": \"Hello\"}}" "https://gateway.watsonplatform.net/conversation/api/v1/workspaces/07e02c55-f1e9-4953-8cb2-e50bae764e3b/message?version=2016-07-11"

    # Replace the text with the user data and be sure to add context
    # into the body data
    @body = query.to_json

    uri = URI.parse("https://gateway.watsonplatform.net/conversation/api/v1/workspaces/07e02c55-f1e9-4953-8cb2-e50bae764e3b/message?version=2016-07-11")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(uri.request_uri)
    request.add_field('Content-Type', 'application/json')
    request.basic_auth("0a64fe2a-b01a-43c2-98e4-401f4f5131df", "BaWjpCOtXXce")
    request.body = @body
    response = http.request(request)

    puts response.body
  end

  def query
    @query = params[:query]
    p @query
    ask_watson(@query)
    render :index
  end
  # def create
  #   @chat = Chat.new()
  # end
  #
  # def new_comment
  # end
  #
  # def add_comment
  # end
  #
  # def show
  # end
  #
  # def comment_params
  #   params.require(:comment).permit(:timestamp, :text, :context)
  # end

end

# def converse
# #   require 'rest-client'
# #   url = "https://gateway.watsonplatform.net/conversation/api/v1/workspaces/07e02c55-f1e9-4953-8cb2-e50bae764e3b/message?version=2016-07-11"
# #   username = '0a64fe2a-b01a-43c2-98e4-401f4f5131df'
# #   password = 'BaWjpCOtXXce'
# #
# #   client = RestClient::Resource.new(url, username, password)
# #   insights = client.post 'hello', :content_type => 'application/json'
# # end
# # helper_method :converse
