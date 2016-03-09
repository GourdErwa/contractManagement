<%--
  Created by IntelliJ IDEA.
  User: HuKaiMo
  Date: 2016/3/9
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>登录</title>

    <link href="./../../resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }

        .form-signin {
            margin-top: 100px;
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }

        .form-signin .form-signin-heading,
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }

        .form-signin .form-control:focus {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }


    </style>
</head>

<script>
    (function () {
        'use strict';

        function emulatedIEMajorVersion() {
            var groups = /MSIE ([0-9.]+)/.exec(window.navigator.userAgent)
            if (groups === null) {
                return null
            }
            var ieVersionNum = parseInt(groups[1], 10)
            return Math.floor(ieVersionNum)
        }

        function actualNonEmulatedIEMajorVersion() {
            // Detects the actual version of IE in use, even if it's in an older-IE emulation mode.
            // IE JavaScript conditional compilation docs: https://msdn.microsoft.com/library/121hztk3%28v=vs.94%29.aspx
            // @cc_on docs: https://msdn.microsoft.com/library/8ka90k2e%28v=vs.94%29.aspx
            var jscriptVersion = new Function('/*@cc_on return @_jscript_version; @*/')() // jshint ignore:line
            if (jscriptVersion === undefined) {
                return 11; // IE11+ not in emulation mode

            }
            if (jscriptVersion < 9) {
                return 8; // IE8 (or lower; haven't tested on IE<8)
            }
            return jscriptVersion; // IE9 or IE10 in any mode, or IE11 in non-IE11 mode
        }

        var ua = window.navigator.userAgent;
        if (ua.indexOf('Opera') > -1 || ua.indexOf('Presto') > -1) {
            return; // Opera, which might pretend to be IE
        }
        var emulated = emulatedIEMajorVersion();
        if (emulated === null) {
            return; // Not IE
        }
        var nonEmulated = actualNonEmulatedIEMajorVersion()

        if (emulated !== nonEmulated) {
            window.alert('WARNING: You appear to be using IE' + nonEmulated + ' in IE' + emulated + ' emulation mode.\nIE emulation modes can behave significantly differently from ACTUAL older versions of IE.\nPLEASE DON\'T FILE BOOTSTRAP BUGS based on testing in IE emulation modes!')
        }
    })();

    (function () {
        'use strict';

        if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
            var msViewportStyle = document.createElement('style')
            msViewportStyle.appendChild(
                    document.createTextNode(
                            '@-ms-viewport{width:auto!important}'
                    )
            );
            document.querySelector('head').appendChild(msViewportStyle)
        }

    })();
</script>
<body>

<div class="container">

    <form class="form-signin">
        <h2 class="form-signin-heading">登录</h2>
        <label for="userName" class="sr-only">用户名</label>
        <input type="text" id="userName" class="form-control" placeholder="用户名" required autofocus>
        <label for="passWd" class="sr-only">密码</label>
        <input type="password" id="passWd" class="form-control" placeholder="密码" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    </form>

</div> <!-- /container -->

</body>
</html>
