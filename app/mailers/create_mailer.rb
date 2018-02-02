class CreateMailer < ApplicationMailer
    
 def create_mail(email)
 p email
 p "email"
 mail to: email , subject: "ブログ作成の確認メール"

end
end