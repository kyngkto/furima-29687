class ApplicationController < ActionController::Base
  befor_action :move_to_index, expect: [:index, :show]

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
