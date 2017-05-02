class FixMessagesColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :conversation_references, :conversation_id
    change_column :messages, :conversation_id, 'integer USING CAST(conversation_id AS integer)'

  end
end
