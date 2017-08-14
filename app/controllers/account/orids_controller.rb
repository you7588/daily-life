class Account::OridsController < ApplicationController
  before_action :authenticate_user!

  def index
    @orids = current_user.orids
  end
end
