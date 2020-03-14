class HorariosController < ApplicationController
  before_action :set_horario, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroy]

  # GET /horarios
  # GET /horarios.json
  def index
    if current_user.adm && params[:horarios].present?
      @horarios = Horario.all.order('data desc')
      @todosHorarios = true
    else
      @horarios = Horario.where(user_id: current_user.id).order('data desc')
      @todosHorarios = false
    end
  end

  # GET /horarios/1
  # GET /horarios/1.json
  def show
  end

  # GET /horarios/new
  def new
    @horario = Horario.new
  end

  # GET /horarios/1/edit
  def edit
  end

  # POST /horarios
  # POST /horarios.json
  def create
    
    @horario = Horario.new
    @horario.user_id = current_user.id if params[:new_record].present?
    @horario.update(horario_params)

    respond_to do |format|
      if @horario.save
        format.html { redirect_to current_user.adm ? horarios_path(horarios: "all") : horarios_path, notice: 'Horário foi criado com sucesso.' }
        format.json { render :index, status: :created, location: @horario }
      else
        format.html { render :new }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horarios/1
  # PATCH/PUT /horarios/1.json
  def update
    respond_to do |format|
      if @horario.update(horario_params)
        format.html { redirect_to current_user.adm ? horarios_path(horarios: "all") : horarios_path, notice: 'Horario foi atualizado com sucesso.' }
        format.json { render :index, status: :ok, location: @horario }
      else
        format.html { render :edit }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horarios/1
  # DELETE /horarios/1.json
  def destroy
    @horario.destroy
    respond_to do |format|
      format.html { redirect_to current_user.adm ? horarios_path(horarios: "all") : horarios_path, notice: 'Horário foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario
      @horario = Horario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def horario_params
      params.require(:horario).permit(:data, :entrada1, :saida1, :entrada2, :saida2, :user_id)
    end
end
