#!/usr/bin/env bash

# Pass all arguments to drush
while [ $# -gt 0 ]; do
  drush_flags="$drush_flags $1"
  shift
done

drush="drush $drush_flags"

# can't run this on a dir shared via nfs, so non-starter for vagrant
# sudo $(dirname "$0")/file-permissions.sh --drupal_user=$USER --drupal_path=$PWD --httpd_group=www-data;

build_path=$(dirname "$0")

#$drush si -y --account-pass='drupaladm1n' commons &&
#$drush sql-drop -y &&
#$drush sqlc < $build_path/ref_db/slaughterhouse/drupal.sql -y &&
#rm -rf /var/drupals/loggia/www/sites/loggia.dev/files &&
#tar -zxvf $build_path/ref_db/slaughterhouse/files.tar.gz -C /var/drupals/loggia/www/sites/loggia.dev/ &&
#$drush updatedb -y &&
#$drush cc all -y &&
#$drush en $(cat $build_path/mods_enabled | tr '\n' ' ') -y &&
#$drush dis $(cat $build_path/mods_purge | tr '\n' ' ') -y &&
#$drush pm-uninstall $(cat $build_path/mods_purge | tr '\n' ' ') -y &&
#$drush cc all &&
#$drush updatedb -y &&
#$drush cc all -y &&
#$drush fra -y &&
#$drush cc all -y &&
#$drush dis comment shortcut overlay toolbar -y &&
#$drush fr -y --force commons_main_menu &&
#$drush cc menu &&

#$drush scr $build_path/script/set_theme.php &&
#$drush scr $build_path/script/feeds_import.php

#$drush cron
#wget -O ../distro.make https://raw.github.com/MrMaksimize/Drupal-BoilerPlate/base/distro.make &&
#mv sites ../ &&
#rm -rf * &&
#$drush make --no-cache ../distro.make . &&
#rm -rf sites &&
#mv ../sites . &&
#mkdir sites/all &&
#mkdir sites/all/modules &&
#mkdir sites/all/themes &&
#$drush si -y --account-pass='drupaladm1n' drupalbp


#rm -rf * &&
#$drush make --no-cache ../distro.make . &&
#$drush si -y --account-pass='drupaladm1n' drupalbp