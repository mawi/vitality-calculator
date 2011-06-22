class Monster < ActiveRecord::Base


before_create :generate_vitality
before_update :generate_vitality


protected

def generate_vitality
  lvl = self.lvl
  hp = self.hp
  exp = self.exp

  
  self.vitality = ((exp.to_f/(lvl**2))*100)/9
end

end
