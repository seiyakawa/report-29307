class ReportsController < ApplicationController
  before_action :move_to_login, except: [:index, :show]
  before_action :set_report, only: [:show, :edit, :update]
  def index
    @reports = Report.includes(:user).order('created_at DESC')
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    # バリデーションで問題があれば、保存はされず「投稿画面」に戻る
    if @report.valid?
      @report.save
      redirect_to root_path
    else
      # 保存されなければ、newに戻る
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to root_path
    else
      # 保存されなければ、editに戻る
      render 'edit'
    end
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to root_path
  end

  private

  def report_params
    params.require(:report).permit(:image, :date, :name, :purpose, :outcome, :action_plan, :other).merge(user_id: current_user.id)
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_report
    @report = Report.find(params[:id])
  end

end