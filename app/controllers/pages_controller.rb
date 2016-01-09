class PagesController < ApplicationController
def waiver
  @piercing = Piercing.new
  @tattoo = Tattoo.new
end
end
