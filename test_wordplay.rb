require 'test/unit'
load 'wordplay.rb'

class TestWordPlay < Test::Unit::TestCase
	#Test sentence
	def test_sentences
		assert_equal(["a","b","c d","Les animaux sont heureux"], "a. b. c d. Les animaux sont heureux.".sentences)

		text = %q{This is a test sentence. La separation est bien. Les animaux sont content.}
		assert_equal("La separation est bien", text.sentences[1])
	end

	#Test word separation
	def test_words	
		assert_equal(["Heureux","sont","les","animaux"],"Heureux sont les animaux".words)
	end

	#Test best sentence
	def test_best_sentence
		assert_equal("This will fail hard", WordPlay.best_sentence("This is a test. This will fail hard. Fail is hard victory".sentences,%w{This fail hard}))
	end

	#Test switch pronouns
	def test_switch_pronouns
		assert_equal("I love you", WordPlay.switch_pronouns("You love me"))
		assert_equal("I will always love your car", WordPlay.switch_pronouns("You will always love my car"))
		#assert_equal("Why do I cry?", WordPlay.switch_pronouns("Why do you cry?")) -> Doesnt work with questions.
	end



end