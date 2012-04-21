ActiveRecord::Schema.define :version => 0 do

  create_table :resources, :force => true do |t|
    t.column :id, :integer
    t.column :deleted_at, :integer, :default => 0
  end
end
