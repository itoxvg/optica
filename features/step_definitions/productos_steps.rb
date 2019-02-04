Given('I have populated my inventory with several productos') do
  @productos = create_list :producto, 2
end

When('I am on productos page') do
  visit productos_path
end

Then('I should see productos') do
  expect(page).to have_content @productos
end

When('I click on new producto link') do
  click_link 'crear producto'
end


