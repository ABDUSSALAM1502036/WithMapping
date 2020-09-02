<!DOCTYPE html>
<html>
    <head>
        <title>Register Page</title>
        <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous">
        </script>
        <style>
            body{
                background:#c0c0cc;
            }
            #form{
                margin-top:100px;
            }
            div{
                height:300px;
                width:375px;
                padding:20px;
                margin:auto;
                background:#7a7cbb;
            }
            input{
                margin-bottom:10px;
                font-size:18px;
                text-align:center;
                width:195px;
                height:25px;
            }
            button{
                color:green;
                font-size:25px;
                width:205px;
                margin-top:10px;
                height:35px;
            }
        </style>
    </head>
    <body >
        <div id="form" align="center">
            <h1>Register</h1>
            <input type="text" value="" placeholder="Enter Your Name" name="username" id="username" /><br>
            <input type="password" value="" placeholder="Enter Password" name="password" id="password" />
            <input type="password" value="" placeholder="Conf. Password" name="conf_password" id="conf_password" />
            <button id = "button" name = "button" onClick = "addAjax()" >submit</button><br><br>
        </div>
    </body>
    <script>
        function addAjax() {
            $(document).ready(function() {
                var mix_name = $('#username').val(); 
                var name = mix_name.toUpperCase(); //Convert the name in uppercase
                var pass = $('#password').val();
                var conf_password = $('#conf_password').val();

                //Check if name field is empty
                if(name == "" || pass == "" || conf_password == "" ) {
                    alert('please fill up empty fields');
                    return false;
                }

                //Check if name field is empty
                if(pass != conf_password) {
                    alert('password not matched with confirm_password!!');
                    return false;
                }

                var URL="${createLink(controller:'newhome',action:'add_student_ajax_req')}"

                $.ajax({
                    url: URL,
                    type: "POST",
                    datatype: "html",
                    data:{username:name, password:pass},
                    success:function(data)
                    {
                        alert(data);
                        $('#username').val(""); 
                        $('#password').val("");
                        $('#conf_password').val("");
                    }
                }) 
            })
        }
    </script>
</html>