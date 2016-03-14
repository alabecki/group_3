class AddTwitterNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_name, :string
    def twitter_default
      if @user.twitter_name == nil
        @user.twitter_name = 'R_encounters'
      end
    end
  end
end
