# cloudways.paoloumali.com

## Hosting notes

- nginx config is linked from /etc/nginx/sites-available/cloudways.paoloumali.com.nginx.conf to corresponding file in this repo.

## SSL

- Add redirect in nginx config
- force WP (http://cloudways.paoloumali.com/wp-admin/options-general.php) to use https updating nginx config to use SSL
  - WordPress Address (URL)
  - Site Address (URL)

## Temp Git deployer

- Setup branch protection on master.
- Git user in deployment dest
  - git config --global user.email dev+forge@paoloumali.com
  - git config --global user.name "Paolo Forge"
- on pull
  - git pull
  - returned negative
    - consider
      - git push origin -f master:previous
      - git reset --soft HEAD~1
      - git fetch origin
      - git stash
      - git pull
