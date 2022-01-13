require "application_system_test_case"

class GameTest < ApplicationSystemTestCase

  test 'test game display no question' do

    visit '/fr/games/'

    assert page.has_content?("Aucune énigme n'est disponible pour le moment!")

  end

  test 'proposed to login if not registered' do

    game = Game.new
    game.question = 'This is a test88'
    game.response = 'Test'
    game.type_of_question = 1
    game.is_display = true
    game.save!

    visit '/fr/games/'

    fill_in 'game_response', with: 'Test'
    click_on("commit")

    assert page.has_content?('Se connecter')

  end

  test 'test game display with a question' do

    game = Game.new
    game.question = 'This is a test'
    game.response = 'Test'
    game.type_of_question = 1
    game.is_display = true
    game.save!

    visit '/fr/games/'

    fill_in 'game_response', with: 'shshd'
    click_on("commit")

    assert page.has_content?('This is a test')

  end

  test 'test wrong response' do

    game = Game.new
    game.question = 'This is a test'
    game.response = 'Test'
    game.type_of_question = 1
    game.is_display = true
    game.save!

    visit '/fr/signup'
    fill_in 'Nom', with: 'David'
    fill_in 'Nom de famille', with: 'Framorando'
    fill_in "Nom d'utilisateur", with: 'framoran'
    fill_in 'Email', with: 'david.framorando-normal@gmail.com'
    fill_in 'Mot de passe', with: 'Test'
    click_on("commit")

    visit '/fr/games/'

    fill_in 'game_response',   with: "wrong_resp88"  #locate text field by id attribute

    click_on("commit")

    assert page.has_content?('Essayez encore !')

  end

  test 'test correct response' do

    game = Game.new
    game.question = 'This is a test'
    game.response = 'Test'
    game.type_of_question = 1
    game.is_display = true
    game.save!

    visit '/fr/signup'
    fill_in 'Nom', with: 'David'
    fill_in 'Nom de famille', with: 'Framorando'
    fill_in "Nom d'utilisateur", with: 'framoran'
    fill_in 'Email', with: 'david.framorando-normal@gmail.com'
    fill_in 'Mot de passe', with: 'Test'
    click_on("commit")

    visit '/fr/games/'

    fill_in 'game_response',   with: "Test"  #locate text field by id attribute

    click_on("commit")

    assert page.has_content?('Félicitations! Vous avez trouvé la bonne réponse !')

  end

end
