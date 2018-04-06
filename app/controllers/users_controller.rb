class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :ensure_admin

  def index
    @users = User.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:admin, :account_status)
    end

    def ensure_admin
      redirect_to root_path unless current_user.try(:admin?)
    end
end
