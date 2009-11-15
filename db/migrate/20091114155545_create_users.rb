class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username  
      t.string :email  
      t.string :crypted_password  
      t.string :password_salt  
      t.string :persistence_token
      t.timestamps
    end
    
    username = ask "Enter username:"
    password = ask "Enter password:"
    User.create(:username => username, :password => password, :password_confirmation => password, :email => 'john.doe@somewhere.com')
  end

  def self.down
    drop_table :users
  end
  
  private
  def self.ask(message)
    print message
    STDIN.gets.chomp
  end
end