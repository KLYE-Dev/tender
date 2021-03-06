class ContractAction < ApplicationRecord
  self.abstract_class = true
  
  after_commit do |obj|
    trx.add_account(obj.trx.sender)
    trx.add_account(obj.from) if obj.respond_to? :from
    trx.add_account(obj.to) if obj.respond_to? :to
    trx.add_account(obj.recipient) if obj.respond_to? :recipient
    trx.add_symbol(obj.symbol) if obj.respond_to? :symbol
    
    if !!obj.trx.logs
      if !!obj.trx.hydrated_logs['events']
        obj.trx.hydrated_logs['events'].each do |event|
          next if event['data'].nil?
          
          # Most of these will be token events.
          
          trx.add_account(event['data']['account'])
          
          # Most of these will be market events.
          
          trx.add_account(event['data']['from'])
          trx.add_account(event['data']['to'])
          
          # Various events.
          
          trx.add_symbol(event['data']['symbol'])
        end
      end
    end
  end
end
