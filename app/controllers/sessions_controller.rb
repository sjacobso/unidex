class SessionsController < ApplicationController
  def new
  	
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
<<<<<<< HEAD
  		
        log_in user
  		  params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		  redirect_back_or user

=======
  		# if user.activated?
        log_in user
  		  params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		  redirect_back_or user
  	# else
   #    message = "Account not activated. "
   #    message += "Check your email for the activation link."
   #    flash[:warning] = message
   #    redirect_to root_url
  	# end
>>>>>>> f90e4ab132ce9ec5499a2c69b9ebface05354f51
  else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
  end
  

  def destroy
  log_out if logged_in?
  redirect_to root_url
  end
end
end
