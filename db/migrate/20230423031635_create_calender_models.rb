class CreateCalenderModels < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :user_type, default: 1, comment: "1:合伙人 2:创业者"
      t.string :name, index: true
      t.datetime :deleted_at

      t.timestamps
    end

    create_table :scopes do |t|
      t.string :scope, comment: "时间段"
      t.datetime :deleted_at

      t.timestamps
    end

    create_table :meetings do |t|
      t.belongs_to :user
      t.date :date, comment: "日期"
      t.belongs_to :scope
      t.integer :status, default: 1, comment: "1:不可预约 2:空闲"
      t.integer :start_user_id, comment: "预约的创业者用户"
      t.string :cancel_user_id, comment: "取消用户"
      t.string :cancel_reason, comment: "取消原因"
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
