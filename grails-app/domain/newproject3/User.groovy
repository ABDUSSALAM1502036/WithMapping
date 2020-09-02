package newproject3

class User {
    static hasMany = [posts: Post, comments: Comment]
    String username
    String password

    static constraints = {
        username unique: true
        password blank: false
    }
    static mapping = {
        sort "username"
    }
}

class Post {

    String postt
    static hasMany = [ comments : Comment ]
    static belongsTo = User
    User user
}

class Comment{
    String commentt
    static belongsTo = [User, Post]
    Post post
    User user
}
