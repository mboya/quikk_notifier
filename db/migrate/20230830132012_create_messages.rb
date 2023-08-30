class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.string :contact
      t.string :mode
      t.string :message
      t.integer :retries
      t.jsonb :provider_feedback
      t.boolean :active, default: true

      t.timestamps
    end

    execute <<-SQL
      alter table messages alter column retries set default 0;
      alter table messages add constraint retries check (retries >= 0);
    SQL

    add_index :messages, %i[contact mode active]
  end
end
