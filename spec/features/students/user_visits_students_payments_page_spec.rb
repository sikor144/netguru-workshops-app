require 'spec_helper'

feature 'User visits student payments page'  do
  let!(:student_1) { create :student, last_name: 'Nowakowski' }
  let!(:student_2) { create :student, last_name: 'Mietczyński' }
  let!(:student_payment_1) { create :student_payment, student_id: student_1.id }
  let!(:student_payment_2) { create :student_payment, student_id: student_2.id }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit student_payments_path
  end

  scenario 'should see students payments list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Students » Payments'
    end

    expect(page).to have_content student_1.last_name
    expect(page).to have_content student_2.last_name
  end

  scenario 'only when sign in' do
    logout
    visit student_payments_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
