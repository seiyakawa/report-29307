class ReportsController < ApplicationController
  def index
    @reports = Report.includes(:user)
  end

  def new
    @report = Report.new
  end

  def create
    Report.create(Report_params)
  end

  private

  def Report_params
    params.require(:report).permit(:image, :date, :name, :purpose, :outcome, :action_plan).merge(user_id: current_user.id)
  end
end
