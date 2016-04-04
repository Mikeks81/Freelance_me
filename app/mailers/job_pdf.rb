class JobPdf < ApplicationMailer
	default :from => 'mailer@freelanceme.tech'

	def pdf_email(pdf=nil,user,client,job)
		@user = user
		@client = client
		@job = job
  		attachments['Invoice.pdf'] = pdf if pdf.present?
  		mail( :to => @client.email, :subject => 'Invoice from '+ @user.fname + ' ' +@user.lname, :from => @user.email, :bcc => @user.email )
	end

	# def send_pdf(user)
	# @client = user
 #    mail( :to => @client.email,
 #    :subject => 'Invoice from #{@user.fname}" "#{@user.lname}' )
 #  	end

  def send_signup_email(user)
	@user = user
	mail( :to => @user.email,
	:subject => 'Thanks for signing up for our amazing app' )
  end

end
