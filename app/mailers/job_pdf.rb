class JobPDF < ApplicationMailer
	default :from => 'info@MichaelSimonitsch.com'

	def pdf_email(pdf=nil, client, job)
  		attachments['filename.pdf'] = pdf if pdf.present?
  		mail :to => client.email, :subject => 'Invoice from user.fname user.lname'
	end

	# def send_pdf(user)
	# @client = user
 #    mail( :to => @client.email,
 #    :subject => 'Invoice from #{@user.fname}" "#{@user.lname}' )
 #  	end

  	

end
