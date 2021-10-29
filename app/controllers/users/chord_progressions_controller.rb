class Users::ChordProgressionsController < ApplicationController
  def new
    @section = Section.find(params[:section_id])
    @chord_progression = ChordProgression.new
  end

  def create
    section = Section.find(params[:section_id])
    progression = ChordProgression.new(
      section: section,
      description: progression_params[:description],
      content: progression_params[:content]
    )
    if progression.save
      redirect_to section_path(section)
    else
      flash[:alert] = progression.errors.full_messages
    end
  end

  def edit
    @progression = ChordProgression.find(params[:id])
  end

  def update
    progression = ChordProgression.find(params[:id])
    if progression.update(progression_params)
      redirect_to section_path(progression.section.id)
    else
      flash[:alert] = progression.errors.full_messages
    end
  end

  private

  def progression_params
    params.require(:chord_progression).permit(:description, :content)
  end
end
