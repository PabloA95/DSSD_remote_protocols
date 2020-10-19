class Instance < ApplicationRecord
  belongs_to :protocol

  def set_result protocol
    now=DateTime.now()
    self.fecha_inicio=now
    self.fecha_fin=now+1.minutes
    self.estado="Finalizado"
    self.puntaje=rand(1..10)
    self.protocol=Protocol.find(protocol)
  end

end
