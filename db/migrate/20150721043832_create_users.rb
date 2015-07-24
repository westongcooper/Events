class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :nickname, null: false
      t.string :info
      t.string :password_digest
      t.text :bio
      t.timestamps null: false
    end
    create_table :events do |t|
      t.belongs_to :venue, index: true
      t.string :name, null: false
      t.text :description
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.timestamps null: false
    end
    create_table :attendances do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true
      t.boolean :admin, default: false
      t.timestamps null: false
    end
    create_table :venues do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false
      t.string :info
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip
      t.timestamps null: false
    end
  end
end
