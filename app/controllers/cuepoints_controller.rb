class CuepointsController < ApplicationController
  def index
    @cuepoints = Cuepoint.all.page(params[:page])
  end

  def show
  end

  def new
    @cuepoint = Cuepoint.new
  end

  def create
    @cuepoint = Cuepoint.new(cuepoint_params)
    
    if @cuepoint.save
      flash[:success] = "キューポイントを登録しました。"
      redirect_to root_path
    else
      flash[:danger] = "キューポイントの登録に失敗しました。"
      render :new
    end
  end
  

  def edit
  end

  def update
  end

  def destroy
  end


  private
  
  def cuepoint_params
    params.require(:cuepoint).permit(:name)
  end
  
end  


