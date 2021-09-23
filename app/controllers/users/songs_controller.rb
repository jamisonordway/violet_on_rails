class Users::SongsController < Users::UsersController
  def index
    @songs = Song.all_for_user(current_user)
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    song = current_user.songs.new(song_params)
    if song.save
      redirect_to song_path(song)
    else
      flash[:error] = song.errors.full_messages
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def song_params
    params.require(:song).permit(:title, :mood, :message)
  end
end
