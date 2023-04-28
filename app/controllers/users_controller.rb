class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:user, :nickname, :email, :password)

    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Вы успешно заригистрировались!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы регистрации'

      render :new
    end
  end
end
