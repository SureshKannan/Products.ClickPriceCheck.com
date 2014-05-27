class CategoriesController < ApplicationController
  def index
    @page = params[:page]
    if params[:page].nil?
      @page = 1
    else
      if params[:page]==""
        @page = 1
      else
        @page = params[:page]
      end
    end
    if @mode!='search'
      @Categories = Category.all.paginate(:page => @page, :per_page => 10).includes(:categorytype,:parent)
    else
      @Categories=@Categories.paginate(:page=>@page,:per_page=>10).includes(:categorytype,:parent)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def new
    @Category = Category.new
    @Categorytypes = Categorytype.all
    @ParentCategories = Category.all.includes(:categorytype,:parent)
    @mode= params[:mode]
    @page = params[:page]
  end  
  def create
    @mode= params[:mode]
    if params[:btnDelete]
        deleteall
        render "delete"
    elsif params[:btnSearch]
        @mode="search"
        search
        render "search"
    elsif params[:btnClear]
        @mode=""
        redirect_to action: 'index'
    else
      @Category = Category.new(category_params)
      @Category.save
      @page = params[:page]
      @Categories = Category.all.paginate(:page =>@page, :per_page => 10).includes(:categorytype,:parent)
      @ParentCategories = Category.all
      respond_to do |f|
         f.js 
      end
    end        
  end  
   private
  def category_params
    if :category.nil?
      params.permit(:id,:name,:categorytype_id,:category_id,:mode)
    else
      params.require(:category).permit(:id,:name,:categorytype_id,:category_id,:mode)
    end
  end
end
