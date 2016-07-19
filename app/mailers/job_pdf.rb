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
  	byebug
	@user = user
	mail( :to => @user.email,
	:subject => 'Thanks for signing up for Freelance Me.' )

	# send email to me everytime someone signs up
	mail( :to => 'mikeks81@gmail.com',
	 :subject => "Someone Just signed up at Freelanceme.",
	 :body => @user.fname + " " + @user.lname  + " " + @user.email)
  end

end
