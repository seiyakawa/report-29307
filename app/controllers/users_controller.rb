class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @reports = user.reports.order('created_at DESC')
  end
end
