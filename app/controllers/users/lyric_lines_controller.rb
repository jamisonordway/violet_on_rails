class Users::LyricLinesController < ApplicationController

  def index
    @lyrics = LyricLine.recently_created
  end
end
