require 'spec_helper'

describe "Static pages" do

    subject { page }

	describe "Pagina principal" do
        before { visit root_path}

		it {should have_selector('h1', content: 'Kedada')}
        it {should have_selector('title', content: full_title(''))}
        it {should_not have_selector('title', content: "| Pagina principal")}
    end

    describe "Pagina de ayuda" do
        before { visit help_path }

		it {should have_selector('h1', content: 'Ayuda')}
        it {should have_selector('title', content: full_title('Ayuda'))}
        
        
    end

    describe "Pagina de informacion" do
        before { visit about_path }

		it {should have_selector('h1', content: 'Sobre nosotros')}

        it {should have_selector('title', content: full_title('Sobre nosotros'))}
        
    end

    describe "Pagina de contacto" do
        before { visit contact_path }

		it {should have_selector('h1', content: 'Contacta')}

        it {should have_selector('title', content: full_title('Contacta'))}
    end

    it "should have the right links on the layout" do
        visit root_path
        click_link "Sobre nosotros"
        page.should have_selector 'title', content: full_title('Sobre nosotros')
        click_link "Ayuda"
        page.should have_selector 'title', content: full_title('Ayuda')
        click_link "Contacto"
        page.should have_selector 'title', content: full_title('Contacta')
        click_link "Pagina principal"
        click_link "Apuntate ahora!"
        page.should have_selector 'title', content: full_title('Apuntate')
    end


end
