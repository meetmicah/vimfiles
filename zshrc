# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true" # upgrade_oh_my_zsh

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
PATH=$PATH:$HOME/.rvm/bin:~/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/share/npm/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/bin

# Options
setopt interactivecomments
unsetopt correct
unsetopt correct_all

# Directories
alias .pj=" cd ~/VProjects/"
alias .mv=" cd ~/sites/devup/apps/myvitals"
alias .li3=" cd ~/sites/devup/apps/lithium"
alias .dv=" cd ~/sites/devup/"
alias .vt=" cd ~/sites/devup/apps/legacy/vitals/"
alias .hb=" cd ~/sites/devup/apps/vitals/"
alias .my=" cd ~/sites/devup/apps/myvitals"
alias .my.sh="vagrant ssh -c \"cd /vagrant/apps/vitals/app/ && echo '/* to edit this file, see: https://github.com/mdx-dev/myvitals/wiki/Search-Header */' | cat - webroot/css/compiled/search_header__REV1.css | sed 's/img/assets/g' > /vagrant/myvitals/app/assets/stylesheets/search_header.css && echo '/* to edit this file, see: https://github.com/mdx-dev/myvitals/wiki/Search-Header */' | cat - webroot/js/compiled/search_header__REV1.js > /vagrant/myvitals/app/assets/javascripts/search_header.js\""

# Clear the cache
function .hb.cc() {
	.hb
	# CSS
	if [ $(ls app/webroot/css/compiled/ | wc -l) -gt 0 ]
	then
		echo Ridding CSS
		cd app/webroot/css/compiled/ && rm -f *.css
		.hb
	fi
	# JS
	if [ $(ls app/webroot/js/compiled/ | wc -l) -gt 0 ]
	then
		echo Ridding JS
		cd app/webroot/js/compiled/ && rm -f *.js
		.hb
	fi
	cd -
}

# Remote pulling
alias .hb.pull="ssh mdxdev 'cd /var/www/apps/hb.mdxdev.net/current && git pull'"
alias .vt.pull="ssh mdxdev 'cd /var/www/domains/vitals.mdxdev.net/current && git pull'"
alias .ht.pull="ssh mdxdev 'cd /var/www/apps/hb.mdxdev.net/current && git pull && cd /var/www/domains/vitals.mdxdev.net/current && git pull'"

# Testing
alias .hb.test=".hb; vagrant ssh -c 'cd /vagrant/apps/vitals/app && ../libraries/lithium/console/li3 test tests'; cd -"
function .hb.plugin.test() {
	.hb
	vagrant ssh -c "cd /vagrant/apps/vitals/app && ../libraries/lithium/console/li3 test libraries/$1/tests";
	cd -
}

# Composer
alias .composer.get="curl http://getcomposer.org/installer | php"

# Git aliases
alias gs='git status'
alias gco='git checkout'
alias ga='git add -A :/'
alias gd='git diff'
alias gap='git add . -N && git add --patch'
alias gc="git commit -v"
alias gam='git commit --amend -v'
alias gl='git log --stat'
alias gpr='git pull --rebase'
alias grh='git reset HEAD'
alias grhh='git reset --hard'
alias gfo='git fetch origin'
alias gcp='git cherry-pick'
alias gtl="git tag -n | ruby -e \"puts STDIN.read.lines.sort_by { |t| t.split.first.sub(/^v/, '').sub(/\-rc/, '.1').split('.').map(&:to_i).tap { |v| v << 99 if v.length < 5 } }\""
alias gp="git pull --rebase && git push origin"
alias gpo="git push origin"
alias gpfo="git push -f origin"
# Change previous commit date
function gad() {
	DATE=$(php -r "echo date('D M d H:i:s Y O');")
	git commit --amend --date=$DATE
}

# Provider pulling
alias .mongo.mdxdev="mongo 10.10.5.80"
function .mongo.lookup() {
	if echo $1 | grep '^[0-9]\+$'
	then
		vagrant ssh -c "mongo vitals --eval 'printjson(db.providers.find({_id:$1})[0])'"
	else
		vagrant ssh -c "mongo vitals --eval 'printjson(db.providers.find({master_name:$1})[0])'"
	fi
}
function .mongo.fetch() {
	vagrant ssh -c 'cofeee /vagrant/apps/soonerio_scripts/molo.coffee $@'
	.mongo.lookup "$@"
}

# Mongo
alias .mongo.start='mongod --fork'
alias .mongo.stop='mongo admin --eval "db.shutdownServer()"'

# Postgres
alias .post.start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias .post.stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Mysql
alias .mysql.start='mysql.server start'
alias .mysql.stop='mysql.server stop'

# Redis
alias .redis.start='redis-server /usr/local/etc/redis.conf'


function .regex() {
	cd ~/frak-cli
	lein run "$@"
	cd -
}

alias .alias.regex="java -jar ~/frak-cli/compiled/frak-cli-0.1.0-standalone.jar"

# Common Typos
alias zues="zeus"
