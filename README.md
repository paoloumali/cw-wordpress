# cloudways.paoloumali.com

## Prod notes

- Nginx config is linked from  
.../sites-available/cloudways.paoloumali.com.nginx.conf  
to the corresponding file at root of this repo.

## SSL

- Add redirect in nginx config
- Force [WP Settings](http://cloudways.paoloumali.com/wp-admin/options-general.php) to use https on all pages
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

## Local deployment

Since future wordpress edits require a server,  
let's introduce a common environment for devs to  
use employing Vagrant

.d script is used for short commands

- Start server: $ ``d v up``
- Halt server: $ ``d v halt``
- SSH to server: $ ``d v ssh``
- Destroy vm: $ ``d v destroy``
- Snapshot create: $ ``d v snapshot push``
- Restore latest pushed state: $ ``d v snapshot pop``

### Runs

Below lines will have future use for automation

```bash
./server/scripts/nginx-setup.sh
./server/scripts/create-deployer.sh

# GIT repo setup
apt install git -y
...
```
