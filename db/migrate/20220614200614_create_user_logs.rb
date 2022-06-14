class CreateUserLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :user_logs do |t|
      t.string :from
      t.string :to
      t.datetime :sign_in_time
      t.datetime :sign_out_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
