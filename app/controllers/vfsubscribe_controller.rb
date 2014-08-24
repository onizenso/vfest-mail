class VfsubscribeController < ApplicationController
  def index
  end
 
  ## FIX: error with subscribe function and api.mailchimp.com, 
  ##      possibly need new/correct List ID
  def subscribe
    email = params[:email][:address]
         
    if !email.blank?
      begin
        @vfmc.lists.subscribe(@vf_list_id, {'email' => email})
        respond_to do |format| 
          format.json{render :json => {:message => "Success! Check your email to confirm sign up."}}
        end
       
      rescue Mailchimp::ListAlreadySubscribedError
        respond_to do |format|
          format.json{render :json => {:message => "There is an error. Please enter valid email id."}}
        end
       
      rescue Mailchimp::ListDoesNotExistError
        respond_to do |format| 
          format.json{render :json => {:message => "There is an error. Please enter valid email id."}}
        end
       
      rescue Mailchimp::Error => ex
        if ex.message
          respond_to do |format|       
            format.json{render :json => {:message => "There is an error. Please enter valid email id."}}
          end
           
        else
          respond_to do |format|       
            format.json{render :json => {:message => "There is an error. Please enter valid email id."}}
          end              
        end
      end
    else
      respond_to do |format|       
        format.json{render :json => {:message => "Email Address Cannot be blank. Please enter valid email id."}}
      end    
    end
  end 
end
