class UsersBackoffice::ExamsController < UsersBackofficeController
    before_action :set_exam, only: [:edit, :update, :destroy]
    
    
    def index
      @exams = Exam.all.order(:id).page(params[:page]).per(10)
    end
  
    def new
      @exam = Exam.new
    end
  
    def create
      @exam = Exam.new(params_exam)
      if @exam.save
        redirect_to admins_backoffice_welcome_index_path, notice: "Exame criado com sucesso"
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @exam.update(params_exam)
        redirect_to users_backoffice_exams_path, notice: "Exame atualizado com sucesso"
      else
        render :edit
      end
    end
  
    def destroy
      if @exam.destroy
        redirect_to users_backoffice_exams_path, notice: "Exame excluído com sucesso"
      else
        render :index
      end
    end
  
    private
  
    def params_exam
      params.require(:exam).permit(:description, :date, :measure)
    end
  
    def set_exam
      @exam = Exam.find(params[:id])
    end
end
