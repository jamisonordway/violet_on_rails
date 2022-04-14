class Users::SectionsController < Users::UsersController
  def index
    @sections = Section.all_for_user(current_user)
  end

  def new
    @section = Section.new
  end

  def show
    @section = Section.find(params[:id])
  end

  def create
    section = current_user.sections.new(section_params)
    if section.save
      redirect_to section_path(section)
    else
      flash[:error] = section.errors.full_messages
      render :new
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    section = Section.find(params[:id])
    if section.update(section_params)
      redirect_to section_path(section)
    else
      flash[:error] = section.errors.full_messages
    end
  end

  def destroy
    section = Section.find(section_params[:id])
    section.destroy
  end

  def assign_lyrics
    @lyrics = LyricLine.all
  end

  def add_lyrics
    section = Section.find(params[:section_id])
    added_lyrics = params[:lyric][:lines].map do |line|
      if line.present?
        found_lyric = LyricLine.find(line)
        if found_lyric
          found_lyric.update(section: section)
        end
      end
    end
    redirect_to section_path(section)
  end

  private

  def section_params
    params.require(:section).permit(
      :id,
      :song_id,
      :label,
      :section_type,
      :lyrics,
      :stability,
      :created_at,
      :updated_at
    )
  end
end
