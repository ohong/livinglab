class FixMessagesColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :conversation_references, :conversation_id
    change_column :messages, :conversation_id, :integer
  end
end
