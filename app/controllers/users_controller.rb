class UsersController < ApplicationController
  before_action :set_user, only: [:login]

  # 用户首页交互页面
  def index
  end

  def login
    if @user.present?
      if @user.user_type != params[:type].to_i
        return render json: { error: "请以第一次选定的用户类型进入" }, status: :unprocessable_entity
      end

      respond_to do |format|
        format.html { redirect_to meeting_users_path }
      end
    else
      @user = User.new({user_type: params[:type], name: params[:name], phone: params[:phone]})
      respond_to do |format|
        if @user.save
          format.html { redirect_to meeting_users_path }
        else
          format.html { render :ok }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # 预约日历页面
  def meeting
    @meetings = Meeting.all
  end

  private

  def set_user
    @user = User.find_by(name: params[:name], phone: params[:phone])
  end
end
