class PlansController < ApplicationController
  
  def new
  	@plan = Plan.new
  end

  def create
  	redirect_to complete_path
  end
end
