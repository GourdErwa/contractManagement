<%--
  Created by IntelliJ IDEA.
  User: wei.Li
  Date: 16/3/11
  Time: 下午11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="<%=basePath%>favicon.ico">


<script src="<%=basePath%>resource/js/jquery.min.js"></script>
<script src="<%=basePath%>resource/bootstrap/js/bootstrap.min.js"></script>

<link href="<%=basePath%>resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>resource/css/jumbotron-narrow.css" rel="stylesheet">
<link href="<%=basePath%>resource/dataTables/jquery.dataTables.min.css" rel="stylesheet">
<script src="<%=basePath%>resource/dataTables/jquery.dataTables.min.js"></script>

<div id="msgModel" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h5 class="modal-title">
                    提示
                </h5>
            </div>
            <div id="msgModelBody" class="modal-body" style="text-align: center">
            </div>
        </div>
    </div>
</div>

<script>

    /**
     * 模态框展示提示信息
     * @type {{showMsg: MSG."showMsg"}}
     */
    var MSG = {
        "showMsg": function (msg) {
            $("#msgModelBody").empty().append(msg);
            $("#msgModel").modal("toggle");
        }
    };


    var reload = function () {
        window.location.reload()
    };

    (function ($) {
        var _ajax = $.ajax;
        $.ajax = function (opt) {
            var fn = {
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                },
                success: function (data, textStatus) {
                }
            };
            if (opt.error) {
                fn.error = opt.error;
            }
            if (opt.success) {
                fn.success = opt.success;
            }
            //扩展增强处理
            var _opt = $.extend(opt, {
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    fn.error(XMLHttpRequest, textStatus, errorThrown);
                    MSG.showMsg(textStatus);
                },
                success: function (data, textStatus) {
                    fn.success(data, textStatus);
                }
            });
            _ajax(_opt);
        };
    })(jQuery);
</script>
