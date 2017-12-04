class UsersController < ApplicationController

  def show
    current_user = nil
    redirect_to '/'
  end

end
