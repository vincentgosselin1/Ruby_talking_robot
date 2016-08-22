class WordPlay
	def self.best_sentence(sentences, desired_words)
		#every desired word is downcase.
		desired_words = desired_words.each {|w| w.downcase}

		#difference in lengths between the word array and the word array without the 
		#desired words ranked in order of lengths. Latest sentence in the array is the one containing
		#the most desired words.
		ranked_sentences = sentences.sort do |s|
			s.downcase.words.length - (s.downcase.words - desired_words).length
		end

		ranked_sentences.last
	end

	def self.switch_pronouns(text)
		text.gsub(/\b(I am|You are|I|You|Me|Your|My)\b/i) do |pronoun|
			case pronoun.downcase
			when "i"
				"you"
			when "you"
				"me"
			when "me"
				"you"
			when "i am"
				"you are"
			when "you are"
				"i am"
			when "your"
				"my"
			when "my"
				"your"
			end
		end.sub(/^\b(me)\b/i,"I")
	end	

end

class String
	def sentences
		self.chop.split(/\.\s*/)
	end
	def words
		self.split(/\s|\./)
	end
end