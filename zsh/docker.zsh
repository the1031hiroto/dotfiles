alias pma='open http://localhost:8033/; docker run -it --rm -e PMA_HOST=docker.for.mac.localhost -p 8033:80 phpmyadmin/phpmyadmin'
alias up='docker-compose up -d --remove-orphans'
alias down='docker-compose down'
