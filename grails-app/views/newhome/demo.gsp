<!DOCTYPE html>
<html>
    <head>
        <title>Single status</title>
        <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous">
        </script>
        <script>
            var queryString = new Array();
            var id;
            var details;
            var name;
            var current_name;
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
                if (queryString["post_id"] != null) {
                    id = queryString["post_id"];
                }
                if (queryString["post_details"] != null) {
                    details = queryString["post_details"];
                }
                if (queryString["post_username"] != null) {
                    name = queryString["post_username"];
                }
                if (queryString["current_user"] != null) {
                    current_name = queryString["current_user"];
                }
                $('#hide1').html(id);
                $('#hide2').html(name);
                $('#hide3').html(details);
            });
        </script>
        <style>
            body{
                background:#c0c0cc;
            }
            div.main{
                width:375px;
                padding:20px;
                margin:auto;
                background:#7a7cbb;
            }
            
        </style>
    </head>
    <body >
        <br><br>
        <div class="main">
            <span id="hide1" style="display:none"></span>
            <p id="hide2" style="color:white;font-size:20px"></p>
            <div style="margin-left:20px">
                <span id="hide3" style="font-size:20px"></span><br>
                <input type="button" value="Like" />
                <input type="text" id="comment" placeholder="write a comment..." />
                <button id="comment_btn" onClick = "commentAjax()">send</button>
            </div>
        </div>
        <div class="main" >
                <h1 style="color:green;font-size:30px">comments : </h1>
                    <g:each in = "${fetched_value}" status = "i" var = "val">
                        <p style="color:white;margin-left:20px" id="user_id">${val.user.username} : ${val.commentt}</p>
                    </g:each>
        </div>
    </body>
    <script>
       $(document).ready(function(){
            var postt_id = id;

            var URL="${createLink(controller:'newhome',action:'demo')}"

                $.ajax({
                    url: URL,
                    type: "POST",
                    datatype: "html",
                    data:{post_id:postt_id},
                });
        });
         function commentAjax() {
            $(document).ready(function() {
                var post_comment = $('#comment').val(); 

                if(post_comment == "") {
                    alert('***please write something on comment field!!');
                    return false;
                }

                var URL="${createLink(controller:'newhome',action:'add_comment_ajax_req')}"

                $.ajax({
                    url: URL,
                    type: "POST",
                    datatype: "html",
                    data:{username:current_name,post_id:id,comment:post_comment},
                    success:function(data)
                    {
                        alert(data);
                        $('#comment').val("");
                    }
                }) 
            })
        }

    </script>
</html>