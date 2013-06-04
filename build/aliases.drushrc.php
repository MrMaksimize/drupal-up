<?php

$vagrant_drupal_dir = '/vagrant/srv/';
$aliases['loggia.local'] = array(

  'root' => $vagrant_drupal_dir,

  'path-aliases' => array(

    '%dump-dir' => $vagrant_drupal_dir . 'drush.dbdumps',

    '%files' => $vagrant_drupal_dir . 'sites/default/files'

  )

);


$remote_sites = '/var/www/sites/';


$aliases['loggia-remote'] = array (

  'remote-host' => '166.78.95.171',

  'remote-user' => 'maksim',

  'ssh-options' => "-p 22",

  'path-aliases' => array(

    '%dump-dir' => '/home/maksim/drush-backups'

  )

);


$aliases['loggia.dev'] = array(

  'parent' => '@loggia-remote',

  'root' => $remote_sites . 'loggia.prometdev.com',

  'path-aliases' => array(

    '%files' => $remote_sites . 'loggia.prometdev.com/sites/default/files'

  )

);
?>