class Transaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :debtor, class_name: "User"
	default_scope -> { order('created_at DESC') }
	validates :debtor_id, presence: true
	validates :amount, presence: true, inclusion: { in: 0.01 ..5000 }
	validates :name, presence: true, length: { maximum: 50 }

end
