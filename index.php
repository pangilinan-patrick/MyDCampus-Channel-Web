<?php
session_start();
$user_email = "[email]";
$temp_eml = "[email]";
$user_if_first = FALSE;
if (isset($_SESSION['user'])) {
  $user_email = $_SESSION['user'];
} else {
  $url = "DCampus_Login_Email.php";
  echo "<script type='text/javascript'>document.location.href='{$url}';</script>";
  echo '<META content="0;URL=' . $url . '">';
}

include "postgres_dbs_connect.php"; //connects to postgres db

$sql_query = "SELECT * FROM public.tbl_users";
$result = pg_query($dbconn, $sql_query);
while ($row = pg_fetch_array($result)) {
  $temp_eml = $row['fld_email'];
  if ($temp_eml == $user_email and $row['fld_if_first_time'] == true) {
    $user_if_first = $row['fld_if_first_time'];
    $update_sql = "UPDATE public.tbl_users SET fld_if_first_time='false' WHERE fld_email='$user_email'";
    $check = pg_query($dbconn, $update_sql);
    if (!$check) {
      die("Error" . pg_last_error());
    }
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head ontouchmove="event.preventDefault();">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
  <title>My DCampus Portal</title>
  <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="theme-color" content="#0f9d58">
  <link rel="shortcut icon" href="https://mydcampus.dlsl.edu.ph/favicon.ico" type="image/x-icon">
  <link rel="icon" href="https://mydcampus.dlsl.edu.ph/favicon.ico" type="image/x-icon">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-title" content="DCampus Portal">
  <link rel="apple-touch-icon" href="https://mydcampus.dlsl.edu.ph/assets/icons/icon-256x256.png">
  <link rel="apple-touch-icon" sizes="76x76" href="https://mydcampus.dlsl.edu.ph/assets/icons/icon-256x256.png">
  <link rel="apple-touch-icon" sizes="120x120" href="https://mydcampus.dlsl.edu.ph/assets/icons/icon-128x128.png">
  <link rel="apple-touch-icon" sizes="152x152" href="https://mydcampus.dlsl.edu.ph/assets/icons/icon-256x256.png">
  <meta name="msapplication-starturl" content="/#/dashboard/">
  <meta name="google-signin-client_id" content="887123549499-4nsnmfn5aip2nhgh3l6afpk56d04bia9.apps.googleusercontent.com">

  <!-- Vendor styles
  <link rel="stylesheet" href="<=$GLOBALS['INF_CONFIG']['_sitehost']?>/assets/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic.css"> -->
  <!-- <link rel="stylesheet" href="./My DCampus Portal_files/material-design-iconic-font.min.css"> -->

  <!-- <link href="./My DCampus Portal_files/css" rel="stylesheet"> -->
  <!-- <link rel="stylesheet" href="./My DCampus Portal_files/animate.min.css"> -->
  <!-- <link rel="stylesheet" href="./My DCampus Portal_files/jquery.scrollbar.css"> -->
  <!-- <link rel="stylesheet" href="./My DCampus Portal_files/sweetalert2.min.css"> -->

  <!-- <link rel="stylesheet" href="./My DCampus Portal_files/select2.min.css"> -->
  <!-- <link rel="stylesheet" href="./My DCampus Portal_files/trumbowyg.min.css"> -->
  <!-- <link rel="stylesheet" href="./My DCampus Portal_files/starrr.css"> -->
  <!-- <link rel="stylesheet" type="text/css" href="./My DCampus Portal_files/bootstrap-grid.css"> -->

  <!-- Font Awesome -->
  <script src="https://kit.fontawesome.com/548c2f30a4.js" crossorigin="anonymous"></script>

  <!-- App styles -->
  <link rel="stylesheet" href="./My DCampus Portal_files/app.min.css">
  <style>
    #search_stage_wrapper {
      min-height: 100%;
      background: #F3F6F7;
      min-width: 100%;
      position: absolute;
      top: 0;
      right: 0;
      bottom: -500;
      left: 0;
      z-index: 98;
      opacity: 0;
      display: none;
      height: 100%;
      vertical-align: middle;
      margin-top: 70px;
      padding: 10px 30px 0;
    }

    .fademe {
      transition: opacity .15s linear;
    }

    .fademe.showme {
      opacity: 1;
    }

    .result_img {
      position: absolute;
      font-style: normal;
      width: 5rem;
      height: 5rem;
      border-radius: 50%;
      left: 0;
      top: 0;
    }

    #close_search {
      margin: 40px 40px;
    }

    .g-signin2 {
      display: none;
    }
  </style>
  <style>
    [data-columns]::before {
      display: block;
      visibility: hidden;
      position: absolute;
      font-size: 1px;
    }
  </style>
  <style>
    .abcRioButton {
      border-radius: 1px;
      box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .25);
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      -webkit-transition: background-color .218s, border-color .218s, box-shadow .218s;
      transition: background-color .218s, border-color .218s, box-shadow .218s;
      -webkit-user-select: none;
      -webkit-appearance: none;
      background-color: #fff;
      background-image: none;
      color: #262626;
      cursor: pointer;
      outline: none;
      overflow: hidden;
      position: relative;
      text-align: center;
      vertical-align: middle;
      white-space: nowrap;
      width: auto
    }

    .abcRioButton:hover {
      box-shadow: 0 0 3px 3px rgba(66, 133, 244, .3)
    }

    .abcRioButtonBlue {
      background-color: #4285f4;
      border: none;
      color: #fff
    }

    .abcRioButtonBlue:hover {
      background-color: #4285f4
    }

    .abcRioButtonBlue:active {
      background-color: #3367d6
    }

    .abcRioButtonLightBlue {
      background-color: #fff;
      color: #757575
    }

    .abcRioButtonLightBlue:active {
      background-color: #eee;
      color: #6d6d6d
    }

    .abcRioButtonIcon {
      float: left
    }

    .abcRioButtonBlue .abcRioButtonIcon {
      background-color: #fff;
      border-radius: 1px
    }

    .abcRioButtonSvg {
      display: block
    }

    .abcRioButtonContents {
      font-family: Roboto, arial, sans-serif;
      font-size: 14px;
      font-weight: 500;
      letter-spacing: .21px;
      margin-left: 6px;
      margin-right: 6px;
      vertical-align: top
    }

    .abcRioButtonContentWrapper {
      height: 100%;
      width: 100%
    }

    .abcRioButtonBlue .abcRioButtonContentWrapper {
      border: 1px solid transparent
    }

    .abcRioButtonErrorWrapper,
    .abcRioButtonWorkingWrapper {
      display: none;
      height: 100%;
      width: 100%
    }

    .abcRioButtonErrorIcon,
    .abcRioButtonWorkingIcon {
      margin-left: auto;
      margin-right: auto
    }

    .abcRioButtonErrorState,
    .abcRioButtonWorkingState {
      border: 1px solid #d5d5d5;
      border: 1px solid rgba(0, 0, 0, .17);
      box-shadow: 0 1px 0 rgba(0, 0, 0, .05);
      color: #262626
    }

    .abcRioButtonErrorState:hover,
    .abcRioButtonWorkingState:hover {
      border: 1px solid #aaa;
      border: 1px solid rgba(0, 0, 0, .25);
      box-shadow: 0 1px 0 rgba(0, 0, 0, .1)
    }

    .abcRioButtonErrorState:active,
    .abcRioButtonWorkingState:active {
      border: 1px solid #aaa;
      border: 1px solid rgba(0, 0, 0, .25);
      box-shadow: inset 0 1px 0 #ddd;
      color: #262626
    }

    .abcRioButtonWorkingState,
    .abcRioButtonWorkingState:hover {
      background-color: #f5f5f5
    }

    .abcRioButtonWorkingState:active {
      background-color: #e5e5e5
    }

    .abcRioButtonErrorState,
    .abcRioButtonErrorState:hover {
      background-color: #fff
    }

    .abcRioButtonErrorState:active {
      background-color: #e5e5e5
    }

    .abcRioButtonErrorState .abcRioButtonErrorWrapper,
    .abcRioButtonWorkingState .abcRioButtonWorkingWrapper {
      display: block
    }

    .abcRioButtonErrorState .abcRioButtonContentWrapper,
    .abcRioButtonErrorState .abcRioButtonWorkingWrapper,
    .abcRioButtonWorkingState .abcRioButtonContentWrapper {
      display: none
    }

    .-webkit-keyframes abcRioButtonWorkingIconPathSpinKeyframes {
      0% {
        -webkit-transform: rotate(0deg)
      }
    }
  </style>
</head>

<body data-ma-theme="green">
  <div class="g-signin2" style="display:none;" data-gapiscan="true" data-onload="true">
    <div style="height:36px;width:120px;" class="abcRioButton abcRioButtonLightBlue">
      <div class="abcRioButtonContentWrapper">
        <div class="abcRioButtonIcon" style="padding:8px">
          <div style="width:18px;height:18px;" class="abcRioButtonSvgImageWithFallback abcRioButtonIconImage abcRioButtonIconImage18"><svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" viewBox="0 0 48 48" class="abcRioButtonSvg">
              <g>
                <path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z">
                </path>
                <path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z">
                </path>
                <path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z">
                </path>
                <path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z">
                </path>
                <path fill="none" d="M0 0h48v48H0z"></path>
              </g>
            </svg></div>
        </div><span style="font-size:13px;line-height:34px;" class="abcRioButtonContents"><span id="not_signed_innqi7njd53u7g" style="display: none;">Sign in</span><span id="connectednqi7njd53u7g" style="">Signed in</span></span>
      </div>
    </div>
  </div>
  <main class="main">
    <div class="page-loader" style="display: none;">
      <div class="page-loader__spinner">
        <svg viewBox="25 25 50 50">
          <circle cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"></circle>
        </svg>
      </div>
    </div>

    <header class="header">
      <div id="navtrigger" class="navigation-trigger hidden-xl-up" data-ma-action="aside-open" data-ma-target=".sidebar">
        <div class="navigation-trigger__inner">
          <i class="navigation-trigger__line"></i>
          <i class="navigation-trigger__line"></i>
          <i class="navigation-trigger__line"></i>
        </div>
      </div>

      <div class="header__logo hidden-sm-down">

        <h1><img src="./My DCampus Portal_files/logo.png" height="25" style="margin-right:38px;"><a href="https://mydcampus.dlsl.edu.ph/"></a></h1>
      </div>
      <ul class="top-nav">

        <li class="dropdown hidden-xs-down">

          <a data-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-ellipsis-vertical"></i></a>

          <div class="dropdown-menu dropdown-menu-right">
            <a data-action="fullscreen" class="dropdown-item"><i class="zmdi zmdi-fullscreen zmdi-hc-fw"></i> Toggle
              Fullscreen</a>
            <a class="dropdown-item enable" id="toggle_sidebar"><i class="zmdi zmdi-flip zmdi-hc-fw"></i>Hide
              Sidebar</a>
            <a class="dropdown-item" id="toggle_notify">Enable Notifications</a>
          </div>
        </li>

        <!-- <li class="dropdown hidden-xs-down">
            <a href="#" data-toggle="modal" data-target="#modal-onboard" ><i class="zmdi zmdi-help zmdi-hc-fw"></i></a>
            </li> -->

      </ul>
    </header>

    <aside class="sidebar">
      <div class="scroll-wrapper scrollbar-inner" style="position: relative;">
        <div class="scrollbar-inner scroll-content" style="height: 791.5px; margin-bottom: 0px; margin-right: 0px; max-height: none;">
          <div class="user">
            <div class="user__info" data-toggle="dropdown">
              <img class="user__img" src="./My DCampus Portal_files/unnamed.png" alt="">
              <div>
                <div class="user__name"><?php echo $user_email; ?></div>
                <div class="user__email"></div>
              </div>
            </div>

            <div class="dropdown-menu">
              <a class="dropdown-item" onclick="signOut();">Sign Out</a>

            </div>
          </div>

          <!-- 3sidebar navigation -->
          <ul class="navigation">
            <!-- <li id="nav_dashboard" class="navigation__active"><a href="< ?=$GLOBALS['INF_CONFIG']['_sitehost']?>/#/dashboard"><i class="zmdi zmdi-home"></i> Dashboard</a></li> -->
            <li id="nav_digitalservices" class="navigation__active"><a href="https://mydcampus.dlsl.edu.ph/#/digitalservices"><i class="fa-solid fa-shapes"></i> Digital
                Services</a></li>
            <li id="nav_newsandevents"><a href="https://mydcampus.dlsl.edu.ph/#/newsandevents"><i class="fa-solid fa-newspaper"></i> News &amp; Information</a></li>
            <li>
              <input id="check01" type="checkbox" name="menu" style="display: none;" />
              <label for="check01"><i class="fa-solid fa-wrench"></i> Chatbot Settings</label>
              <ul class="submenu">
                <div class="sub1">
                  <li><label>Themes</label></li>
                  <li>
                    <ul class="suboption">
                      <li><label class="change-theme-button" id="change-config1-bp" onclick="dlslColors1();">DLSL Colors
                          1</label></li>
                      <li><label class="change-theme-button" id="change-config2-bp" onclick="dlslColors2();">DLSL Colors
                          2</label></li>
                      <li><label class="change-theme-button" id="change-config3-bp" onclick="neutralTextBox();">Neutral
                          Textbox</label></li>
                      <li><label class="change-theme-button" id="change-config4-bp" onclick="bpwCentered();">Centered
                          Botpress Branding</label></li>
                      <li><label class="change-theme-button" id="change-config5-bp" onclick="bpwTall();">Tall
                          Chatbox</label></li>
                      <li><label class="change-theme-button" id="enable-dark-theme" onclick="toggleDarkTheme();">Toggle
                          dark theme</label></li> <!-- toggleDarkTheme() function at the bottom; around line 930 --->
                    </ul>
                  </li>
                </div>
                <div class="sub2">
                  <li><label>Accessibility</label></li>
                  <li>
                    <ul class="suboption">
                      <li><label class="accessibility-option" id="zoomInChatbot" onclick="zoom();">Zoom-in
                          Chatbot</label></li>
                      <li><label class="accessibility-option" id="enableHighContrast" onclick="highContrast();">High
                          Contrast</label></li>
                    </ul>
                  </li>
                </div>
              </ul>
            </li>

            <!--
                <li id="nav_messages">
                <a href="#/messages/"><i class="zmdi zmdi-collection-text"></i> Messages</a>
                </li>
              -->
          </ul>
        </div>
        <div class="scroll-element scroll-x" style="">
          <div class="scroll-element_outer">
            <div class="scroll-element_size"></div>
            <div class="scroll-element_track"></div>
            <div class="scroll-bar" style="width: 100px;"></div>
          </div>
        </div>
        <div class="scroll-element scroll-y" style="">
          <div class="scroll-element_outer">
            <div class="scroll-element_size"></div>
            <div class="scroll-element_track"></div>
            <div class="scroll-bar" style="height: 99px;"></div>
          </div>
        </div>
      </div>
    </aside>

    <section class="content" id="stage">
      <div class="row groups">
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_110" href="https://59thfoundation.dlsl.edu.ph/?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(110);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(1).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>59th Foundation</strong>
                <small style="font-size:auto;">Beyond Borders</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_79" href="https://wps.dlsl.edu.ph/index.php/dlsl-appointment/?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(79);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(2).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Appointment System</strong>
                <small style="font-size:auto;">for Fetching of Left Belongings</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_53" href="https://mydcampus.dlsl.edu.ph/#/digitalservices/:assessment" onclick="logaccess(53);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(3).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Assessment Form</strong>
                <small style="font-size:auto;">Viewing of Assessment</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 " style="display: none;">
          <div class="groups__item" style="max-height:200px;"><a id="module_106" onclick="">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(4).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Assessment<br>SHS Term Break <br> 20-21</strong>
                <small style="font-size:auto;">for old students only</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_11" href="https://dlsl.instructure.com/?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(11);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(5).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Canvas LMS</strong>
                <small style="font-size:auto;">Learning Management System </small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_116" href="https://mydcampus.dlsl.edu.ph/#/digitalservices/:class_schedule_college" onclick="logaccess(116);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(6).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Class Schedule - College </strong>
                <small style="font-size:auto;">Cycle 1 &amp; 2 - SY22-23</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_54" href="https://mydcampus.dlsl.edu.ph/#/digitalservices/:cor" onclick="logaccess(54);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(7).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Confirmation</strong>
                <small style="font-size:auto;">of Enrollment</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_111" href="https://mydcampus.dlsl.edu.ph/#/digitalservices/:curriculum" onclick="logaccess(111);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(8).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Curriculum</strong>
                <small style="font-size:auto;">DLSL College Curriculum</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_68" href="https://www.dlsl.edu.ph/?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(68);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(9).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>De La Salle Lipa</strong>
                <small style="font-size:auto;">Borderfree Education</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_10" href="https://mail.google.com/?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(10);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(10).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>DLSL Email</strong>
                <small style="font-size:auto;">De La Salle Lipa Official Email Engine</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_117" href="https://mydcampus.dlsl.edu.ph/modules/health_declaration/?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(117);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(11).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Health Declaration</strong>
                <small style="font-size:auto;">Form</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_49" href="https://support.dlsl.edu.ph/kb?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(49);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(12).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>ICT Support</strong>
                <small style="font-size:auto;">Instruction Manuals</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 " style="display: none;">
          <div class="groups__item" style="max-height:200px;"><a id="module_107" onclick="">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(13).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>IS Student Orientation</strong>
                <small style="font-size:auto;">2021-2022</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_4" href="https://lors.dlsl.edu.ph/modules/login/sso.php?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(4);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(14).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>LORS</strong>
                <small style="font-size:auto;">Library Online Reservation System</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_34" href="https://m-hub.dlsl.edu.ph/modules/login/sso.php?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(34);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(15).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>M-Hub</strong>
                <small style="font-size:auto;">M-Hub Online Reservation System</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_66" href="https://portal.office.com/?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(66);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(16).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Microsoft Office365</strong>
                <small style="font-size:auto;">Word,Excel,Powerpoint,Teams, and more</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_9" href="https://mydcampus.dlsl.edu.ph/#/digitalservices/:soa" onclick="logaccess(9);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(17).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>My SOA</strong>
                <small style="font-size:auto;">Student Statement Of Account (SOA)</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_6" href="https://nors.dlsl.edu.ph/labs/modules/login/?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(6);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(18).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Nexus Labs</strong>
                <small style="font-size:auto;">Reserve NEXUS labs facilities here.</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_109" href="https://evaluation.dlsl.edu.ph/?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(109);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(19).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Online Evaluation of Faculty</strong>
                <small style="font-size:auto;">D O E S</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_67" href="https://mydcampus.dlsl.edu.ph/#/digitalservices/:studentinv?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(67);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(20).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Student</strong>
                <small style="font-size:auto;">Individual Inventory</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_39" href="https://mydcampus.dlsl.edu.ph/#/digitalservices/:view_grades" onclick="logaccess(39);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(21).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Viewing of Grades</strong>
                <small style="font-size:auto;">Student</small>
              </div>
            </a>
          </div>
        </div>
      </div>
      <hr style="background-color:#e0e3e4">
      <br>
      <header class="content__title">
        <h1>Library Online Subscriptions</h1>
      </header>

      <div class="row groups">
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_56" href="http://dlm.dlsl.edu.ph/common/welcome.jsp?site=201?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(56);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(22).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Follett</strong>
                <small style="font-size:auto;">Follett</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_59" href="https://search.proquest.com/?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(59);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(23).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>ProQuest</strong>
                <small style="font-size:auto;">ProQuest</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_60" href="https://worldbookonline.com/wb/Login?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(60);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(24).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>World Book</strong>
                <small style="font-size:auto;">World Book</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_62" href="https://www.nytimes.com/?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(62);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(25).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>The New York Times</strong>
                <small style="font-size:auto;">The New York Times</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_71" href="http://search.ebscohost.com/?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(71);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(26).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>EBSCOhost</strong>
                <small style="font-size:auto;">EBSCOhost</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_85" href="https://drive.google.com/file/d/1iazJIGQARDi_nbE6T4lHUpJXAdEpXihX/view?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(85);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(27).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>OER Links and</strong>
                <small style="font-size:auto;">Curated Resource List</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_86" href="https://drive.google.com/file/d/1vp5hMrV7f7ZHpjZA_VBwYo0LMNyMiKHs/view?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(86);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(28).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>Resource List</strong>
                <small style="font-size:auto;">of E-Books</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_87" href="https://dlsl.instructure.com/courses/15705/pages/is-digital-reference-and-information-services-digiris?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(87);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(29).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>ISLRC VILP</strong>
                <small style="font-size:auto;">for Grades 1 to 10</small>
              </div>
            </a>
          </div>
        </div>
        <div class="col-xl-2 col-lg-3 col-sm-4 col-6 ">
          <div class="groups__item" style="max-height:200px;"><a id="module_88" href="https://dlsl.instructure.com/courses/15705/pages/college-digital-reference-and-information-services-digiris?client_id=YXpzS2ZTTzl3ekt1ZFNCeHNhVlVxeTNSV3ZzL1FBTnpuYjhrMXlVenRPdz0=" target="_blank" onclick="logaccess(88);">
              <div class="groups__img">
                <img class="avatar-img" src="./My DCampus Portal_files/logo(30).png" style="height:5em;width:5em;">
              </div>
              <div class="groups__info">
                <strong>College</strong>
                <small style="font-size:auto;">VILP</small>
              </div>
            </a>
          </div>
        </div>
      </div>

      <!-- chatbot integration -->
      <!-- CHATBOT SCRIPT AT THE BOTTOM OF THE PAGE -->
      <link rel="stylesheet" href="/assets/modules/channel-web/examples/parent.css" type="text/css" />
      <base href="/" />
      <!-- Object.assign polyfill (required for IE) -->
      <script src="assets/modules/channel-web/object_assign.js"></script>
      <script src="assets/modules/channel-web/inject.js"></script>
    </section>
    <!--
        <footer class="footer hidden-xs-down">
        <p>De La Salle Lipa :: My D-Campus Portal 2018.</p>

        <ul class="nav footer__nav">
        <a class="nav-link" href="#">Support</a>
        <a class="nav-link" href="#">News</a>
        </ul>
        </footer>
      -->
    <div id="search_stage_wrapper" class="fademe">
      <div class="content__inner"><a id="close_search">BACK TO PAGE</a>
      </div>
    </div>
  </main>

  <div class="modal fade" id="modal-onboard" tabindex="-1">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title"><b>Let's Get You Started!</b></h4>
        </div>
        <div class="modal-body" style="min-height:400px;">
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modal-feedback">
    <div class="modal-dialog ">
      <div class="modal-content">
        <div class="">
          <style>
            .cc-selector input {
              margin: 0;
              padding: 0;
              -webkit-appearance: none;
              -moz-appearance: none;
              appearance: none;
            }

            .cc-selector-2 input {
              position: absolute;
              z-index: 999;
            }

            .furious {
              background-image: url(modules/feedback/emoji/1.png);
            }

            .sad {
              background-image: url(modules/feedback/emoji/2.png);
            }

            .normal {
              background-image: url(modules/feedback/emoji/3.png);
            }

            .happy {
              background-image: url(modules/feedback/emoji/4.png);
            }

            .brilliant {
              background-image: url(modules/feedback/emoji/5.png);
            }

            .cc-selector-2 input:active+.optioncard-cc,
            .cc-selector input:active+.optioncard-cc {
              opacity: .9;
            }

            .cc-selector-2 input:checked+.optioncard-cc,
            .cc-selector input:checked+.optioncard-cc {
              -webkit-filter: none;
              -moz-filter: none;
              filter: none;
            }

            .optioncard-cc {
              cursor: pointer;
              background-size: contain;
              background-repeat: no-repeat;
              display: inline-block;
              width: 70px;
              height: 70px;
              text-align: center;
              vertical-align: bottom;
              -webkit-transition: all 100ms ease-in;
              -moz-transition: all 100ms ease-in;
              transition: all 100ms ease-in;
              -webkit-filter: brightness(1) grayscale(1) opacity(.7);
              -moz-filter: brightness(1) grayscale(1) opacity(.7);
              filter: brightness(1) grayscale(1) opacity(.7);
            }

            .optioncard-cc:hover {
              -webkit-filter: brightness(.8) grayscale(.5) opacity(.9);
              -moz-filter: brightness(.8) grayscale(.5) opacity(.9);
              filter: brightness(.8) grayscale(.5) opacity(.9);
            }

            /* Extras */
            a:visited {
              color: #888
            }

            a {
              color: #444;
              text-decoration: none;
            }

            p {
              margin-bottom: .3em;
            }

            * {
              font-family: 'Poppins';
            }

            .cc-selector-2 input {
              margin: 5px 0 0 12px;
            }

            .cc-selector-2 label {
              margin-left: 7px;
            }

            span.cc {
              color: #6d84b4
            }
          </style>
          <div id="modal-feedback__title">Your opinion is important to us</div>
        </div>

        <form class="feedback__form">
          <div class="modal-body">
            <h5 id="modal_label" class="modal-title text-success">How was your D-Campus Portal experience today?</h5>
            <div class="cc-selector" style="text-align:center;">
              <input checked="checked" id="furious" type="radio" name="option-card" value="furious">
              <label class="optioncard-cc furious" for="furious"></label>
              <input checked="checked" id="sad" type="radio" name="option-card" value="sad">
              <label class="optioncard-cc sad" for="sad"></label>
              <input checked="checked" id="normal" type="radio" name="option-card" value="normal">
              <label class="optioncard-cc normal" for="normal"></label>
              <input checked="checked" id="happy" type="radio" name="option-card" value="happy">
              <label class="optioncard-cc happy" for="happy"></label>
              <input id="brilliant" type="radio" name="option-card" value="brilliant">
              <label class="optioncard-cc brilliant" for="brilliant"></label>
            </div>
            <h5 id="modal_label" class="modal-title text-success">Tell us what you think:</h5><span id="selectedvalue"></span>
            <textarea style="width:100%;"></textarea>
          </div>

          <div class="modal-footer" style="border-top:1px solid #e5e5e5;">
            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-link feedback__send waves-effect">Send</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <input type="hidden" id="last_notif_id">
  <dashboardcache style="display:none;">Please Wait...</dashboardcache>
  <newsandeventscache style="display:none;">Please Wait...</newsandeventscache>

  <!-- chatbot script -->
  <!-- style for first time pop up message for user -->
  <style>
    .bp-widget-widget {
      width: 50em !important;
      height: 6em !important;
    }
  </style>


  <script>
    function parseQuery(queryString) {
      const query = {}
      const pairs = (queryString[0] === '?' ? queryString.substr(1) : queryString).split('&')
      for (let i = 0; i < pairs.length; i++) {
        const pair = pairs[i].split('=')
        query[decodeURIComponent(pair[0])] = decodeURIComponent(pair[1] || '')
      }
      return query
    }

    const params = parseQuery(window.location && window.location.search)
    const botId = (params && params.botId) || 'welcome-bot'

    let userId
    let webchatOpen = false
    let darkThemeFlag = false
    let currentTheme = 1

    let lastConfig = {
      host: window.location.origin || 'http://localhost:3000',
      botId: botId,
      lazySocket: false,
      botName: "MyDBuddy",
      botConvoDescription: 'Online',
      enableReset: false,
      enablePersistHistory: false,
      enableResetSessionShortcut: false,
      showConversationsButton: false,
      /*
      To change the styling of the webchat, you can either edit directly default.css, or use the extraStylesheet property.
      This allows you to customize the chat on a per-bot basis.
    */
      extraStylesheet: 'assets/modules/channel-web/examples/Themes/Dark_Green_Input/custom.css',
    }

    window.botpressWebChat.init(lastConfig)

    window.addEventListener("message", function(event) {
      if (event.data.name === "webchatReady") {
        window.botpressWebChat.sendEvent({
          type: "proactive-trigger",
          channel: "web",
        })
      }
    })

    localStorage.clear(); /* resets the random key of the user stored in the localstorage */

    // document.getElementById('origin').innerText = window.location.origin
  </script>

  <!-- Script for enabling dark theme; referenced at sidebar navigation; reference around line 200 -->
  <script>
    let darkThemeOn = false;

    function toggleDarkTheme() {
      //checks if darkTheme is already enabled
      if (document.getElementById('darkTheme')) {
        let element = document.getElementById('darkTheme');
        element.remove();

        element = frames[0].document.getElementById('darkTheme');
        element.remove();
      } else {
        const darkStyle = document.createElement('style'); //darkStyle for website; darkStyleBpw for chatbox
        darkStyle.setAttribute("id", "darkTheme");
        const darkStyleBpw = frames[0].document.createElement('style');
        darkStyleBpw.setAttribute("id", "darkTheme");

        darkStyle.innerHTML = `
		    :root {
			    --darkest: #1B1E1F;
			    --darker: #5B6367;
			    --dark: #CCC7C0;
		    }
		    header.header, .groups-item, .row, .groups, .row img, .user__name, hr, .navigation{
			    filter:invert(0.91) hue-rotate(180deg);
		    }
		    html, section.content{
			    background-color: var(--darkest);
		    }
            `;

        if (highContrastFlag == false) {
          darkStyleBpw.innerHTML = `
		      /* Dark Theme CSS overrides */
		      :root {
			      --darkest: #1B1E1F;
			      --darker: #5B6367;
			      --dark: #CCC7C0;
		      }

		      /* Track */
		      ::-webkit-scrollbar-track {
			      background: var(--darkest); 
		      }
		       
		      /* Handle */
		      ::-webkit-scrollbar-thumb {
			      background: var(--darker); 
			      border-radius: 10px;
		      }

		      /* Handle on hover */
		      ::-webkit-scrollbar-thumb:hover {
			      background: var(--dark); 
		      }

		      .bpw-layout {
			      background-color: var(--darkest);
		      }

		      .bpw-keyboard-quick_reply {
			      background-color: var(--darkest);
			      border-color: var(--darker);
		      }

		      .bpw-from-bot .bpw-chat-bubble .bpw-chat-bubble-content{
			      background-color: #282828;
			      color: white;
			      -webkit-box-shadow: 0 1px 2px rgb(255 255 255 / 25%);
			      -moz-box-shadow: 0 1px 2px rgb(255 255 255 / 25%);
		      }

		      .bpw-from-bot .bpw-chat-bubble .bpw-chat-bubble-content{
			      -webkit-box-shadow: 0 1px 2px rgb(146 146 146 / 25%);
			      -moz-box-shadow: 0 1px 2px rgb(146 146 146 / 25%);
		      }

		      .bpw-button {
			      filter:invert(0.95) hue-rotate(180deg);
		      }

		      .bpw-send-buttons {
			      filter:invert(0.90) hue-rotate(180deg);
		      }

		      .bpw-composer {
			      border-top-color: var(--darker);
		      }

		      .css-1pcexqc-container {
			      filter:invert(0.90) hue-rotate(180deg);
		      }
		      `;
        }

        document.head.appendChild(darkStyle); //append style to head (site)
        frames[0].document.body.appendChild(darkStyleBpw); //append style to body for the styles to take precedence (chatbot)
        darkThemeOn = true;
      }
    }
  </script>

  <!-- Accessibility function for users with poor eyesight -->
  <script>
    //inital zoom values
    let scalePoint = 1.05; //level of scale css property
    let scaleBot = 37; //bottom coords of chatbox
    let scaleRight = 22; //right offset of chatbox
    let zoomMultiNum = 0; //the multiplier number to append to the zoomMultiplier string
    let zoomMultiplier;
    let importantProperty = "!important";

    function zoom() {
      if (tallFlag == false) {
        if (frames[0].document.getElementById('zoomLevels')) { //removes previous zoomLevels to avoid style buildup
          element = frames[0].document.getElementById('zoomLevels');
          element.remove();
        }

        const zoomLevels = frames[0].document.createElement('style'); //creates a style tag inside the botpress iframe
        zoomLevels.setAttribute("id", "zoomLevels");

        zoomMultiNum++;
        zoomMultiplier = "(" + zoomMultiNum + "x)"; //increase zoom multiplier frontend label

        if (scalePoint > 1.20) {
          /* maximum scalePoint should be less than 1.20 so the iframe doesnt break */
          //reset all values when maximum zoom is reached
          zoomMultiNum = 0;
          zoomMultiplier = "";
          scaleBot = 15;
          scaleRight = 15;
          scalePoint = 1;
          importantProperty = "";
        }

        //scale css
        zoomLevels.innerHTML = `
				  .bpw-layout, .bpw-chat-container {
					  transform: scale(` + scalePoint + `) !important;
					  -webkit-transform: scale(` + scalePoint + `) !important;
					  -ie-transform: scale(` + scalePoint + `) !important;
					  -moz-transform: scale(` + scalePoint + `) !important;
					  bottom: ` + scaleBot + `px ` + importantProperty + `;
					  right: ` + scaleRight + `px ` + importantProperty + `;
				  }
			    `;
        frames[0].document.head.appendChild(zoomLevels);
        scalePoint = scalePoint + 0.05; //increment level of zoom
        scaleBot = scaleBot + 19; //adjust bottom coordinates with scale
        scaleRight = scaleRight + 9;

        const elem = document.getElementById('zoomInChatbot');
        elem.innerHTML = `Zoom-In Chatbot ` + zoomMultiplier;
        importantProperty = "!important";
      } else
        alert("Sorry! Zoom option is not available when Tall option is enabled!");
    }
  </script>

  <!-- Theme change options -->
  <script>
    let neutral = false; //neutral textbox state
    let neutralStyle;

    function dlslColors2() {
      if (highContrastFlag == false) {
        if (frames[0].document.getElementById('dlslColors2'))
          dlslColors1(); //multipurposing function to remove previous dlslColors2 style to avoid buildup

        const colors2 = frames[0].document.createElement('style');
        colors2.setAttribute("id", "dlslColors2");

        //if else statement to detect whether neutral textbox is on to include/exclude from background-color
        if (neutral == true)
          neutralStyle = " ";

        else
          neutralStyle = ", .bpw-composer textarea";

        colors2.innerHTML = `
			    :root {
				    --dlsl_dark: #007136;
				    --dlsl_mid: #005A35;
				    --dlsl_light: #00A45E;
			    }

			    .bpw-powered, .bpw-widget-btn,
			    .bpw-from-user .bpw-chat-bubble, .bpw-from-user .bpw-chatbubble .bpw-chatbubble-content,
			    .bpw-from-user .bpw-chat-bubble .bpw-chat-bubble-content,
			    .bpw-bubble-undefined bpw-chat-bubble bpw-bubble-text,
			    .bpw-header-container` + neutralStyle + `{
				    background-color: var(--dlsl_light);
			    }
			    `;
        frames[0].document.body.appendChild(colors2);

        //sneaky fix to keep the input color consistent to the DLSL color theme by appending a style in between the linked stylesheets and the neutral input stylesheet
        const targetDiv = frames[0].document.getElementById('input-message');
        targetDiv.insertAdjacentHTML('afterend', '<style id="colors2Input">.bpw-composer textarea { background-color: var(--dlsl_light); } </style>');
      } else
        alert("DLSL Colors 2 is not available in High Contrast mode!");
    }

    //function to remove dlslColors2 Style
    function dlslColors1() {
      element = frames[0].document.getElementById('dlslColors2');
      element.remove();

      element = frames[0].document.getElementById('colors2Input'); //colors2Input ID referenced by targetDiv 8 lines above this line
      element.remove();
    }

    //function for toggling neutralTextBox
    function neutralTextBox() {
      if (highContrastFlag == false) {
        let darkThemeStyle; //variable used for the border-top-color fix (makes border color more consistent when neutral text box is toggled)
        const neutralText = frames[0].document.createElement('style');
        neutralText.setAttribute("id", "neutralText");

        if (darkThemeOn == true)
          darkThemeStyle = ".bpw-composer { border-top-color: #5b6367 };";

        else
          darkThemeStyle = " ";

        if (neutral == false) { //if neutral textbox isn't on, apply these css rules
          neutralText.innerHTML = `
				    .bpw-composer {
				      height: auto;
				      background: none;
				      border-top-width: 1px;
				      border-top-style: solid;
				      border-top-color: #dcdcdc;
				    }

				    .bpw-composer textarea {
				      height: auto;
				      max-height: 7em;
				      padding: 1em;;
				      line-height: 1.2em;
				      color: black;
				      background: none;
				    }

				    ::-webkit-input-placeholder { /* Chrome/Opera/Safari */
				      color: #707070;
				    }
				    ::-moz-placeholder { /* Firefox 19+ */
				      color: #707070;
				    }
				    :-ms-input-placeholder { /* IE 10+ */
				      color: #707070;
				    }
				    :-moz-placeholder { /* Firefox 18- */
				      color: #707070;
				    }

				    ` + darkThemeStyle;
          neutral = true;

          frames[0].document.body.appendChild(neutralText); //appends to body for the styles to take precedence
        } else {
          element = frames[0].document.getElementById('neutralText'); //toggles neutral text box off
          element.remove();
          neutral = false;
        }
      } else
        alert("Neutral Text Box not available in High Contrast mode!")
    }

    //function to toggle centered footer
    function bpwCentered() {
      const centered = frames[0].document.createElement('style');
      centered.setAttribute("id", "bpwCentered");

      if (!frames[0].document.getElementById('bpwCentered')) {
        centered.innerHTML = `
					  .bpw-powered {
						  text-align: center;
					  }
				  `;
        frames[0].document.body.appendChild(centered); //append to body to take precedence
      } else {
        element = frames[0].document.getElementById('bpwCentered');
        element.remove();
      }
    }

    //toggles tall theme option
    let tallFlag = false;

    function bpwTall() {
      if (zoomMultiNum == 0) {
        const tall = frames[0].document.createElement('style');
        tall.setAttribute("id", "bpwTall");

        let tallPercent = 100;

        if (zoomMultiNum == 0)
          tallPercent = 100;

        else if (zoomMultiNum == 1)
          tallPercent = 95;

        else if (zoomMultiNum == 2)
          tallPercent = 90;

        else if (zoomMultiNum == 3)
          tallPercent = 85;

        if (!frames[0].document.getElementById('bpwTall')) {
          tall.innerHTML = `
					    .bpw-layout {
					      height: ` + tallPercent + `%;
					      bottom: 0px !important;
					      right: 0px !important;
					      border-radius: 0px;
					    }
				    
					    .bpw-header-container {
						    border-radius: 0;
					    }
					    
					    .bpw-powered {
						    border-radius: 0;
					    }
				    `;
          frames[0].document.body.appendChild(tall); //append to body to take precedence
          tallFlag = true;
        } else {
          element = frames[0].document.getElementById('bpwTall');
          element.remove();
          tallFlag = false;
        }
      } else
        alert("Sorry! Tall option is not available when Zoom is enabled!")
    }
  </script>

  <script>
    document.getElementById('bp-widget').onload = function() {
      const popMessage = frames[0].document.getElementById('app');
      popMessage.insertAdjacentHTML('afterend', '<div id="popUpMessage" class="talk-bubble tri-right round right-in bounce2"><div id="talktext"><p>Welcome to MyDCampus DLSL. Click here!</p></div></div>');
    };
  </script>

  <!-- Dynamic Chatbox JS Injection into iframe; Hide pop up -->
  <script>
    window.onload = function() {
      const dynamicChatbox = frames[0].document.createElement('script'); //injects a script tag to put inside the iframe

      dynamicChatbox.innerHTML = `
			  //Dynamic Chatbox
			  function getScrollHeight(elm){
			    var savedValue = elm.value
			    elm.value = ''
			    elm._baseScrollHeight = elm.scrollHeight
			    elm.value = savedValue
			  }

			  function onExpandableTextareaInput({ target:elm }){
			    // make sure the input event originated from a textarea and it's desired to be auto-expandable
			    if( !elm.nodeName == 'TEXTAREA' ) return

			    var minRows = elm.getAttribute('data-min-rows')|2, rows;
			    !elm._baseScrollHeight && getScrollHeight(elm)

			    elm.rows = minRows
			    rows = Math.ceil((elm.scrollHeight - elm._baseScrollHeight) / 16)
			    elm.rows = minRows + rows
			  }

			  // global delegated event listener
			  document.addEventListener('input', onExpandableTextareaInput)
			  
			  //-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-//
			    
			  //Hide popup message on button click
			  document.body.onclick = function(e) {
          var clickedEl = window.event ? event.srcElement : e.target;
          while (clickedEl != null) {
            if (clickedEl.className != -1) {
                if (document.getElementById('popUpMessage')) {
                  let element = document.getElementById('popUpMessage');
                  element.remove();
                }
                return;
            }
            clickedEl = clickedEl.parentNode;
          }
        }
			  `
      frames[0].document.body.appendChild(dynamicChatbox);
    }

    let highContrastFlag = false;

    function highContrast() {
      if (frames[0].document.getElementById('high-contrast')) {
        let element = frames[0].document.getElementById('high-contrast');
        element.remove();
        highContrastFlag = false;
      } else {
        if (frames[0].document.getElementById('darkTheme')) {
          element = frames[0].document.getElementById('darkTheme');
          element.remove();
        }

        if (frames[0].document.getElementById('dlslColors2')) {
          element = frames[0].document.getElementById('dlslColors2');
          element.remove();
        }

        if (frames[0].document.getElementById('neutralText')) {
          element = frames[0].document.getElementById('neutralText');
          element.remove();
        }

        if (frames[0].document.getElementById('colors2Input')) {
          element = frames[0].document.getElementById('colors2Input');
          element.remove();
        }

        const contrast = frames[0].document.createElement('style');
        contrast.setAttribute("id", "high-contrast");

        //if else statement to detect whether neutral textbox is on to include/exclude from background-color
        if (neutral == true)
          neutralStyle = " ";

        else
          neutralStyle = ", .bpw-composer textarea";

        contrast.innerHTML = `
			    :root {
				    --dlsl_dark: #00B859;
				    --dlsl_mid: #005A35;
				    --dlsl_light: #00A45E;
			    }

			    .bpw-powered, .bpw-header-name, .bpw-header-subtitle, .bpw-widget-btn, 
			    .bpw-from-user .bpw-chat-bubble, .bpw-from-user .bpw-chatbubble .bpw-chatbubble-content,
			    .bpw-from-user .bpw-chat-bubble .bpw-chat-bubble-content,
			    .bpw-bubble-undefined bpw-chat-bubble bpw-bubble-text,
			    .bpw-header-container` + neutralStyle + `{
				    background-color: var(--dlsl_dark);
				    color: #000000;
			    }

			    .bpw-powered a {
			      color: #000000;
			    }
			    
		      /* High Contrast CSS overrides */
		      :root {
			      --darkest: #000000;
			      --darker: #5B6367;
			      --dark: #CCC7C0;
		      }

		      /* Track */
		      ::-webkit-scrollbar-track {
			      background: var(--darkest); 
		      }
		       
		      /* Handle */
		      ::-webkit-scrollbar-thumb {
			      background: #FFFFFF; 
			      border-radius: 10px;
		      }

		      /* Handle on hover */
		      ::-webkit-scrollbar-thumb:hover {
			      background: var(--dark); 
		      }

		      .bpw-layout {
			      background-color: var(--darkest);
		      }

		      .bpw-keyboard-quick_reply {
			      background-color: var(--darkest);
			      border-color: var(--darker);
		      }

		      .bpw-from-bot .bpw-chat-bubble .bpw-chat-bubble-content{
			      background-color: #FFFFFF;
			      color: #000000;
			      -webkit-box-shadow: 0 1px 2px rgb(255 255 255 / 25%);
			      -moz-box-shadow: 0 1px 2px rgb(255 255 255 / 25%);
		      }

		      .bpw-from-bot .bpw-chat-bubble .bpw-chat-bubble-content{
			      -webkit-box-shadow: 0 1px 2px rgb(146 146 146 / 25%);
			      -moz-box-shadow: 0 1px 2px rgb(146 146 146 / 25%);
		      }

		      .bpw-button {
			      filter:invert(0.95) hue-rotate(180deg);
		      }

		      .bpw-send-button {
		        color: var(--dlsl_dark);
		        background-color: var(--darkest);
		      }
		      
		      .bpw-send-button:hover {
		        background-color: #FFFFFF;
		      }

		      .bpw-composer {
			      border-top-color: var(--darker);
		      }
		      
				  ::-webkit-input-placeholder { /* Chrome/Opera/Safari */
				    color: var(--darkest);
				  }
				  ::-moz-placeholder { /* Firefox 19+ */
				    color: var(--darkest);
				  }
				  :-ms-input-placeholder { /* IE 10+ */
				    color: var(--darkest);
				  }
				  :-moz-placeholder { /* Firefox 18- */
				    color: var(--darkest);
				  }
			    `;
        frames[0].document.body.appendChild(contrast);
        highContrastFlag = true;
      }
    }
  </script>
</body>

</html>
