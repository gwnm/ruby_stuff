def substrings(string, array)
	answer = {}

	array.each do |word|
		string.downcase.split(" ").each do |string_word|
			if string_word.include? word
				answer[word] = answer[word].to_i + 1
			end
		end
	end

	puts answer
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)