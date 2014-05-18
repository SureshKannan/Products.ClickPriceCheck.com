class CategorytypesController < ApplicationController
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
      @Categorytypes = Categorytype.all.paginate(:page => @page, :per_page => 10)
    else
      @Categorytypes=@Categorytypes.paginate(:page=>@page,:per_page=>10)
    end
    respond_to do |format|
      format.html
      format.js
    end    
  end
  def edit
    @Categorytype = Categorytype.find(params[:id])
    @mode = params[:mode]
    render "new"
  end
  def update
    @Categorytype = Categorytype.find(params[:id])
    @mode= params[:mode]
    @Categorytype.update(categorytype_params)
    respond_to do |f|
      f.js {render "create"}
    end
  end
    
  def listtypes
    @Categorytypes = Categorytype.all
    render json: {:Result=>"OK",:Records=>@Categorytypes}
  end
  def new
    @Categorytype = Categorytype.new
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
      @Categorytype = Categorytype.new(categorytype_params)
      @Categorytype.save
      @page = params[:page]
      @Categorytypes = Categorytype.all.paginate(:page =>@page, :per_page => 10)
      respond_to do |f|
         f.js 
      end
    end        
  end
  def deleteall
    @Cattypes= params[:ps] 
    @Cattypes.each { |f| 
      @Cattype = Categorytype.find(f)
      if (@Cattype)
      @Cattype.destroy
      end
     }
    @page = params[:page]
    @Categorytypes = Categorytype.all.paginate(:page =>@page, :per_page => 10)   
  end
  def delete
    @Cattype = Categorytype.find(params[:id])
    if (@Cattype)
      @Cattype.destroy
    end
    
    # @Cattypes= params[:ps] 
    # @Cattypes.each { |f| 
      # @Cattype = Categorytype.find(f)
      # if (@Cattype)
      # @Cattype.destroy
      # end
     # }
    @page = params[:page]
    @Categorytypes = Categorytype.all.paginate(:page =>@page, :per_page => 10)   
  end
  def search    
    if (!params[:txtName].nil? and params[:txtName]!='')
     
      @Categorytypes = Categorytype.where("name like ?",'%' + params[:txtName] + '%')
      @page = params[:page]
      @Categorytypes = @Categorytypes.paginate(:page=>1,:per_page=>@Categorytypes.count)
    else
      @Categorytypes = Categorytype.all.paginate(:page=>@page,:per_page=>@Categorytypes.count)
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