#!/usr/bin/env bash

# Update these lines to use a reference database file.  If the file does not exist, the build will fail
# TODO: Should this fetch and/or use the site-install command instead?
USE_REF_DB=false
REF_DB_FILENAME='drupal.sql'

# Pass all arguments to drush
while [ $# -gt 0 ]; do
  drush_flags="$drush_flags $1"
  shift
done

# Set the drush command and base path, you sohuldn't need to worry about these values
drush="drush $drush_flags"
# can't run this on a dir shared via nfs, so non-starter for vagrant
# sudo $(dirname "$0")/file-permissions.sh --drupal_user=$USER --drupal_path=$PWD --httpd_group=www-data;
build_path=$(dirname "$0")
ref_db_path=$build_path/ref_db/$REF_DB_FILENAME

setup_site="$drush si -y minimal --account-pass=drupaladm1n --site-name=Awesome Site"

if $USE_REF_DB; then
	if -f $ref_db_path; then
		# import the ref db
		setup_site="$drush sqlc < $ref_db_path -y"
	else
		# fail!
		echo 'ERROR: The Reference database file $ref_db_path could not be found' 
		exit 1
	fi
fi

# Run the necessary commands
$drush sql-drop -y &&
$setup_site &&
$drush -y updatedb &&
$drush cc all &&
$drush en $(cat $build_path/mods_enabled | tr '\n' ' ') -y &&
$drush dis $(cat $build_path/mods_purge | tr '\n' ' ') -y &&
$drush pm-uninstall $(cat $build_path/mods_purge | tr '\n' ' ') -y &&
$drush cc all &&
$drush updatedb -y &&
$drush cc all -y &&
$drush fra -y &&
$drush cc all -y &&
$drush dis comment shortcut overlay toolbar -y

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