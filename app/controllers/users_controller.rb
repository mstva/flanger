class UsersController < Clearance::UsersController

    def create
      @user = user_from_params
  
      if @user.save
        sign_in @user
        redirect_to '/'
      else
        render template: 'users/new'
      end 
    end 
  
    private
  
    def user_from_params
      user_params = params[:user] || Hash.new
      name = user_params.delete(:name)
      username = user_params.delete(:username)
      email = user_params.delete(:email)
      password = user_params.delete(:password)
  
      Clearance.configuration.user_model.new(user_params).tap do |user|
        user.name = name
        user.username = username
        user.email = email
        user.password = password
      end
    end

    def permit_params
      params.require(:user).permit(:username, :name, :email, :password)
    end
  end