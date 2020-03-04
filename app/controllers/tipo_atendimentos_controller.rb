class TipoAtendimentosController < ApplicationController
  before_action :set_tipo_atendimento, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /tipo_atendimentos
  # GET /tipo_atendimentos.json
  def index
    @tipo_atendimentos = TipoAtendimento.all
  end

  # GET /tipo_atendimentos/1
  # GET /tipo_atendimentos/1.json
  def show
  end

  # GET /tipo_atendimentos/new
  def new
    @tipo_atendimento = TipoAtendimento.new
  end

  # GET /tipo_atendimentos/1/edit
  def edit
  end

  # POST /tipo_atendimentos
  # POST /tipo_atendimentos.json
  def create
    @tipo_atendimento = TipoAtendimento.new(tipo_atendimento_params)

    respond_to do |format|
      if @tipo_atendimento.save
        format.html { redirect_to tipo_atendimentos_path, notice: 'Tipo de atendimento foi criado com sucesso.' }
        format.json { render :index, status: :ok, location: @tipo_atendimento }
      else
        format.html { render :new }
        format.json { render json: @tipo_atendimento.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /tipo_atendimentos/1
  # PATCH/PUT /tipo_atendimentos/1.json
  def update
    respond_to do |format|
      if @tipo_atendimento.update(tipo_atendimento_params)
        format.html { redirect_to tipo_atendimentos_path, notice: 'Tipo de atendimento foi atualizado com sucesso.' }
        format.json { render :index, status: :ok, location: @tipo_atendimento }
      else
        format.html { render :edit }
        format.json { render json: @tipo_atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_atendimentos/1
  # DELETE /tipo_atendimentos/1.json
  def destroy
    @tipo_atendimento.destroy
    respond_to do |format|
      format.html { redirect_to tipo_atendimentos_url, notice: 'Tipo de atendimento foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_atendimento
      @tipo_atendimento = TipoAtendimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_atendimento_params
      params.require(:tipo_atendimento).permit(:descricao)
    end
end
