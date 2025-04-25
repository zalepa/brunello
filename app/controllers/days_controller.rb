class DaysController < ApplicationController
  before_action :authenticate_user!

  def show
    if params[:id] == 'today'
      params[:id] = Date.today.to_s
    end
    
    @day = params[:id] ? Date.parse(params[:id]) : Date.today
    @blocks = current_user.blocks.order(:order)
    @blocks = @blocks.map do |block|
      {
        block_id: block.id,
        name: block.name,
        tasks: block.tasks.where(scheduled_on: @day).order(:scheduled_on)
      }
    end
  end
end
