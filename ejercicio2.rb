def cuenta_lineas(file_name)
	File.open(file_name, "r") { |file|  
		file.readlines.count()
	}
end

lineas = cuenta_lineas("peliculas.txt")
puts lineas