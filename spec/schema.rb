
ActiveRecord::Schema.define(:version => 1) do
  create_table :users, :force => true do |t|
    t.column :full_name, :string
    t.column :email, :string
    t.column :amount, :decimal, :precision => 10, :scale => 2
  end

  create_table :articles, :force => true do |t|
    t.column :title, :string
    t.column :content, :string
    t.references :person
  end

  create_table :vehicles, :force => true do |t|
    t.integer :year
    t.string  :model
    t.string  :make
    t.references :person
  end
end

