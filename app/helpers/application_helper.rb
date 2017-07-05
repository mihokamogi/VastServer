module ApplicationHelper
  def vast_url(cuepoint)
    request.protocol+ request.host_with_port + cuepoint_campaigns_path(@cuepoint) + ".xml"
  end
end