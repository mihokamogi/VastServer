class CampaignsController < ApplicationController
  
  def index
    
    unless params[:cuepoint_id]
      
    @campaigns = Campaign.all.page(params[:page]).per(10)
    
    else
    
    @cuepoint = Cuepoint.find(params[:cuepoint_id])
    @campaigns = Campaign.current_available(@cuepoint)
    
    
    
    response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Credentials'] = 'true'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type'
    
    
    end

  end

  def new
    @campaign = Campaign.new
    @cuepoints = Cuepoint.all
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @cuepoints = Cuepoint.all
    
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
    @cuepoints = Cuepoint.all
  end

  def update
    @campaign = Campaign.find(params[:id])
    @cuepoints = Cuepoint.all
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
    
    flash[:success] = "キャンペーンは正常に削除されました。"
    redirect_to root_path
  end

  

  private
  
  def campaign_params
    params.require(:campaign).permit(:id, :name, :start_at, :end_at, :end_at, :limit_start, :movie_url, cuepoint_ids: [])
  end
  
  
end
