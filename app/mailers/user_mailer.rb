class UserMailer < ApplicationMailer
   default from: "Mone Apps<info@mone.com>"

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.email.confirmacion.subject
    #
    def welcome_email(params)
      @user = params
      mail(to: @user.email,subject:"Bienvenido a Mone Apps")
    end

    def transactions_sender(sender,mone,receiver)
        @sender = sender
        @mones= mone
        @receiver =receiver
        mail(to: @sender.email,subject:"transacción realizada")
    end

      def transactions_receiver(sender,mone,receiver)
        @sender = sender
        @mones= mone
        @receiver =receiver
        mail(to: @receiver.email,subject:"Transacción Realizada")
    end

    def contact_us_email(name,email,phone,text)
        @name = name
        @email = email 
        @phone = phone
        @text = text
        mail(to: @email,subject:"MoNe App - Hemos recibido tu formulario de contacto")
    end
end
