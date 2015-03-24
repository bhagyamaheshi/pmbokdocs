class DocumentsController < ApplicationController
  #before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]

  respond_to :html

  def index
    @document_categories = DocumentCategory.all
    @projectId = params[:projectId]
    #respond_with(@document_categories)
  end

  def show
    @document = Document.new
    @documentName = DocumentCategory.where('id = ?', params[:documentCategoryId])
    @documentList = Document.where('document_category_id = ? AND project_id = ?', params[:documentCategoryId], params[:projectId]).order('created_at DESC')
    #respond_with(@document)
  end

  def new
    #@document = Document.new
    #@uploadDocument = Document.new(document_params)
    #respond_with(@document)
  end

  def edit
  end

  def create
    @document = Document.new(document_params)
    @document.project_id = params[:document][:project_id]
    @document.document_category_id = params[:document][:document_category_id]
    @document.save
    respond_with(@document)
  end

  def update
    @document.update(document_params)
    respond_with(@document)
  end

  def destroy
    @document.destroy
    respond_with(@document)
  end


  private
    def set_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:title, :description, :fileLocation, :file, :document_category_id, :project_id, :documentCategoryId, :projectId)
    end

end
