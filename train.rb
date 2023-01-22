class Train
	include InstanceCounter
	include Company

	attr_accessor :wagons, :speed, :station, :route_station, :current_station_index, :type
	attr_reader :id, :route, :wagon

	@@trains = []

	def initialize(id, type)
		@id = id
		@wagons = []
		@speed = 0
		@current_station_index = 0
		@type = type
		@@trains << self
		register_instance

	end

	def self.find(id)
		@@trains.find {|train| train.id == id}
	end

	def speed_up(value)
		speed_up!(value)
	end
	def speed
		speed!
	end
	def stop
		stop!
	end
	def amount_of_wagons
		amount_of_wagons!
	end
	def delete_wagon(wagon)
		delete_wagon!(wagon)
	end
	def add_wagon(wagon)
		add_wagon!(wagon)
	end
	def take_route(route)
		take_route!(route)
	end
	def next_station
		next_station!
	end
	def previous_station
		previous_station!
	end

	#Для данных методов должен быть доступ в подклассах, есть наследование.
	#Ниже перечисленные методы не должны вызываться из клиентского кода, не входят в интерфейс класса.
	protected

	def speed_up!(value)
		@speed += value
		puts "Скорость поезда составляет: #{@speed}"
	end

	def speed!
		puts "Скорость поезда составляет: #{@speed}"
	end

	def stop!
		@speed = 0
		puts "Скорость поезда составляет: #{@speed}"
	end

	def amount_of_wagons!
		puts "количество вагонов: #{wagons.size}"
	end
	
	def delete_wagon!(wagon)
		if @speed.zero? 
			@wagons.delete(wagon)
			puts " Вагон #{wagon.number} отцеплен от поезда"
		else
			puts "Отцепка вагонов может осуществляться только если поезд не движется"
		end
	end
	
	def add_wagon!(wagon)
		if @speed.zero?
			wagons << wagon
			puts " Вагон #{wagon.number} прицеплен к поезду"
		else
			puts "Прицепка вагонов может осуществляться только если поезд не движется"
		end
	end
	
	#Может принимать маршрут следования (объект класса Route). 
	#При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
	def take_route!(route)
		@route = route
		@current_station_index = 0
		puts "Маршрут присвоен"
	end
	
	def next_station!
		if @current_station_index == 0
			@current_station_index == 1
		elsif @current_station_index == 1
			@current_station_index == -1
		else
			puts "This is a last station"
		end
		puts "Вы переместились на станцию #{@route.station[@current_station_index]}"
	end
	
	def previous_station!
		if @current_station_index == -1
			@current_station_index == 1
		elsif @current_station_index == 1
			@current_station_index == 0
		else
			puts "Вы находитесь на первой станции"
		end
		puts "Вы переместились на станцию #{@route.station[@current_station_index]}"
	end
	def find

	end

	
end
