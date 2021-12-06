require "application_system_test_case"

class LogInsTest < ApplicationSystemTestCase

  test 'create a user' do

    visit new_user_path
    fill_in 'Prénom', with: 'David'
    fill_in 'Nom de famille', with: 'Framorando'
    fill_in 'Email', with: 'david.framorando-normal@gmail.com'
    fill_in 'Mot de passe', with: 'Test'
    click_on("commit")

    assert_not page.has_content?('Se connecter')
    assert page.has_content?('logout')

  end

  test 'test login' do

    visit new_user_path
    fill_in 'Prénom', with: 'David'
    fill_in 'Nom de famille', with: 'Framorando'
    fill_in 'Email', with: 'david.framorando-normal@gmail.com'
    fill_in 'Mot de passe', with: 'Test'
    click_on("commit")
    click_on("logout")

    visit new_session_path
    fill_in 'email', with: 'david.framorando-normal@gmail.com'
    fill_in 'password', with: 'Test'
    click_on("commit")
    
    assert page.has_content?('logout')

  end

  test 'test cannot use twice email address' do

    visit new_user_path
    fill_in 'Prénom', with: 'David'
    fill_in 'Nom de famille', with: 'Framorando'
    fill_in 'Email', with: 'david.framorando-normal@gmail.com'
    fill_in 'Mot de passe', with: 'Test'
    click_on("commit")
    click_on("logout")

    visit new_user_path
    fill_in 'Prénom', with: 'David'
    fill_in 'Nom de famille', with: 'Framorando'
    fill_in 'Email', with: 'david.framorando-normal@gmail.com'
    fill_in 'Mot de passe', with: 'Test'
    click_on("commit")

    assert page.has_content?('Email has already been taken')

  end

  test 'test email and password cannot be blank' do

    visit new_user_path
    click_on("commit")

    assert page.has_content?("Password can't be blank")
    assert page.has_content?("Email can't be blank")

  end

end
