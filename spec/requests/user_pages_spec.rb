require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "Pagina para apuntarse" do
		before { visit signup_path }

		it { should have_selector('h1', content: 'Apuntate') }
		it { should have_selector('title', content: full_title('Apuntate')) }
    
    end
end
