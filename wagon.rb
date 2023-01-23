class Wagon
	include Company
	include InstanceCounter
	attr_reader :number
		def initialize(number)
		@number = number
	end
end
