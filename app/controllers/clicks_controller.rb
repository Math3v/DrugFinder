class ClicksController < ApplicationController
  # To change this template use File | Settings | File Templates.

  def incr_clicks
    Click.find_and_incr_by_id(params[:id])
  end

end