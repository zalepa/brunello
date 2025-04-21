class DaysController < ApplicationController
  before_action :authenticate_user!

  def show
    @day = Date.today
    @blocks = current_user.blocks.order(:order)
    @blocks = @blocks.map do |block|
      {
        name: block.name,
        tasks: block.tasks.where(scheduled_on: @day).order(:scheduled_on)
      }
    end
  end
end
