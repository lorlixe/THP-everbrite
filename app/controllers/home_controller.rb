class HomeController < ApplicationController
  def index
    @event = Event.all
  end
end
