class ReportsController < ApplicationController
  def index
    @reports = Report.includes(:user)
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
   #バリデーションで問題があれば、保存はされず「投稿画面」に戻る
    if @report.valid?
      @report.save
      redirect_to root_path
    else
      #保存されなければ、newに戻る
      render 'new'
    end
  end

  private

  def report_params
    params.require(:report).permit(:image, :date, :name, :purpose, :outcome, :action_plan, :other).merge(user_id: current_user.id)
  end
end
