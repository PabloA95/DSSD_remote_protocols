class InstancesController < ApplicationController
  before_action :set_instance, only: [:status]

  # POST /execute
  def execute
    @instance = Instance.new(instance_params)
    if Protocol.exists?(params[:protocol])
      @instance.set_result params[:protocol],(params[:duracion]==nil)?1:params[:duracion]
      if @instance.save
        render json: @instance, :except =>  [:created_at,:updated_at,:estado,:puntaje,:fecha_fin]
      else
        render json: @instance.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "El protocolo no existe", codigo:606}
    end

  end

  # GET /status/:id
  def status
    if (DateTime.now() >= @instance.fecha_fin)
      render json: @instance, :except =>  [:created_at,:updated_at]
    else
      render json: { estado: 'Running' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance
      @instance = Instance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def instance_params
      params.permit(:proyecto_id)
    end

    #fecha_inicio fecha_fin estado puntaje proyecto_id protocol

end
