class JobPDF < ApplicationMailer
	default :from => 'Mikeks81@gmail.com'

	def pdf_email(pdf=nil, client, job)
		# @client = Client.find(params[:client_id])
  #   	@job = Job.find(params[:id])
  		attachments['filename.pdf'] = pdf if pdf.present?
  		mail :to => client.email, :subject => 'Invoice from #{user.fname}" "#{user.lname}'
	end

	def send_pdf(user)
	@client = user
    mail( :to => @client.email,
    :subject => 'Invoice from #{@user.fname}" "#{@user.lname}' )
  	end

  	

end
