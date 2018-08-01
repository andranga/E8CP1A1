def new_index(string1, string2)
	File.open('index.html', "w") { |file| 
		file.puts "
			<!DOCTYPE html>
			<html>
			<head>
				<title>#{string1}</title>
			</head>
			<body>
  				<p> #{string2} </p>
			</body>
			</html>"
	}
	return nil
end

new_index('Hola', 'pianola')

def new_index2(string1, string2, array)
	File.open('index2.html', "w") { |file| 
		file.puts "
			<!DOCTYPE html>
			<html>
			<head>
				<title>#{string1}</title>
			</head>
			<body>
  				<p> #{string2} </p>"
  		if array.length > 0
  			file.puts "<ol>"
  			array.each { |ar|  
  			file.puts "<li>#{ar}</li>"
  			}
  			file.puts " </ol>"
  		end
		file.puts " 
			</body>
			</html>"
	}
	return nil
end

lista=['item1', 'item2', 'item3']
new_index2('Hola', 'pianola', lista)

def new_index3(string1, string2, array, color)
	File.open('index3.html', "w") { |file| 
		file.puts "
			<!DOCTYPE html>
			<html>
			<head>
				<title>#{string1}</title>"
			if color != ''
			file.puts "   
			<style type='text/css'>
			p{
				color: #{color}
			}
			</style>"
		    end
			file.puts " 
			</head>
			<body>
  				<p> #{string2} </p>"
  		if array.length > 0
  			file.puts "<ol>"
  			array.each { |ar|  
  			file.puts "<li>#{ar}</li>"
  			}
  			file.puts " </ol>"
  		end
		file.puts " 
			</body>
			</html>"
	}
	return nil
end

lista=['item1', 'item2', 'item3']
color='red'
new_index3('Hola', 'pianola', lista, color)