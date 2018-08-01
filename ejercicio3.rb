def cuenta_palabras(file_name)
	File.open(file_name, "r") { |file|  
		data=file.readlines.map { |w| w.split(' ') }
		data.inject(0) { |suma, n| suma + n.length }
	}
end

palabras = cuenta_palabras("peliculas.txt")
puts palabras

def cuenta_string(file_name, string)
	suma=0
	File.open(file_name, "r") { |file|  
		data=file.readlines.map { |w| w.split(' ') }
		data.each { |n| n.each {|p| suma+=1 if p==string} }
		return suma
	}
end

busqueda = cuenta_string("peliculas.txt", 'Galaxias.')
puts busqueda