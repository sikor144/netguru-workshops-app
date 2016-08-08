require 'spec_helper'

feature 'User edits student' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Abacki' }
  let!(:student_payment) { create :student_payment, student_id: student.id }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit student_payments_path
    find(:xpath, "//a[@title='edit']").click
  end

  scenario 'and checks breadcrumbs presence' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Students » Payments'
    end
  end

  scenario 'with valid input' do
    fill_in 'student_payment_amount', with: 3.45
    click_button 'Update Student payment'
    expect(page).to have_content 'student_payment has been updated!'
  end

  scenario 'with invalid input' do
    fill_in 'student_payment_amount', with: ''
    click_button 'Update Student payment'
    expect(page).to have_content "can't be blank"
  end

end
