class Public::PlansController < ApplicationController
  def new
    @plan = Plan.new
  end

  def confirm
    @plan = Plan.new(plan_params)
    @plans = Plan.all
    @plan.user_id = current_user.id
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    @plan.save
    redirect_to plan_path(@plan.id)
  end

  def index
    @plans = Plan.all
    @tags = Plan.tag_count_on()
  end

  def show
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :place_name, :image, :time, :stay_night, :introduction, :tag_list)
  end
end
