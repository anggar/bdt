<?php
 /**
  * The base configuration for WordPress
  *
  * The wp-config.php creation script uses this file during the
  * installation. You don't have to use the web site, you can
  * copy this file to "wp-config.php" and fill in the values.
  *
  * This file contains the following configurations:
  *
  * * MySQL settings
  * * Secret keys
  * * Database table prefix
  * * ABSPATH
  *
  * @link https://codex.wordpress.org/Editing_wp-config.php
  *
  * @package WordPress
  */

 // ** MySQL settings - You can get this info from your web host ** //
 /** The name of the database for WordPress */
 define('DB_NAME', 'wordpress');

 /** MySQL database username */
 define('DB_USER', 'wordpressuser');

 /** MySQL database password */
 define('DB_PASSWORD', 'password');

 /** MySQL hostname */
 define('DB_HOST', '172.28.17.52:3306');

 /** Database Charset to use in creating database tables. */
 define('DB_CHARSET', 'utf8');

 /** The Database Collate type. Don't change this if in doubt. */
 define('DB_COLLATE', '');

 /**#@+
  * Authentication Unique Keys and Salts.
  *
  * Change these to different unique phrases!
  * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
  * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
  *
  * @since 2.6.0
  */
  define('AUTH_KEY',         '0D!|jCB>)7UAKqw3!-);t;l,nq2;A.y)|MeM0+KWe[ymeT~m`fs-@ge[|yq3N|b_');
  define('SECURE_AUTH_KEY',  '?23ij%}u$P}@HF.BFs8CS!jML%5sLYGkQETMy]Wa`&9+|8nt/+T)9REb>^y:yCsB');
  define('LOGGED_IN_KEY',    'cTm$+JkOn#$}NQz+1`elrREg+Dw>MZQu,$q[K0:t-65-s]=x]M-~Uh<W$_-lU=c|');
  define('NONCE_KEY',        'Q|x[-(%M3={#@$+0.# 6O@Tq_kgiiY(_@q<-_jJH#/[, o*G/mU#I>qcbk?IqCqj');
  define('AUTH_SALT',        'E]>>~MslN&>+rG0~-axyGsn2hApmT[]BEk.t]7.s d:^*Z_/Z4]/F4P0#RjmbWNB');
  define('SECURE_AUTH_SALT', '$tCyyBW~-}PBx~qK{6q{ldPY+SncC6Y)l9-Kjem7QwJv3k%AG}tfuT5A;UX$0V|r');
  define('LOGGED_IN_SALT',   'jmY6BI3gFIcyJdLl!o?c w@o!FFvTB:oQe:moy|2QH2w34LIH6Z]b+Q#H<]]5OCu');
  define('NONCE_SALT',       'pmm.t=R^nl+H)6g~=k{m,edL+=;eWO7+uGX0yLM@?ruS!)*7afKdv!>t[JZ{;+;?');

 /**#@-*/

 /**
  * WordPress Database Table prefix.
  *
  * You can have multiple installations in one database if you give each
  * a unique prefix. Only numbers, letters, and underscores please!
  */
 $table_prefix  = 'wp_';

 /**
  * For developers: WordPress debugging mode.
  *
  * Change this to true to enable the display of notices during development.
  * It is strongly recommended that plugin and theme developers use WP_DEBUG
  * in their development environments.
  *
  * For information on other constants that can be used for debugging,
  * visit the Codex.
  *
  * @link https://codex.wordpress.org/Debugging_in_WordPress
  */
 define('WP_DEBUG', true);

 /* That's all, stop editing! Happy blogging. */

 /** Absolute path to the WordPress directory. */
 if ( !defined('ABSPATH') )
     define('ABSPATH', dirname(__FILE__) . '/');

 /** Sets up WordPress vars and included files. */
 require_once(ABSPATH . 'wp-settings.php');

define( 'WP_REDIS_CLIENT', 'predis' );
define( 'WP_REDIS_SENTINEL', 'redis-cluster' );
define( 'WP_REDIS_SERVERS', [
    'tcp://172.28.17.53:26379',
    'tcp://172.28.17.54:26379',
    'tcp://172.28.17.55:26379',
] );

 define('FS_METHOD', 'direct');