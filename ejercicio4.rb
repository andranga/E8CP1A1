file_name = 'inventario.txt'
data=[]
File.open(file_name, "r") { |file|  
		data=file.readlines.map { |w| w.chomp.split(', ') }
	}

opcion=0
while opcion != 6
	puts '1. Ver productos existentes.'
	puts '2. Consultar stock de producto.'
	puts '3. Ver productos no registrados x bodega.'
	puts '4. Ver stock productos menor a umbral'
	puts '5. Registrar nuevo producto'
	puts '6. Salir'
	opcion = gets.chomp.to_i
	if opcion == 1
		menu1='0'
		while menu1 != 'd'
			puts 'a) Ver existencia por productos'
			puts 'b) Ver existencia total por tienda'
			puts 'c) Ver existencia total todas las tiendas'
			puts 'd) Volver al menú principal'
			menu1=gets.chomp
			if menu1 == 'a'
				suma={}
				data.each { |x| suma.merge!({x[0] => x[1].to_i+x[2].to_i+x[3].to_i}) }
				puts suma
			elsif menu1 == 'b'
				suma_t1=data.inject(0) { |sum_p, x| sum_p + x[1].to_i }
				puts "Hay #{suma_t1} unidades en tienda 1"
				suma_t2=data.inject(0) { |sum_p, x| sum_p + x[2].to_i }
				puts "Hay #{suma_t2} unidades en tienda 2"
				suma_t3=data.inject(0) { |sum_p, x| sum_p + x[3].to_i }
				puts "Hay #{suma_t3} unidades en tienda 3"
			elsif menu1 == 'c'
				suma_t1=data.inject(0) { |sum_p, x| sum_p + x[1].to_i }
				suma_t2=data.inject(0) { |sum_p, x| sum_p + x[2].to_i }
				suma_t3=data.inject(0) { |sum_p, x| sum_p + x[3].to_i }
				suma_tot=suma_t1+suma_t2+suma_t3
				puts "Hay #{suma_tot} unidades en total todas las tiendas"
			elsif menu1 == 'd'
				puts 'Retorno'
			else
				puts 'Ingrese una opción válida!'
			end
		end
	elsif opcion == 2
		puts 'Ingrese nombre producto consultar:'
		producto = gets.chomp
		suma={}
		data.each { |x| suma.merge!({x[0] => x[1].to_i+x[2].to_i+x[3].to_i}) }
		puts "Hay #{suma[producto]} unidades del #{producto}"
	elsif opcion == 3
		unregister_t1={}
		unregister_t2={}
		unregister_t3={}
		data.each { |x| unregister_t1.merge!({x[0] => x[1]}) }
		data.each { |x| unregister_t2.merge!({x[0] => x[2]}) }
		data.each { |x| unregister_t3.merge!({x[0] => x[3]}) }
		unregister_t1.select {|x,y| puts "Producto #{x} no registrado en tienda 1" if y=='NR'}
		unregister_t2.select {|x,y| puts "Producto #{x} no registrado en tienda 2" if y=='NR'}
		unregister_t3.select {|x,y| puts "Producto #{x} no registrado en tienda 3" if y=='NR'}
	elsif opcion == 4
		puts 'Ingrese umbral para consultar productos bajo stock:'
		umbral = gets.chomp.to_i
		suma={}
		data.each { |x| suma.merge!({x[0] => x[1].to_i+x[2].to_i+x[3].to_i}) }
		puts "Los siguientes productos no alcanzan el umbral #{umbral}:"
		escasos= suma.select {|x,y| y<umbral} 
		puts escasos
	elsif opcion == 5
		puts 'Ingrese nombre de nuevo producto:'
		nuevo_prod = gets.chomp
		puts 'Ingrese stock en tienda 1:'
		tienda1 = gets.chomp.to_i
		puts 'Ingrese stock en tienda 2:'
		tienda2 = gets.chomp.to_i
		puts 'Ingrese stock en tienda 3:'
		tienda3 = gets.chomp.to_i
		max_prod=data.length
		data[max_prod] = [nuevo_prod, tienda1, tienda2, tienda3]
		puts data
		File.open(file_name, "a") { |file|  
			file.puts "#{nuevo_prod}, #{tienda1}, #{tienda2}, #{tienda3}\n"
		}
	elsif opcion == 6
		puts 'Good Bye'
	else
		puts 'Favor asegurese de elegir una opción válida!'
	end
end
