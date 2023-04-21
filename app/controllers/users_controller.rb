class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:user, :nickname, :email)

    User.create(user_params)

    redirect_to root_path, notice: 'Вы успешно заригистрировались!'
  end
end
