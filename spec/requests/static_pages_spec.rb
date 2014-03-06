require 'spec_helper'

describe "Static pages" do

	describe "Pagina principal" do

		it "should have the content 'Kedada'" do

			visit '/static_pages/home'
			page.should have_selector('h1', :content => "Kedada")
        end

        it "should have the right title" do
        	visit '/static_pages/home'
        	page.should have_selector('title', :content => 'Kedada | Pagina principal')
        end
         	

    end

    describe "Pagina de ayuda" do

		it "should have the content 'Ayuda'" do

			visit '/static_pages/help'
			page.should have_selector('h1', :content => 'Ayuda')
        end

        it "should have the right title" do
        	visit '/static_pages/help'
        	page.should have_selector('title',
        		             :content => 'Kedada | Ayuda')
        end
        
    end

    describe "Pagina de informacion" do

		it "should have the content 'Sobre nosotros'" do

			visit '/static_pages/about'
			page.should have_selector('h1', :content => 'Sobre nosotros')
        end

        it "should have the right title" do
        	visit '/static_pages/about'
        	page.should have_selector('title',
        		             :content => 'Kedada | Sobre nosotros')
        end
    end

    describe "Pagina de contacto" do

		it "should have the h1 'Contacta'" do

			visit '/static_pages/contact'
			page.should have_selector('h1', :content => 'Contacta')
        end

        it "should have the right title" do
        	visit '/static_pages/contact'
        	page.should have_selector('title',
        		             :content => 'Kedada | Contacta')
        end
    end


end
