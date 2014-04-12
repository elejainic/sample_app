require 'spec_helper'
describe "Authentication" do
	subject { page }

	describe "signin page" do
		before { visit signin_path }

		it { should have_selector('h1', content: 'Entra') }
		it { should have_selector('title', content: 'Entra') }
	end

	describe "signin" do
		before { visit signin_path }

		describe "with invalid information" do
			before { click_button "Entra" }

			it { should have_selector('title', content: 'Entra') }
			it { should have_selector('div.alert.alert-error', content: 'Invalid') }
		end
	

	  	describe "after visiting another page" do
			before { click_link "Pagina principal" }
			it { should_not have_selector('div.alert.alert-error') }
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email", with: user.email
				fill_in "Password", with: user.password
				click_button "Entra"
			end

			it { should have_selector('title', content: user.name) }
			it { should have_link('Perfil',    href: user_path(user))}
			it { should have_link('Salir',    href: signout_path)}
			it { should_not have_link('Entra',    href: signin_path)}

		

			describe "followed by signout" do
				before { click_link "Salir" }
				it { should have_link('Entra') }
			end
		end
	end
end
