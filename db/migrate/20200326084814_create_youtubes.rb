class CreateYoutubes < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubes do |t|
      t.string :channel_name
      t.string :channel_id

      t.timestamps
    end
  end
end
