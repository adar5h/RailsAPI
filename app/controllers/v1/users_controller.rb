class V1::UsersController < ApplicationController

  before_action :search_user, only: [:show, :destroy, :update]
  skip_before_action :verify_authenticity_token

  def index
    if params[:user_id].present?
      @users = User.where(user_id: params[:user_id])
    else
      @users = User.all
    end
    #Searching
    #  if params[:var].present?
    #   @users = @users.where('name LIKE ?', '%' + params[:var] + '%')
    #  end

    if params[:name].present?
      @users = @users.where('name LIKE ?', '%' + params[:name] + '%')
     end

    #Sorting
    # @users.order("name ASC")
                            #UserDefinedMethod || The DefaultCase
     @users = @users.order(" #{params[:method] || 'name' } #{params[:sort_by] || 'ASC' }")


    #Pagination
     #rails 5 => @users.page(params[:page]).per(params[:per])

    #rails 7
     @users = @users.offset(params[:page]).limit(params[:per])

    render json: @users, only: [:name, :age, :hobby],
    status: :ok
  end

  def show
    # @user = User.find_by(id: params[:name]) #find gives exception at run-time whereas find_by returns nil if it doesn't find anything
    if @user.present?
      render json: @user,
      status: :ok
    else
      render json: {Message: "User not found"}, status: 404
    end
  end

  def create
    @user = User.create(user_params) # Strong parameters
    # puts @user.save
    render json: @user, status: :created
  end

  def update
    if @user.update(user_params)
      render json: {message: "User updated successfully"},
      status: 200
    else
      render json: {message: "User not updated!"},
      status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: {Message: "User deleted successfully"},
      status: 200
    else
      render json: {Message: "User not deleted!"},
      status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :hobby)
  end

  def search_user
    @user = User.find_by(id: params[:id])
    if @user.blank?
      render json: "User not present", status: 404
    end
  end

end
