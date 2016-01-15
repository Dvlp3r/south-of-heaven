class PagesController < ApplicationController
  def waiver
    @piercing = Piercing.new
    @tattoo = Tattoo.new
  end

  def index
    flash.keep(:success)
  end
end
