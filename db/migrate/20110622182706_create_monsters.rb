class CreateMonsters < ActiveRecord::Migration
  def self.up
    create_table :monsters do |t|
      t.string :name
      t.integer :lvl
      t.float :hp
      t.float :exp
      t.float :vitality
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :monsters
  end
end
