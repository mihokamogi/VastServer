class ResultsController < ApplicationController
  
  def index
    @results = Result.all.page(params[:page]).per(10)
  end  
   
  def record
    

      
    send_data(Base64.decode64('R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=='),type: 'image/gif', disposition: 'inline')
  
    end
  end
  
end