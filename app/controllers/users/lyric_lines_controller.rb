class Users::LyricLinesController < ApplicationController

  def index
    @lyrics = LyricLine.recently_created
  end

  def new
    @existing = LyricLine.all
    @lyric_line = LyricLine.new
  end

  def create
    LyricLine.create(lyric_line_params)
    redirect_to new_lyric_line_path
  end

  private

  def lyric_line_params
    params.require(:lyric_line).permit(:content, :stability)
  end
end
