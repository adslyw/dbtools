require_relative 'lib/oracle/oracle.rb'
require_relative 'lib/bcv/bcv.rb'
require_relative 'config/bcv.rb'
require_relative 'lib/worker.rb'
connect(@bcv[:host],@bcv[:username],@bcv[:password],@bcv[:servicename])
tableinfo "bf_account_fee_t"
