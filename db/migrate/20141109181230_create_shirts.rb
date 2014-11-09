class CreateShirts < ActiveRecord::Migration
  def change
    create_table :shirts do |t|

      t.string :name
      t.float  :length
      t.float  :sleeve
      t.float  :chest
      t.belongs_to :user

      t.timestamps
    end
  end
end
