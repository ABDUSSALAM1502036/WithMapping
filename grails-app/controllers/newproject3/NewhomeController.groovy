package newproject3

class NewhomeController {

    def index() { }
    def log_ajax_req(){
        def value1 = params.user
        def value2 = params.pass

        def all = User.findAllByUsername(value1) 

        if( all.username[0]  != null) {
            if(value2 == all.password[0]){
                render "Yes"
            }
            else{
                render "No"
            }
        } else {
            render "Invalid_User";
        }
    }

    def register1(){}
    def add_student_ajax_req(){
        User value = new User(params) //Passed values from ajax

        //Validate fetched db values
        if(!value.validate()) {
            render "Name already taken"
        } else {
            User create_student = new User(params)
            create_student.save()
            render "Value added successfully"
        }
    }

    def post(){
        def fetched_value = Post.list() 
        [fetched_value:fetched_value]
    }
    def post_student_ajax_req(){
        def postContent = params.post
        def posterName = params.username

        def userFetch = User.findAllByUsername(posterName)
        User userObj = User.get(userFetch.id)

        Post newPost = new Post(user:userObj, postt:postContent)
        newPost.save()
        render "Post saved successfully"
    }

    def demo(){
        def ppost_id = params.post_id
        def post = Post.findAllById(ppost_id)
        Post postObj = Post.get(post.id)
        
        def fetched_value = Comment.findAllByPost(postObj)
        [fetched_value:fetched_value]
    }
    def add_comment_ajax_req(){
        def cmTxt = params.comment
        def cmUser = params.username
        def postId = params.post_id

        def userFetch = User.findAllByUsername(cmUser)
        User userObj = User.get(userFetch.id)

        def postFetch = Post.findAllById(postId)
        Post postObj = Post.get(postFetch.id)

        Comment newCmt = new Comment(user:userObj, post:postObj, commentt:cmTxt)
        newCmt.save()
        render "Comment saved successfully."

    }
}
