class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all.page(params[:page]).per(10)
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    
    if @campaign.save
      flash[:success] = "キャンペーンを登録しました。"
      redirect_to root_path
    else
      flash[:danger] = "キャンペーンの登録に失敗しました。"
      render :new
    end
  end
  
  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    
    if@campaign.update(campaign_params)
      flash[:success] = "キャンペーンは正常に更新されました。"
      redirect_to root_path
    else
      flash.now[:danger] = "キャンペーンは更新されませんでした。"
      render :edit
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    
    flash[:success] = "キューポイントは正常に削除されました。"
    redirect_to root_path
  end


  private
  
  def campaign_params
    params.require(:campaign).permit(:name, :start_at, :end_at, :end_at, :limit_start, :movie_utl)
    params.require(:cuepoint).permit(:name)
  end
  
end
