class CreateParties < ActiveRecord::Migration[5.0]
  def self.up
    create_table :parties do |t|
	   t.column :host_name, :string, :null => true, :limit => 255
	   t.column :host_email, :string, :null => true, :limit => 255
	   t.column :guest_names, :text, :null => true
	   t.column :venue, :string, :null => true, :limit => 255
	   t.column :location, :string, :null => true, :limit => 255
	   t.column :theme, :string, :null => true, :limit => 255
	   t.column :numgsts, :integer, :null => true, :default => "0"
	   t.column :descript, :text, :null => true
	   t.column :start_time, :timestamp, :null => true
	   t.column :end_time, :timestamp, :null => true
	end
  end

  def self.down
	drop_table :parties
  end
 end
