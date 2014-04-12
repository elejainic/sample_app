require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "Pagina para apuntarse" do
		before { visit signup_path }

		it { should have_selector('h1', content: 'Apuntate') }
		it { should have_selector('title', content: full_title('Apuntate')) }
    
    end

    describe "profile page" do
    	let(:user) { FactoryGirl.create(:user) }
	
		before { visit user_path(user) }

		it { should have_selector('h1', content: user.name) }
		it { should have_selector('title', content: user.name) }
	end

	describe "signup" do
		before { visit signup_path }

		let(:submit) { "Crear mi cuenta" }
		describe "with invalid information" do

			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Example User"
				fill_in "Email", with: "user@example.com"
				fill_in "Password", with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end
			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving a user" do

				before { click_button submit}
				
				let(:user) { User.find_by_email("user@example.com")}

				it { should have_selector('title', content: user.name) }
				it { should have_link('Salir')}
			end



		end
	end
end
	
