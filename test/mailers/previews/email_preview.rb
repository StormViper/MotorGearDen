# Preview all emails at http://localhost:3000/rails/mailers/email
class EmailPreview < ActionMailer::Preview
		def registration_email_preview
			Email.registration_email(User.first)
		end
end
