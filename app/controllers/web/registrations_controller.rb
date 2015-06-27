class Web::RegistrationsController < Web::ApplicationController
  skip_authentication

  def new 
  	@user = User.new
  end

  def create
  	@user = User.new(registration_params)
  	if @user.save
  		sign_in @user
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  private 

  def registration_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end	
end