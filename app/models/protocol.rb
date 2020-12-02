class Protocol < ApplicationRecord
  validates :nombre, presence: true
  validates :actividades, presence: true
  validates :duracion, presence: true

end
