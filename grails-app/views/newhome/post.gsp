<!DOCTYPE html>
<html>
    <head>
        <title>Home Page</title>
        <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous">
        </script>
        <style>
            body{
                background:#c0c0cc;
            }
            div{
                width:375px;
                padding:20px;
                margin:auto;
                background:#7a7cbb;
            }
            label{
                font-size:20px;
                color:#CCC;
                margin-bottom:5px;
            }
            #button1{
                margin-left:273px;
                color:green;
                width:100px;
            }
        </style>
    </head>
    <body >
        <div id="form" >
            <label id="hidden"></label>
            <label>whats on your mind:</label><br>
            <textarea cols="50" rows="5" id="post_data" value="" name="post_text"></textarea>
            <button id = "button1" name = "button1" onClick = "postAjax()">post</button>
        </div>
        <div id="posts">
            <h3 style="color:green">All Posts :</h3>
            <g:each in = "${fetched_value}" status = "i" var = "val">
                <p id="${val.id}" value="${val.postt}" class="${val.user.username}">
                        <span style="color:white">${val.user.username}</span><br>
                        <span >${val.postt}</span>
                        <br><br>
                </p>
            </g:each>
        </div>
    </body>
    <script>
        var queryString = new Array();
        var user;
        $(function () {
            if (queryString.length == 0) {
                if (window.location.search.split('?').length > 1) {
                    var params = window.location.search.split('?')[1].split('&');
                    for (var i = 0; i < params.length; i++) {
                        var key = params[i].split('=')[0];
                        var value = decodeURIComponent(params[i].split('=')[1]);
                        queryString[key] = value;
                    }
                }
            }
            if (queryString["username"] != null) {
                user = queryString["username"];
                //$('#hidden').html(user);
            }
        });
        $(document).ready(function() {
            $('p').click(function(){
                var Current_user = user;
                var Post_id = $(this).attr('id');
                var Post_details = $(this).attr('value');
                var Post_username = $(this).attr('class');
                var url = "demo.html?post_id=" + Post_id + "&post_details=" + Post_details +  "&current_user=" + Current_user + "&post_username=" + Post_username;
                window.location.href = url;
            });
        });
        function postAjax() {
            $(document).ready(function() {
                var post = $('#post_data').val(); 

                if(post == "" || user == "") {
                    alert('***please write something on your post text!!');
                    return false;
                }

                var URL="${createLink(controller:'newhome',action:'post_student_ajax_req')}"

                $.ajax({
                    url: URL,
                    type: "POST",
                    datatype: "html",
                    data:{username:user,post:post},
                    success:function(data)
                    {
                        alert(data);
                        $('#post_data').val("");
                    }
                }) 
            })
        }

    </script>
</html>