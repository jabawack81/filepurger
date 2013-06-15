#########################################################
#							#
# Author     :	Jabawack81				#
# Descrizione:	A ruby script to compare two file	#
#		and delete from one file the lines	#
#		already present in the other file	#
#							#
#########################################################

def filetoarray(nomefile)
#	IO.readlines(nomefile)
	a = Array.new
	File.open(nomefile, mode="rt").each do |line|
		a << line.gsub!(/\s+/, '').downcase
	end
#	puts  nomefile
#	puts a
	a
end

def askforfile(desc)
	print "nome del " + desc + " file   (exit per uscire): "
	file = gets.chop
	if file == "exit"
		exit
	end
	if File.exist?(file) == false
		until File.exist?(file) do
			print "file non trovato inserire un nuovo file [" + file + "]  (exit per uscire): "
		        file = gets.chop
			if file == "exit"
				exit
			end
		end
	end
	file
end

file1 = askforfile("primo")
file2 = askforfile("secondo")
arrayfile1 = filetoarray(file1)
arrayfile2 = filetoarray(file2)
c = 1
arrayfile1.each do | linefile1 |
	arrayfile2.delete(linefile1)
	if c%100==0
		print "."
	end
	c = c+1
end
puts "finito"
#IO.write("purged"+file2,  arrayfile2)
open("purged"+ file2, 'w') do |f|
	arrayfile2.each do | linefile2 |
		f.puts linefile2
	end
end
