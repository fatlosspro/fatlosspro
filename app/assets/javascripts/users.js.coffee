# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# W3Schools email validation rewritten for coffeescript/jquery by Alexander Khovansky.

$.fn.extend({

  validateEmail: ->
    atpos  = this.val().indexOf "@" 
    dotpos = this.val().lastIndexOf "."

    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=this.val().length)
      return  false
    true

  validateForm: ->
    type = this.attr('type')

    switch type
      when 'email'
        if this.validateEmail()
            this.addClass('valid')
            $('.'+this.attr('id')+'.msg').addClass('affirm').text('OK!')
        else
          this.addClass('invalid')
          $('.'+this.attr('id')+'.msg').addClass('error').text('Must be a valid email!') 

      when 'password'
        if this.attr('id').match(/confirm/)
          if this.val() == $('#user_password').val() 
            this.addClass('valid')
            $('.'+this.attr('id')+'.msg').addClass('affirm').text('Matched!') 
          else
            this.addClass('invalid')
            $('.'+this.attr('id')+'.msg').addClass('error').text("Passwords don't match") 
        else
          if this.val().length >= 8   # Explicitly defined length sucks but it's late night out here...
            this.addClass('valid')
            $('.'+this.attr('id')+'.msg').addClass('affirm').text('Nice password!')  
          else 
            this.addClass('invalid')
            $('.'+this.attr('id')+'.msg').addClass('error').text('Must be at least 8 characters long!')   

      when 'text'
        if this.val().match(/[0-9]/) || not this.val().match(/[A-Z]/)  # Name can't contain numbers and must have capital letters
          this.addClass('invalid')
          $('.'+this.attr('id')+'.msg').addClass('error').text("This isn't a proper name. Did you forget capitals?") 
        else
          this.addClass('valid')
          $('.'+this.attr('id')+'.msg').addClass('affirm').text('Awesome!')    
})



$('.controls input').blur ->
 $(this).validateForm()
