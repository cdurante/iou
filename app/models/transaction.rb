class Transaction < ActiveRecord::Base
	belongs_to :collector, class_name: "User"
	belongs_to :debtor, class_name: "User"
	validates :collector_id, presence: true
	validates :debtor_id, presence: true
	validates :amount, presence: true, inclusion: { in: 0.01 ..5000 }
	validates :name, presence: true, length: { maximum: 50 }

end
