Dir["./lib/*.rb"].each { |file| require "#{file}" }

Mastermind.run
