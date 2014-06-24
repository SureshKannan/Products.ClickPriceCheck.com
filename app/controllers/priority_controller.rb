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
    
  end
end
