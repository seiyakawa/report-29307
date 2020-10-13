class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def create
    Report.create(Report_params)
  end


  private
  def Report_params
    params.require(:report).permit(:date, :name, :purpose, :outcome, :action_plan)
  end

end
