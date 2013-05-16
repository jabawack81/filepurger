#########################################################
#							#
# Autore     :	Fabbri Paolo				#
# Descrizione:	un semplice script che confronta	#
#		il contenuto di due file ed elimina	#
#		dal file 2 le righe presenti nel file1	#
#							#
#########################################################

def filetoarray(nomefile)
	a = IO.readlines(nomefile)
	a
end

def askforfile(desc)
	print "nome del " + desc + " file   : "
	file = gets.chop
	if File.exist?(file) == false
		until File.exist?(file) do
			print "file non trovato inserire un nuovo file [" + file + "]  : "
		        file = gets.chop
		end
	end
	file
end

file1 = askforfile("primo")
file2 = askforfile("secondo")
arrayfile1 = filetoarray(file1)
arrayfile2 = filetoarray(file2)
arrayfile1.each do | emailfile1 |
	arrayfile2.delete(emailfile1)
end
#IO.write("purged"+file2,  arrayfile2)
open("purged"+ file2, 'a') { |f|
	arrayfile2.each do | emailfile2 |
		f.puts emailfile2
	end
}
