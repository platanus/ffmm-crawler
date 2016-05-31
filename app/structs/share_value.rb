class ShareValue < Crabfarm::BaseStruct
  has_string :institution
  has_string :run
  has_string :fund
  has_string :serie
  has_string :date
  has_float :value

  def print
    "#{institution}\t#{run}\t#{fund}\t#{serie}\t#{date}\t#{value.to_s}"
  end

end