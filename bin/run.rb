require_relative '../config/environment'
require_relative '../lib/api_communicator.rb'
require 'dotenv'
Dotenv.load
command = LogicCommand.new
command.run
