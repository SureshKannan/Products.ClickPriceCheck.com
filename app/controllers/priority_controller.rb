class PriorityController < ApplicationController
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
      @priorities = Priority.all.paginate(:page => @page, :per_page => 10)
    else
      @priorities=@priorities.paginate(:page=>@page,:per_page=>10)
    end
    respond_to do |format|
      format.html
      format.js
    end       
  end
  def edit
    
  end
  def new
    @priority = Priority.new
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
      @priority = Priority.new(priority_params)
      @priority.save
      @page = params[:page]
      @priorities = Priority.all.paginate(:page =>@page, :per_page => 10)
      respond_to do |f|
         f.js 
      end
    end        
  end
  
  private
  def priority_params
      params.require(:priority).permit(:id,:name,:mode)
  end
end
