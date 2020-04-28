# cloudways.paoloumali.com

## Hosting notes

- nginx config is linked from /etc/nginx/sites-available/cloudways.paoloumali.com.nginx.conf to corresponding file in this repo.

## SSL

- Add redirect in nginx config
- force WP (http://cloudways.paoloumali.com/wp-admin/options-general.php) to use https updating nginx config to use SSL
  - WordPress Address (URL)
  - Site Address (URL)
