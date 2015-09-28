module TwichBlade
  class TwichBladeCli

    def initialize
      @dbconnection = DBConnection.connection
    end

    def index_page
      puts "1. Signup\n2. Login\n3. Exit"
    end

    def welcome_message
      puts "Welcome to TwichBlade\n----------\nA place where you can connect to people\nand share your thoughts\n----------\n\n"
    end

    def user_page
      puts "1. Logout\n2. Tweet\n3. Timeline\n4. Search\n5. Retweet\n6. Follow\n7. Wall"
    end

    def option
      @option = STDIN.gets.chomp
    end

    def delegate(option)
      if option == "3"
        Process.exit
      else
        take_credentials
        @user = User.new(@username, @password)
        if option == "1"
          @user.signup
        elsif option == "2"
          @user.login
        else
          puts "Please enter a valid option"
        end
      end
    end

    def login_delegate(option)
      if option == "1"
        @user.logout
      elsif option == "2"
        content
        @tweet = Tweet.new(@content, @username, @username)
        @tweet.publish
      elsif option == "3"
        @timeline = Timeline.new(@username).create
        timeline_print
      elsif option == "4"
        search_user
        if Search.new(@search_user).execute 
          @timeline = Timeline.new(@search_user).create
          search_timeline_print
        else
          puts "\nUser Does not Exist\n\n"
        end
      elsif option == "5"
        tweet_id
        @retweet = Retweet.new(@tweet_id, @username)
        @retweet.publish
      elsif option == "6"
        user_to_follow
        @follow = Follow.new(@username, @user_to_follow)
        @follow.do
      elsif option == "7"
        @wall = Wall.new(@username).create
        wall_print
      end
    end

    def run
      welcome_message
      while 1
        index_page
        o = option
        delegate(o)
        while @user.logged_in?
          user_page
          o = option
          login_delegate(o)
        end
      end
    end

    private 
    def take_credentials
      print "Enter your username: "
      @username = STDIN.gets.chomp
      print "Enter your password: "
      @password = STDIN.noecho(&:gets).chomp
      puts " "
    end

    def content
      print "Compose your tweet: "
      @content = STDIN.gets.chomp
    end 

    def timeline_print
      @timeline.each{ |x| puts "tweet_id:#{x['id']} | #{x['tweeted_by']} => #{x['content']}" }
    end

    def search_timeline_print
      @timeline.each{ |x| puts "tweet_id:#{x['id']} | #{x['tweeted_by']} => #{x['content']}"}
    end

    def search_user
      print "username: "
      @search_user = STDIN.gets.chomp
    end

    def tweet_id
      print "Enter the tweet id you want to retweet: "
      @tweet_id = STDIN.gets.chomp
    end
    
    def user_to_follow
      print "username of the person you want to follow: "
      @user_to_follow = STDIN.gets.chomp
    end

    def wall_print
      @wall.each{ |y| y.each{ |x| puts "tweet_id:#{x['id']} | #{x['tweeted_by']} => #{x['content']}" } }
    end
  end
end
