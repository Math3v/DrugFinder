require 'rspec'

describe 'Search functionality' do

  it 'should find drug ABROTANUM' do
      visit '/drugs/wide_search?q=abrotanum'
      page.should have_content('7')
  end

  it 'should find drug PARALEN' do
    visit '/drugs/wide_search?q=paralen'
    page.should have_content('15')
  end

  it 'should find producer ZENTIVA' do
    visit '/producers/find?producer_name=zentiva'
    page.should have_content('2')
  end

  it 'should find holder BOIRON' do
    visit '/holders/find?name=boiron'
    page.should have_content('1')
  end

  it 'should find supplier BOIRON' do
    visit '/suppliers/find?name=boiron'
    page.should have_content('1')
  end

end