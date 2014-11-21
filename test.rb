require_relative 'lib/oracle/oracle.rb'
require_relative 'config/bcv.rb'

connect(@bcv[:host],@bcv[:username],@bcv[:password],@bcv[:servicename])
