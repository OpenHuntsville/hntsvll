Sequel.migration do
  up do
    create_table :events do
      primary_key   :id
      DateTime      :created_at
      DateTime      :updated_at
      String        :name
      String        :description
      column :start_datetime, 'timestamp with time zone'
      Integer       :duration
      Boolean       :approved
      Integer       :instance_number
      foreign_key   :parent_id, :events, :null=>true
      foreign_key   :group_id,  :groups, :null=>false
      foreign_key   :venue_id,  :venues, :null=>false
    end
  end

  down do
    drop_table :events
  end
end
