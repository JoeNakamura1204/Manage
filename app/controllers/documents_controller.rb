require 'net/https'

class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    uri = URI.parse("http://localhost:8000/status")


    @query = uri.query
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.open_timeout = 10
      http.read_timeout = 10
      http.get(uri.request_uri)
    end
    puts 'jiihihihi'
    result = JSON.parse(response.body)
    puts result
    puts 'jiihihihi'
    if @document.save
      redirect_to root_path
    else
      redirect_to new_document_path
    end


  end



  private
    def document_params
      params.require(:document).permit(:title, :content)
    end
end
