class DocumentsController < ApplicationController
  #before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]

  respond_to :html

  def index
    #@documents = Document.all
    @document_categories = DocumentCategory.all
    @project_id = params[:project_id]
    #respond_with(@document_categories)
  end

  def show
    @documentName = DocumentCategory.where('id = ?', params[:documentCategoryId])
    @documentList = Document.where('document_category_id = ? AND project_id = ?', 1, 1).order('created_at DESC')

=begin
    if @documentList != nil
      #respond_with(@documentList)
    else
      print "test"
    end
=end
  end

  def new
    @document = Document.new
    respond_with(@document)
  end

  def edit
  end

  def create
    @document = Document.new(document_params)
    #@document.save
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
      params.require(:document).permit(:title, :description, :fileLocation, :file, :document_category_id, :project_id)
    end

end