class Station
	include InstanceCounter
	attr_accessor :name, :trains, :train
	@@stations = []
	def initialize(name)
		@name = name
		@trains = []
		@train = train
		@@stations << self
		register_instance
	end
	def add_train(train)
		add_train!(train)
	end
	def output_trains
		output_trains!
	end
	def trains_by_type(type)
		trains_by_type!(type)
	end
	def train_dispatch(train)
		train_dispatch!(train)
	end
	#Нет наследования.
	#Ниже перечисленные методы не должны вызываться из клиентского кода
	private
  def add_train!(train)
		@trains.push(train)
		puts "поезд #{train.id} принят"
	end
  def output_trains!
		@trains.each {|train| puts train.id}
	end
	def trains_by_type!(type)
		@trains.each {|train| puts "На станции находятся #{train.id} поезд(а)" if type == type} 
	end
	def train_dispatch!(train)
		@trains.delete(train) if trains.include?(train)
		puts "Отправляется поезд #{train.id}"
	end
	def self.all
		@@stations.each{|station| puts station.name}
	end
end
