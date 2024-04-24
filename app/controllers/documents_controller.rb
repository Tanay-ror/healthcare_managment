# app/controllers/documents_controller.rb
class DocumentsController < ApplicationController
  before_action :authenticate_request
  before_action :set_document, only: [:show, :update, :destroy]

  # GET /documents
  def index
    documents = current_user.documents
    render json: documents, status: :ok
  end

  # GET /documents/:id
  def show
    render json: @document, status: :ok
  end

  # POST /documents
  def create
    document = current_user.documents.build(document_params)
    if document.save
      render json: { data: { id: document.id }, status: :created }
    else
      render json: document.errors, status: :unprocessable_entity
    end
  end



  # PUT /documents/:id
  def update
    if @document.update(document_params)
      render json: { data: @document, status: :ok }
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  # DELETE /documents/:id
  def destroy
    @document.destroy
    head :no_content
  end

  private

  def set_document
    @document = current_user.documents.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Document not found' }, status: :not_found
  end

  def document_params
    params.require(:document).permit(:document_type, :file)
  end
end
