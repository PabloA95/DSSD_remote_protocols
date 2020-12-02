class ProtocolsController < ApplicationController
  before_action :set_protocol, only: [:show]

  # GET /protocols
  def index
    @protocols = Protocol.all
    render json: @protocols
  end

  # GET /protocols/1
  def show
    render json: @protocol
  end

  # POST /protocols
  def create
    @protocol = Protocol.new(protocol_params)

    if @protocol.save
      render json: @protocol, status: :created, location: @protocols
    else
      render json: @protocol.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_protocol
      if Protocol.exists?(params[:id])
        @protocol = Protocol.find(params[:id])
      else
        render json: { error: 'No se encontro un protocolo con ese id', codigo: 808 }
      end
    end

    # Only allow a trusted parameter "white list" through.
    def protocol_params
      params.permit(:nombre, :actividades, :duracion)
    end

end
