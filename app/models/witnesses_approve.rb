# See: https://github.com/harpagon210/steemsmartcontracts/wiki/Witnesses-Contract#disapprove
class WitnessesApprove < ContractAction
  belongs_to :trx, class_name: 'Transaction', foreign_key: 'trx_id'
  
  validates_presence_of :trx
  validates_presence_of :witness
end
