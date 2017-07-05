module ApplicationHelper
  def vast_url(cuepoint)
    "http://techacademy-mihokamogi.c9users.io:8080" + cuepoint_campaigns_path(@cuepoint) + ".xml"
  end
end