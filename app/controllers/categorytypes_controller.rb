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
  end
  def create
    @Categorytype = Categorytype.new(categorytype_params)
      @mode= params[:mode]
      @Categorytype.save
      respond_to do |f|
        f.js 
      end
  end
  private
  def categorytype_params
    if :categorytype.nil?
      params.permit(:name,:mode)
    else
      params.require(:categorytype).permit(:name,:mode)
    end
  end

end