<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
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
                margin:5px;
                font-size:18px;
                text-align:center;
                width:195px;
                height:25px;
            }
            button{
                color:green;
                font-size:25px;
                margin-top:10px;
                width:205px;
                height:35px;
            }
            #username{
                margin-bottom:10px;
            }
        </style>
    </head>
    <body >
        <div id="form" align="center">
            <h1>Login Account</h1>
            <input type="text" value="" placeholder="Enter Your Name" name="username" id="username1" /><br>
            <input type="password" value="" placeholder="Enter Password" name="password" id="password1" />
            <button id = "button1" name = "button1" onClick = "logAjax()">Log in</button><br><label id = "hidden" style="color:red"></label>
            <g:form name = "myform" url = "[controller: 'Newhome', action: 'register1']">           
                    <g:submitButton style="background:#7a7cbb;width:205px;border:0px" name = "create_account" value = "Create Account" />
            </g:form>
            <p id = "hidden"></p>
        </div>
    </body>
    <script>
        function logAjax() {
            $(document).ready(function() {
                var mix_name = $('#username1').val(); 
                var username = mix_name.toUpperCase(); //Convert the name in uppercase
                var password = $('#password1').val();

                //Check if name field is empty
                if(username == "" || password == "" ) {
                    alert('please fill up empty fields');
                    return false;
                }

                var URL="${createLink(controller:'newhome',action:'log_ajax_req')}"

                $.ajax({
                    url: URL,
                    type: "POST",
                    datatype: "html",
                    data:{user:username, pass:password},
                    success:function(data)
                    {
                        if(data == "Yes"){
                            $('#hidden').hide();
                            //how to link to the next page
                            var url = "post.html?username=" + username ;
                            window.location.href = url;
                        }else{
                            $('#hidden').html("**Invalid Password");
                            $('#password1').val("");
                        }
                    }
                })
            })
        }
        
    </script>
</html>