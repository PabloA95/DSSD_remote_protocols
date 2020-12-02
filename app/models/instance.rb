class Instance < ApplicationRecord
  belongs_to :protocol

  validates :proyecto_id, presence: true

  def set_result(protocol, duracion)
    now=DateTime.now()
    self.fecha_inicio=now
    self.fecha_fin=now+duracion.to_i.minutes
    self.estado="Finalizado"
    self.puntaje=rand(1..10)
    self.protocol=Protocol.find(protocol)
  end

end
