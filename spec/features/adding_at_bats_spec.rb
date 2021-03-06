require 'spec_helper'

feature 'adding at bats to the game' do
  scenario 'makes the first at bat show a single' do
    game = new_game_and_lineup
    visit game_path(game.id)
    within('#player_1') do
      click_link 'New AB'
    end
    select( '1', :from => 'Inning')
    select('Single', :from => 'Result')
    select('1', :from => 'Base')
    click_button 'Save'

    within('#player_1') do
      expect(page).to have_content('Single')
    end
  end
end
