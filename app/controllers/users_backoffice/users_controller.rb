class UsersBackoffice::UsersController < UsersBackofficeController
  before_action :verify_password, only: [:update]
  before_action :set_user, only: [:edit, :update, :destroy]
  
  
  def index
    @users = User.all.order(:id).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to users_backoffice_users_path, notice: "Aluno criado com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(params_user)
      redirect_to users_backoffice_users_path, notice: "Aluno atualizado com sucesso"
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_backoffice_users_path, notice: "Aluno excluído com sucesso"
    else
      render :index
    end
  end

  private

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].extract!(:password, :password_confirmation)
    end
  end
end
