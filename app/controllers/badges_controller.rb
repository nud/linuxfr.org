# encoding: UTF-8
class BadgesController < ApplicationController
  before_filter :authenticate_account!, :only => [:index]
  before_filter :amr_required,          :only => [:index]

  def index
    send_data Badge.to_csv
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new params[:badge]
    if @badge.save
      render :created
    else
      render :new
    end
  end
end
