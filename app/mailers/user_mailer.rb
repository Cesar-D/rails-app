class UserMailer < ApplicationMailer

    def confirm_account
        @user = 'César Diaz'
        mail(to: 'llalejoll11@gmail.com', subject: 'Welcome to my Omega blog')
    end
end
