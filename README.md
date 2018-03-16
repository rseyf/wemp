# WEMP STACK SETUP GUIDE

## Step 1: Install MariaDB
- Go to C:\wemp\requirements
- Run `mariadb-10.2.13-winx64.msi` to install MariaDB
Remember your MariaDB setup details , like Host (Default: localhost), Port (Default: 3306) , Username (Default: root) , Password (No Password by default).
- press WIN+R keys and type `services.msc`
- make sure `MySQL` service is running properly and is set to autostart every time you reboot the system
- Follow step 2

## Step 2: MariaDB/Doctrine2 bugfix
To fix table names and force MariaDB to don't touch entities upper and lower-case names, add this line below [mysqld] into your 'my.ini':

```
[mysqld]
lower_case_table_names=2
```

## Step 3: Install Redis
- Go to C:\wemp\requirements
- Install `Redis-x64-3.2.100.msi`
- press WIN+R keys and type `services.msc`
- make sure `Redis` service is running properly and is set to autostart every time you reboot the system

## Step 4: Install PHP and NGINX
- I have done that before for you! just make sure your `wemp` folder is based inside `C:/` directory.

## Step 5: Configuring your Symfony project
- open Notepad as administrator and open `C:\Windows\System32\drivers\etc\hosts` file 
- add below line to end of this file:
  ```
  127.0.0.1	cheene.local	backend.cheene.local	api.cheene.local
  ```

- now , you will be able to ping `cheene.local` from you cmd.exe, now you should configure `nginx`.
- I had created some nginx configuration files in `C:\wemp\prebuilt-configs` directory for my own projects
- copy and replace the `nginx.conf` file for project that you are involved with to `C:\wemp\nginx\conf`
- read your copied `nginx.conf` file content and make sure you have cloned your project to `www` directory. for instance:
```
#######################
## CHEENE SERVER CONFIG
#######################
    server {
        server_name backend.cheene.local cheene.local api.cheene.local;
        root c:/wemp/www/cheene-server/web; 
```

- as you see inside your `nginx.conf` , YOU SHOULD MAKE A GIT CLONE INSIDE `www` directory.

** NOTE! **  
Make sure to add your ssh-key to your github/gitlab account. see [here](https://help.github.com/articles/connecting-to-github-with-ssh/) for more information.

### Step 5-1: Starting services
You can start server simply by just running/clicking-on `C:\wemp\start_services.bat`

### Step 5-2: Stoping services
You can stop server simply by just running/clicking-on `C:\wemp\stop_services.bat`

## Step 6: Install Composer 
- Go to C:\wemp\requirements
- Run `Composer-Setup.exe` to install Composer Dependency management tools

## Step 7: PATH variable of windows
- Press WIN + R keys
- type `sysdm.cpl`
- go to `Advanced -> Environment Variables`
- choose `Path` and click `Edit`
- add below entries to `Path`
<pre>
C:\wemp\nginx
C:\wemp\php
C:\Program Files\MariaDB 10.2\bin
</pre>
- re-open your command line window

## Step 8: final setup for symfony
- `cd` into your project directory (in our case: `c:/wemp/www/cheene-server/`) by using gitbash
- from `gitbash` , run `mysql -u root`
- in `mysql` console, create a new databaes by typing `create database cheene_db;` , exit mysql console by using `CTRL + C`
- Run `composer install` command and follow instructions to setup your symfony project
- Run `php bin\console doctrine:cache:clear-metadata` to clear Doctrine cache
- Run `php bin\console doctrine:generate:schema` to generate database tables
- Run `php bin\console doctrine:fixtures:load` to insert default values to mysql
- now, navigate your browser to `http://backend.cheene.local`, ask @rseyf for default login information.

## Support
- No support for windows! you can submit an issue in the case of life and death.