alias pma='open http://localhost:8033/; docker run -it --rm -e PMA_HOST=docker.for.mac.localhost -p 8033:80 phpmyadmin/phpmyadmin'
alias c9='docker run -it --rm -p 8009:80 -v $(pwd):/workspace kdelfour/cloud9-docker'
alias up='docker-compose up -d --remove-orphans'
alias down='docker-compose down'
