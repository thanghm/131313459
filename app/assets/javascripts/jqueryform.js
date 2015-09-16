$(document).ready(function () {
  $("#loginmodal #new_user").validate({
      rules: {
        "user[email]": {
          required: true
        },
        "user[password]": {
          required: true,
          minlength: 5
        }       
      },
      messages: {
        "user[email]": "Please enter a valid email address",
        "user[password]": {
          required: "Please provide a password",
          minlength: "Your password must be at least 5 characters long"
        }        
      }
    });
  $("#regiter_ #new_user").validate({
      rules: {
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
        }

      },
      messages: {
        "user[email]": "Please enter a valid email address",
        "user[password]": {
          required: "Please provide a password",
          minlength: "Your password must be at least 5 characters long"
        },
        "user[password_confirmation]": {
          required: "Please provide a password confirmation",
          minlength: "Your password confirmation must be at least 5 characters long"
        }        
      }
    });

    $("form#new_user").on("ajax:success", function(e, data, status, xhr) {
      
      if (data.success) {
        $divResponse = $('div#loginbody');
        $divResponse.text('Click to continue!');
        $('button#loginss').hide();
        $('button#homebt').css("display","inline-block");
        $('#loginmodal').modal('hide');
        $('li.hdlogin').hide();
        $('li.hdregis').hide();
        $('li.btn_logout').css("visibility", "visible");
        return alert('success!.');
      } 
      else {
        return alert('failure!');
      }
    });
});