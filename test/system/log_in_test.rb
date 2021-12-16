require "application_system_test_case"

class LogInsTest < ApplicationSystemTestCase

  test 'create a user' do

    visit '/fr/signup'
    fill_in 'Nom', with: 'David'
    fill_in 'Nom de famille', with: 'Framorando'
    fill_in 'Email', with: 'david.framorando-normal@gmail.com'
    fill_in 'Mot de passe', with: 'Test'
    click_on("commit")

    assert_not page.has_content?('Se connecter')

    click_on("openNav")

    assert page.has_content?('Se déconnecter')

  end

  test 'test login' do

    visit '/fr/signup'
    fill_in 'Nom', with: 'David'
    fill_in 'Nom de famille', with: 'Framorando'
    fill_in 'Email', with: 'david.framorando-normal@gmail.com'
    fill_in 'Mot de passe', with: 'Test'
    click_on("commit")

    click_on("openNav")
    click_on("Se déconnecter")

    visit '/fr/login'
    fill_in 'email', with: 'david.framorando-normal@gmail.com'
    fill_in 'password', with: 'Test'
    click_on("commit")

    click_on("openNav")
    assert page.has_content?('Se déconnecter')

  end

  test 'test cannot use twice email address' do

    visit '/fr/signup'
    fill_in 'Nom', with: 'David'
    fill_in 'Nom de famille', with: 'Framorando'
    fill_in 'Email', with: 'david.framorando-normal@gmail.com'
    fill_in 'Mot de passe', with: 'Test'
    click_on("commit")

    click_on("openNav")
    click_on("Se déconnecter")

    visit '/fr/signup'
    fill_in 'Nom', with: 'David'
    fill_in 'Nom de famille', with: 'Framorando'
    fill_in 'Email', with: 'david.framorando-normal@gmail.com'
    fill_in 'Mot de passe', with: 'Test'
    click_on("commit")

    assert page.has_content?('Cet email a déjà été utilisé. Essayer de vous connecter.')

  end

  test 'if email is blank -> display error' do

    visit '/fr/signup'
    click_on("commit")

    assert page.has_content?("L'email ne peut pas être vide.")

  end

  test 'if password is blank -> display error' do

    visit '/fr/signup'
    click_on("commit")

    assert page.has_content?("Le mot de passe ne peut pas être vide.")

  end

end
