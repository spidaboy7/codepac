<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'language'=>'en_us',
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'CODEPAC',

	// preloading 'log' component
	'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
	),

	'modules'=>array(
		// uncomment the following to enable the Gii tool
		'user'=>array(
		'debug'=>false,
		'userTable'=>'user',
		'translationTable'=>'translation',
		'mailer'=>'PHPMailer'
		),
		 'avatar'=>array(),
       		 
        	'profile' => array(
        	'privacySettingTable' => 'privacysetting',
        	'profileFieldTable' => 'profile_field',
        	'profileTable' => 'profile',
        	'profileCommentTable' => 'profile_comment',
        	'profileVisitTable' => 'profile_visit',
       		 ),
       		 'role' => array(
        	'roleTable' => 'role',
        	'userRoleTable' => 'user_role',
        	'actionTable' => 'action',
        	'permissionTable' => 'permission',
       		 ),
        	
        	'registration' => array(
       		 ),


		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'codepac123',
		 	// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
		),
		
	),

	// application components
	'components'=>array(
  		'session'=>array(
		'sessionName'=>'SiteSession',
		'class'=>'CHttpSession',
		'autoStart'=>true,
		),
       		 'cache'=>array('class'=>'system.caching.CFileCache'),
			'user'=>array(
                        'class'=>'application.modules.user.components.YumWebUser',
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
                         'loginUrl'=>array('//user/user/login'),
		),
		// uncomment the following to enable URLs in path-format
		
		'urlManager'=>array(
			'urlFormat'=>'path',
			/*'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),*/
		),
		/*
		'db'=>array(
			'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
		),
		// uncomment the following to use a MySQL database
		*/
		'db'=>array(
			'connectionString' => 'mysql:host=localhost;dbname=codepacu',
			'emulatePrepare' => true,
			'username' => 'root',
			'password' => 'rwinkwavu',
			'charset' => 'utf8',
                        'tablePrefix'=>'',
		),
	
		'errorHandler'=>array(
			// use 'site/error' action to display errors
            'errorAction'=>'site/error',
        ),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'eliemagambo@gmail.com',
	),
	'import'=>array('application.modules.user.models.*',
	'application.models.*',
        'application.components.*',),
);
