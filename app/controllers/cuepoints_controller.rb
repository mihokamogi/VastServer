class CuepointsController < ApplicationController
  def index
    @cuepoints = Cuepoint.all.page(params[:page]).per(10)
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
    @cuepoint = Cuepoint.find(params[:id])
  end

  def update
    @cuepoint = Cuepoint.find(params[:id])
    
    if@cuepoint.update(cuepoint_params)
      flash[:success] = "キューポイントは正常に更新されました。"
      redirect_to cuepoints_path
    else
      flash.now[:danger] = "キューポイントは更新されませんでした。"
      render :edit
    end
  end

  def destroy
    @cuepoint = Cuepoint.find(params[:id])
    @cuepoint.destroy
    
    flash[:success] = "キューポイントは正常に削除されました。"
    redirect_to cuepoints_path
  end


  private
  
  def cuepoint_params
    params.require(:cuepoint).permit(:name)
  end
  
end  


