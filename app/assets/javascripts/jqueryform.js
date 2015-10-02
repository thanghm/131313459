$(document).ready(function () {
  $("#loginmodal #new_user").validate({
    rules: {
      "user[login]": {
        required: true,
        minlength: 4
      },
      "user[password]": {
        required: true,
        minlength: 5
      }       
    },
    messages: {
      "user[login]": {
        required: "Please enter a valid username or email",
        minlength: "Your username must be at least 4 characters long"
      },
      "user[password]": {
        required: "Please provide a password",
        minlength: "Your password must be at least 5 characters long"
      }        
    }
  });
  $("#regiter_ #new_user").validate({
    rules: {
      "user[username]": {
        required: true,
        minlength: 4
      },
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        minlength: 5
      },
      "user[password_confirmation]": {
        required: true,
        minlength: 5
      },
      "user[address]": {
        required: true,
        minlength: 5
      },
      "user[phone]": {
        required: true,
        minlength: 5
      }
    },
    messages: {
      "user[username]": {
        required: "Please provide username",
        minlength: "Your username must be at least 4 characters long"
      },
      "user[email]": "Please enter a valid email address",
      "user[password]": {
        required: "Please provide a password",
        minlength: "Your password must be at least 5 characters long"
      },
      "user[password_confirmation]": {
        required: "Please provide a password confirmation",
        minlength: "Your password confirmation must be at least 5 characters long"
      },
      "user[address]": {
        required: "Please provide address",
        minlength: "Your address must be at least 4 characters long"
      },
      "user[phone]": {
        required: "Please provide phonenumber",
        minlength: "Your phonenumber must be at least 4 characters long"
      }        
    }
  });
  $("#new_post").validate({
        rules: {
          "post[title]": {
            required: true,
            minlength: 5
          },
          "post[body]": {
            required: true,
            minlength: 5
          },     
          "post[skill]": {
            required: true,
            minlength: 3
          },
          "post[phone]": {
            required: true,
            minlength: 5
          },
          "post[salary]": {
            required: true
          }         
        },
        messages: {
          "post[title]": {
            required: "Please enter a title",
            minlength: "Your title must be at least 5 characters long"
          },
          "post[body]": {
            required: "Please provide a body",
            minlength: "Your body must be at least 5 characters long"
          },
          "post[skill]":{
            required: "You are hire skill??",
            minlength: "Your body must be at least 3 characters long"
          },
          "post[phone]":{
            required: "Please enter a phone number",
            minlength: "Your body must be at least 5 characters long"
          },
          "post[salary]": {
            required: "Enter salary or ..."     
          }   
        }
    });
  $("#edituser #edit_user").validate({
    rules: {
      "user[fullname]": {
        required: true,
        minlength: 4
      },
      "user[username]": {
        required: true,
        minlength: 4
      },
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        minlength: 5
      },
      "user[password_confirmation]": {
        required: true,
        minlength: 5
      },
      "user[current_password]": {
        required: true,
        minlength: 5
      },
      "user[address]": {
        required: true,
        minlength: 5
      },
      "user[about]": {
        required: true,
        minlength: 5
      }

    },
    messages: {
      "user[fullname]": {
        required: "Please provide fullname",
        minlength: "Your fullname must be at least 4 characters long"
      },
      "user[username]": {
        required: "Please provide username",
        minlength: "Your username must be at least 4 characters long"
      },
      "user[email]": "Please enter a valid email address",
      "user[password]": {
        required: "Please provide a password",
        minlength: "Your password must be at least 5 characters long"
      },
      "user[password_confirmation]": {
        required: "Please provide a password confirmation",
        minlength: "Your password confirmation must be at least 5 characters long"
      },
      "user[current_password]": {
        required: "Please provide a current_password",
        minlength: "Your current_password must be at least 5 characters long"
      },
      "user[address]": {
        required: "Please provide address",
        minlength: "Your address must be at least 4 characters long"
      },
      "user[phone]": {
        required: "Please provide phonenumber",
        minlength: "Your phonenumber must be at least 4 characters long"
      },
      "user[about]": {
        required: "Please provide about of you",
        minlength: "Your about must be at least 4 characters long"
      }         
    }
  });
  $("#newmess").validate({
    rules: {
      "message[subject]": {
        required: true
      },
      "message[body]": {
        required: true,
        minlength: 5
      }       
    },
    messages: {
      "message[subject]": {
        required: "Please enter a valid subject"
      },
      "message[body]": {
        required: "Please provide a message",
        minlength: "Your message must be at least 5 characters long"
      }        
    }
  });
});