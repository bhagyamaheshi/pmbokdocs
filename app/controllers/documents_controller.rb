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

    temp = DocumentCategory.select(:categoryName).where('id = ?', params[:documentCategoryId])
    temp.each do |name|
      @categoryName = name.categoryName
    end

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

    documentVersion = Document.select(:version).where('project_id = ? AND document_category_id = ?', @document.project_id, @document.document_category_id).maximum(:version)
    documentVersionMinor = Document.select(:versionMinor).where('project_id = ? AND document_category_id = ?', @document.project_id, @document.document_category_id).maximum(:versionMinor)
    
    if documentVersion != nil
      if params[:versionType] == "major"
        @document.version = documentVersion.to_i+1
        @document.versionMinor = 0
      else
        @document.version = documentVersion.to_i
        @document.versionMinor = documentVersionMinor.to_i+1
      end
    else
      @document.version = 1
      @document.versionMinor = 0
    end

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
