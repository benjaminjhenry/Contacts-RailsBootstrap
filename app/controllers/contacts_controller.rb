class ContactsController < ApplicationController
    before_action :require_user_logged_in!

    def index
        @currentuserid = Current.user.id
        @contactall = Contact.all.order(params[:sort])
        #@contactall = Contact.find_by(user_id: @currentuserid)
        render :index
    end

    def new
        @contact = Contact.new
        @currentuserid = Current.user.id
    end
    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            redirect_to contact_path, notice: "Contact Create Successfully"        
        else
            render :new
        end
    end

    def edit
        @currentuserid = Current.user.id

        @contactEditID = params[:contactID]
        @contact = Contact.find_by(id: @contactEditID)
    end

    def update
        @currentuserid = Current.user.id

        @contactEditID = params[:contactID]
        @contact = Contact.find_by(id: @contactEditID)
        if @contact.update(contact_params)
            redirect_to contact_path, notice: "Contact Updated"
        else
            redirect_to contact_edit_path(contactID: @contactEditID), notice: "Contact Not Updated"
        end
    end

    def delete
        @contactEditID = params[:contactID]
        @contact = Contact.find_by(id: @contactEditID)
        if @contact.destroy()
            redirect_to contact_path, notice: "Contact Deleted"
        else
            redirect_to contact_path, notice: "Contact Not Deleted"
        end
    end

    def export
        @currentuserid = Current.user.id
        require 'csv' 
        file = "#{Rails.root}/public/contact_data.csv"
        #contactall = Contact.find_by(user_id: @currentuserid)
        contactall = Contact.all
        #products = Product.order(:first_name)
        headers = ["Title", "First", "Middle", "Last", "Mobile", "Home", "Email", "Address", "City", "State", "Zip", "Country", "Company", "Birthdate", "Notes"]
        CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
            contactall.each do |contact| 
                if contact.user_id == @currentuserid 
                    writer << [contact.title, contact.firstname, contact.middlename, contact.lastname, contact.mobilephone, contact.homephone, contact.email, contact.address, contact.city, contact.state, contact.zipcode, contact.country, contact.company, contact.birthday, contact.notes] 
                end
            end
        end
        redirect_to contact_path, notice: "Export should be at {Rails.root}/public/contact_data.csv"
    end

    private
    def contact_params
        params.fetch(:contact, {}).permit(:user_id, :title, :firstname, :middlename, :lastname, :mobilephone, :homephone, :email, :address, :city, :state, :zipcode, :country, :company, :birthday, :notes)
    end
    
end