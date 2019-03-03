require 'net/https'

class DocumentsController < ApplicationController
  GCI_tendermint = "d4654cfa16a779cf51f12a4256a48835591ba4982d4a69f52d06e754ca9b0699"
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
    system(%(lotion send #{GCI_tendermint} #{tx}))

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
