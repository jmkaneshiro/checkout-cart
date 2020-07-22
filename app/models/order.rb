# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string
#
class Order < ApplicationRecord
  enum status: {
    pending: "pending",
    ordered: "ordered",
    cancelled: "cancelled"
  }

  belongs_to :cart,
    foreign_key: :cart_id,
    class_name: :Cart
end
