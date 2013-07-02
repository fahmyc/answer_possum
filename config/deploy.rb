set :application, "answerpossum.com"
#set :repository,  "git@github.com:fahmyc/answerpossum.git"
set :repository,  "git@github.com:fahmyc/answer_possum.git"

#on :start do    
#  `ssh-add`
#end

default_run_options[:pty] = true 
#set :scm_passphrase, "tutormefirst"  # The deploy user's password

#ssh_options[:keys] = ["/c/Users/Chris/Desktop/Programming/SSHKeys/privatekey.ppk"]
ssh_options[:keys] = %w(C\Users\Chris\Desktop\Programming\SSHKeys\privatekey.ppk)

 set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "answerpossum.com"                          # Your HTTP server, Apache/etc
role :app, "answerpossum.com"                          # This may be the same as your `Web` server
role :db,  "answerpossum.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

    set :username, "deploy"
    set :host, "72.51.29.183"
    #set :path, "/data/web/#{host}"
    set :path, "/data/web/answerpossum.com"
    set :restart, "touch tmp/restart.txt"
    set :checkout, "git pull"
    #next line is for first deploy
    #set :checkout, "git clone #{repository} ."

    #https://github.com/net-ssh/net-ssh/issues/55
    #set :ssh_options, {:forward_agent => true}
    privkey = ssh_options[:keys][0]
     
    desc "Remote checkout and restart of webserver"
    task :deploy1, :hosts => "#{username}@#{host}" do
      run "cd #{path}; #{checkout}; #{restart}"
    end