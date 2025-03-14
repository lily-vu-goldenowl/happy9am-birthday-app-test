class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      BirthdayMessageService.schedule(user)
      render json: { message: 'User created successfully', user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      BirthdayMessageService.reschedule(user)
      render json: { message: 'User updated successfully', user: user }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    BirthdayMessageService.cancel(user)
    user.destroy
    render json: { message: 'User deleted successfully' }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :timezone)
  end
end
