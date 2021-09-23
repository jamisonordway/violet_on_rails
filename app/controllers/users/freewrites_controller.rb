class Users::FreewritesController < Users::UsersController
  def index
    @freewrites = Freewrite.all_for_user(current_user)
  end

  def show
    @freewrite = Freewrite.find(params[:id])
  end

  def new
    @freewrite = Freewrite.new
  end

  def create
    current_user.freewrites.create(freewrite_params)
    redirect_to freewrites_path
  end

  private

  def freewrite_params
    params.require(:freewrite).permit(:title, :description, :body)
  end
end
