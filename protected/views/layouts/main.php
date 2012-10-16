<?php

$fbconfig = Yum::module()->facebookConfig;
if(isset($fbconfig)) {
    Yii::import('application.modules.user.vendors.facebook.*');
        require_once('Facebook.php');
    $facebook = new Facebook($fbconfig);
    $fb_session = $facebook->getSession();
    if($fb_session && Yii::app()->user->isGuest)
                if($this->action->id != 'login')
                        $this->redirect($this->createUrl('/user/auth/login'));
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />
	<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl;?>/css/wmd/showdown.js"></script>
	<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl;?>/css/wmd/jQuery/jquery-1.2.6.min.js "></script>
	<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl;?>/css/custom_js.js "></script>
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl;?>/css/prettify/src/prettify.js"></script>

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/custom_css.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/prettify/src/prettify.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/wmd/wmd.css" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body onload="styleCode()">

<?php if(isset($fbconfig)): ?>
<div id="fb-root"></div>
<script>
window.fbAsyncInit = function() {
    FB.init({
        appId   : '<?php echo $facebook->getAppId(); ?>',
        session : <?php echo json_encode($fb_session); ?>, // don't refetch the session when PHP already has it
        status  : <?php echo $fbconfig['status']; ?>, // check login status
        cookie  : <?php echo $fbconfig['cookie']; ?>, // enable cookies to allow the server to access the session
        xfbml   : <?php echo $fbconfig['xfbml']; ?> // parse XFBML
    });

    // whenever the user logs in, we refresh the page
    FB.Event.subscribe('auth.login', function() {
        window.location.reload();
    });
};

(function() {
    var e = document.createElement('script');
    e.src = document.location.protocol + '//connect.facebook.net/<?php echo $fbconfig['lang']; ?>/all.js';
    e.async = true;
    document.getElementById('fb-root').appendChild(e);
}());
</script>
<?php endif; ?>
      <?php  if(!Yii::app()->user->isGuest){
		$avatarUser=YumUser::model()->findByPk(Yii::app()->user->id); 
		Yii::app()->clientScript->registerScript('avatar', "
		$('{$avatarUser->getAvatar(true)}').prependTo('.dropdown-toggle');

		");
		}



		else
		$avatarUser='';
 	
      ?>
<?php  $this->widget('bootstrap.widgets.TbNavbar', array(
    'type'=>'inverse', // null or 'inverse'
    'brand'=>CHtml::encode(Yii::app()->name),
    'brandUrl'=>'#',
    'collapse'=>true, // requires bootstrap-responsive.css
    'items'=>array(
        array(
            'class'=>'bootstrap.widgets.TbMenu',
            'items'=>array(
                array('label'=>'Home','url'=>array('/site/index'),),
		array('label'=>'About', 'url'=>array('/site/page', 'view'=>'about')),
		array('label'=>'Contact us','url'=>array('/site/contact')),
            ),
        ),
        '<form class="navbar-search pull-left" action=""><input type="text" class="search-query span2" placeholder="Search"></form>',
        array(
            'class'=>'bootstrap.widgets.TbMenu',
            'htmlOptions'=>array('class'=>'pull-right'),
            'items'=>array(
                array('label'=>'Sign in', 'url'=>array('/user/auth'),'visible'=>Yii::app()->user->isGuest),
                '---',
                array('' ,  'url'=>array('//profile/profile/view', 'id' => Yii::app()->user->id), 'visible'=>!Yii::app()->user->isGuest,
		'items'=>array(
                    array('label'=>'Settings', 'url'=>array('/profile/profile/view')),
                    array('label'=>'Logout', 'url'=>array('/user/user/logout')),
                   
                )),
            ),
        ),
    ),
));?>
       






















<div class="container" id="page">

	<div id="header">
		<div id="logo"><?php echo CHtml::encode(Yii::app()->name); ?></div>
	</div><!-- header -->

	<div id="mainmenu">
		<?php
      			/* $this->widget('zii.widgets.CMenu',array(
			'items'=>array(
				array('label'=>'Home', 'url'=>array('/site/index')),
				array('label'=>'Contact', 'url'=>array('/site/contact')),
				array('label'=>'Login', 'url'=>array('//user/auth'), 'visible'=>Yii::app()->user->isGuest),
				array('label'=>'Logout ('.Yii::app()->user->name.')', 'url'=>array('//user/user/logout'), 'visible'=>!Yii::app()->user->isGuest),
				array('label'=>'My profile ', 'url'=>array('/user/user/'), 'visible'=>!Yii::app()->user->isGuest),
			),
	)); */?>
	</div><!-- mainmenu -->
	<?php /* if(isset($this->breadcrumbs)):?>
		<?php $this->widget('zii.widgets.CBreadcrumbs', array(
			'links'=>$this->breadcrumbs,
		)); ?><!-- breadcrumbs -->
	<?php endif */ ?>

	<?php echo $content; ?>

	<div class="clear"></div>

	<div id="footer">
		Copyright &copy; <?php echo date('Y'); ?> CODEPAC.<br/>
		All Rights Reserved.<br/>
		<?php echo Yii::powered(); ?>
	</div><!-- footer -->

</div><!-- page -->
 <script type="text/javascript" src="/codepac/css/wmd/wmd.js"></script>
</body>
</html>
