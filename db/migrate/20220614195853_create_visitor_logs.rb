class CreateVisitorLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :visitor_logs do |t|
      t.string :name
      t.string :from
      t.string :to
      t.datetime :sign_in_time
      t.datetime :sign_out_time

      t.timestamps
    end
  end
end
