require 'net/https'
require File.expand_path('../Manage/tendermintGCI','.')
puts File.expand_path('../app.js',__dir__)
class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to root_path
    else
      redirect_to new_document_path
    end

    content_hash = @document.content.hash
    tx = %('{"document_db_id":#{@document.id},"content_hash":"#{content_hash}"}')
    system(%(lotion send #{$GCI_tendermint} #{tx}))

    @document.update(tx_hash:p)

  end

  def show
    @document = Document.find_by(id:params[:id])
  end



  private
    def document_params
      params.require(:document).permit(:title, :content)
    end
end
