class CategorytypesController < ApplicationController
  def index
    @Categorytypes = Categorytype.all.paginate(:page => params[:page], :per_page => 10)
  end
  def listtypes
    @Categorytypes = Categorytype.all
    render json: {:Result=>"OK",:Records=>@Categorytypes}
  end
  def searchOrdelete
    
  end
  def new
    @Categorytype = Categorytype.new
    @mode= params[:mode]
    @page = params[:page]
  end
  def create
    @Categorytype = Categorytype.new(categorytype_params)
    @mode= params[:mode]
    @page = params[:page]
    @Categorytype.save
    @Categorytypes = Categorytype.all.paginate(:page => params[:page], :per_page => 10)
    respond_to do |f|
       f.js 
    end
  end
  private
  def categorytype_params
    if :categorytype.nil?
      params.permit(:id,:name,:mode)
    else
      params.require(:categorytype).permit(:id,:name,:mode)
    end
  end

end
