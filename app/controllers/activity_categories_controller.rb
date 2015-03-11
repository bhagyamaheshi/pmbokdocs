class ActivityCategoriesController < ApplicationController
  before_action :set_activity_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @activity_categories = ActivityCategory.all
    respond_with(@activity_categories)
  end

  def show
    respond_with(@activity_category)
  end

  def new
    @activity_category = ActivityCategory.new
    respond_with(@activity_category)
  end

  def edit
  end

  def create
    @activity_category = ActivityCategory.new(activity_category_params)
    @activity_category.save
    respond_with(@activity_category)
  end

  def update
    @activity_category.update(activity_category_params)
    respond_with(@activity_category)
  end

  def destroy
    @activity_category.destroy
    respond_with(@activity_category)
  end

  private
    def set_activity_category
      @activity_category = ActivityCategory.find(params[:id])
    end

    def activity_category_params
      params.require(:activity_category).permit(:categoryId, :categoryName)
    end
end
