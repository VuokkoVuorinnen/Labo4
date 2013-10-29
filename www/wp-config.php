<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'vagrant');

/** MySQL database password */
define('DB_PASSWORD', 'vagrant');

/** MySQL hostname */
define('DB_HOST', 'localhost');

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
define('AUTH_KEY',         'G4$<&hl699#82OfR>xV;PLuAhGw@AZp(%{x|.?Res|ufF2]f=77f-7Kk&sq`)|Xx');
define('SECURE_AUTH_KEY',  '6K:skbbk+B0h|dX$L_nB0gB=Y;hW?72O}4YRW0HRwqu2ZbhsVLGw>.LL3T_sY?EJ');
define('LOGGED_IN_KEY',    '@#Crriff $81/%^To53(&|&A5hmA:~/$NppTffR aW16+G?AE@0Z6@5Kbxp~oSC+');
define('NONCE_KEY',        'TY;dz!Wpo3GM/*e50B{QIASMrlb1M2Vj1@b0)]-:r;QrUUt_t-{L3Qz$?@U@N/o2');
define('AUTH_SALT',        ']fmflc3Ki)fhv&%L-f,}pA-04$(]4tF&@|K79],rH1-/1ak09m!ddVf</C=qjMFi');
define('SECURE_AUTH_SALT', 'Ji{+I@SBxeG^<;pp,KzEQ. [kI+ 2>V*OB!3 /Of2R0Z,q%K.u=]rrO@1FK^[E=A');
define('LOGGED_IN_SALT',   'bWKN@VbHTcT*{Y(.d6I2&qT^-E Svlhy+o/KMt.@-,1~_9L(#Rf*|EQIyX}jpoy1');
define('NONCE_SALT',       'DL:k%O |9@9DZ`cuUN#0@hh<YWq o6K) OKA!FXFYynR-_./@-I>}R>-L4|h6Lb_');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
