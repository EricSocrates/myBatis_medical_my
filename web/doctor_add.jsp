<%--
  Created by IntelliJ IDEA.
  User: Yy
  Date: 2019/1/24
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增医师</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <style>

    </style>
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>新增医师信息</h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal" id="addDoctor" method="post" action="doctor">
                        <input type="hidden" class="form-control" id="method" name="method" value="addDoctor">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="dname">姓名</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="dname" name="dname" autocomplete="off">
                                <span class="help-block m-b-none"></span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别
                            </label>
                            <div class="col-sm-10">
                                <div class="radio i-checks">
                                    <label>
                                        <input type="radio" value="0" name="dsex"> <i></i>女</label>
                                </div>
                                <div class="radio i-checks">
                                    <label>
                                        <input type="radio" checked="" value="1" name="dsex"> <i></i>男</label>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="phone">联系方式</label>
                            <div class="col-sm-5">
                                <input type="tel" class="form-control" id="phone" name="phone" autocomplete="off">
                                <span class="help-block m-b-none"></span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">所属科室&职务级别</label>

                            <div class="col-sm-5">
                                <select class="form-control m-b" name="department" id="department"
                                        onchange="onDepartmentChanged(this.value)">

                                </select>
                                <select class="form-control m-b" name="position" id="position">
                                    <option>===请选择职务级别===</option>
                                </select>
                                <span class="help-block m-b-none"></span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <button class="btn btn-white" type="reset">重填</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>

<!-- iCheck -->
<script src="js/plugins/iCheck/icheck.min.js"></script>

<!-- jQuery Validation plugin javascript-->
<script src="js/plugins/validate/jquery.validate.min.js"></script>
<script src="js/plugins/validate/messages_zh.min.js"></script>
<script src="js/demo/form-validate-demo.js"></script>
<script src="js/jquery.form.js"></script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green'
        });
        $.post("doctor", "method=queryAllDepartment", function (msg) {
            let opt = "<option value='" + 0 + "'>===请选择所属科室===</option>";
            $.each(msg, function (i, dept) {
                opt += "<option value='" + dept.department + "'>" + dept.department + "</option>"
            });
            $("#department").html(opt);
        }, "json");

        $("#addDoctor").validate({
            errorElement: "span",
            errorPlacement: function (error, element) {
                error.appendTo(element.next());
            },
            rules: {
                dname: {
                    required: true
                },
                phone: {
                    required: true,
                    checkPhone: true
                },
                position: {
                    checkPosition: true
                }
            },
            messages: {
                dname: {
                    required: "姓名不能为空"
                },
                phone: {
                    required: "联系方式不能为空"
                }
            },
            success: function (span) {
                span.html("<i class=\"fa fa-check\"></i>验证成功");
            },
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    datatype: "text",
                    success: function (msg) {
                        console.log(msg);
                        if (msg == "success") {
                            alert("添加成功！");
                            window.location.href = "doctor_list.jsp";
                        } else if (msg == "fail") {
                            alert("抱歉，医生姓名重复！");
                            window.location.href = "doctor_add.jsp";
                        }
                    },
                    error: function (err) {
                        console.log(err);
                    }
                });
            }
        });
        jQuery.validator.addMethod("checkPhone", function (value, element) {
            var tel = /^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\d{8}$/;
            return this.optional(element) || (tel.test(value));
        }, "请填写正确的联系方式");
        jQuery.validator.addMethod("checkPosition", function (value, element) {
            return this.optional(element) || (value != 0);
        }, "请选择您的职称和所属科室")
    });

    function onDepartmentChanged(department) {
        $.post("doctor", "method=queryPositionByDeno&department=" + department, function (msg) {
            let opt = "<option value='" + 0 + "'>===请选择职务级别===</option>";
            $.each(msg, function (i, pos) {
                opt += "<option value='" + pos.position + "'>" + pos.position + "</option>"
            });
            $("#position").html(opt);
        }, "json");
    }
</script>
</body>
</html>
