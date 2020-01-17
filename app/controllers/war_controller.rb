class WarController < ApplicationController
  def form
    @towns = Town.all
  end
end
