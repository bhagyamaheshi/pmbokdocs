class DocumentsController < ApplicationController
  #before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]

  respond_to :html

  def index
    @document_categories = DocumentCategory.all.order('id ASC')
    @projectId = params[:projectId]
  end

  def show
    @document = Document.new
    @projectName = Project.find(params[:projectId])
    @documentCategoryName = DocumentCategory.find(params[:documentCategoryId]).categoryName

    @documentList = Document.where('document_category_id = ? AND project_id = ?', params[:documentCategoryId], params[:projectId]).order('created_at DESC')

    @activity_id = params[:activityId]
  end

  def new
  end

  def edit
  end

  def create
    @document = Document.new(document_params)

    @document.project_id = params[:document][:project_id]
    @document.document_category_id = params[:document][:document_category_id]
    @document.description = params[:document][:description]
    @document.activity_id = params[:document][:activity_id]

    begin
    @document.fileLocation = params[:document][:upload].path

    documentVersion = Document.select(:version).where('project_id = ? AND document_category_id = ?', @document.project_id, @document.document_category_id).maximum(:version)
    documentVersionMinor = Document.select(:versionMinor).where('project_id = ? AND document_category_id = ?', @document.project_id, @document.document_category_id).maximum(:versionMinor)
    documentCategoryName = DocumentCategory.find(@document.document_category_id).categoryName

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
        documentCategoryName = documentCategoryName+' v'+@document.version.to_s+'.'+@document.versionMinor.to_s
        @document.rename(documentCategoryName)
        @document.save

    rescue Exception => e

    end

    if(@document.activity_id)
      @activity = Activity.find(@document.activity_id)
      @activity.update(status: 'completed')
    end

    redirect_to :action => 'show',
                :documentCategoryId => @document.document_category_id,
                :projectId => @document.project_id,
                notice: 'Successfully uploaded'
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
      params.require(:document).permit(:title, :description, :fileLocation, :upload, :upload2, :document_category_id, :project_id, :documentCategoryId, :projectId)

    end

end
