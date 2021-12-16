require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  test 'insert new enigma' do
      first_enigma = Game.new question: 'first question', response:'first response'
      first_enigma.save!
      second_enigma = Game.new question: 'second question', response:'second response'
      second_enigma.save!
      assert_equal(first_enigma, Game.last(2).first)
      assert_equal(second_enigma, Game.all.last)
    end

    test 'updated_at is changed after updating question' do
       game_1 = Game.new question: 'Question 1', response:"Response 1"
       game_1.save!
       first_updated_at = game_1.created_at
       game_2 = Game.new question: 'Question 2', response:"Response 2"
       game_2.save!
       refute_equal(game_2.created_at, first_updated_at)
    end

    test 'edit game' do
      game_1 = Game.new question: 'Question 1', response:"Response 1"
      game_1.save!
      first_question = game_1.question

      Game.update question: 'Question 1 updated', response:"Response 1"

      refute_equal(Game.last.question, first_question)

    end

end
