<%--
  Created by IntelliJ IDEA.
  User: Yy
  Date: 2019/1/25
  Time: 14:59
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

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <style>

    </style>
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>新增患者信息</h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal" id="addPatient" method="post" action="patient">
                        <input type="hidden" class="form-control" id="method" name="method" value="addPatient">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="pname">姓名</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="pname" name="pname" autocomplete="off">
                                <span class="help-block m-b-none"></span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="identify">身份证号</label>
                            <div class="col-sm-5">
                                <input type="tel" class="form-control" id="identify" name="identify" autocomplete="off"
                                       onchange="getSexAndAge(this.value)">
                                <span class="help-block m-b-none"></span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <div class="radio i-checks">
                                    <label>
                                        <input type="radio" name="psex-display" id="psex-f" value="0" disabled> <i></i>女</label>
                                </div>
                                <div class="radio i-checks">
                                    <label>
                                        <input type="radio" checked="" id="psex-m" value="1" name="psex-display"
                                               disabled> <i></i>男</label>
                                </div>
                                <input type="hidden" name="psex">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="age">年龄</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="age" name="age" autocomplete="off" readonly>
                                <span class="help-block m-b-none"></span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">主治医师</label>

                            <div class="col-sm-5">
                                <select class="form-control m-b" name="dname" id="dname"
                                        onchange="onDnameChanged(this.value)">

                                </select>
                                <span class="help-block m-b-none"></span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="department">就诊科室</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="department" name="department"
                                       autocomplete="off" readonly>
                                <span class="help-block m-b-none"></span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="totalcost">就诊费用</label>
                            <div class="col-sm-5">
                                <input type="tel" class="form-control" id="totalcost" name="totalcost"
                                       autocomplete="off">
                                <span class="help-block m-b-none"></span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">是否住院</label>
                            <div class="col-sm-10">
                                <div class="radio">
                                    <label>
                                        <input type="radio" checked="" value="0" name="inpatient"
                                               onclick="onArrivetimeChanged()"><i></i>否</label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" value="1" name="inpatient"
                                               onclick="onArrivetimeChanged()"><i></i>是</label>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group arrivedate_div" style="display: none">
                            <label class="col-sm-2 control-label">住院日期</label>
                            <div class="col-sm-10">
                                <input type="text" readonly="" class="form-control layer-date" id="arrivedate"
                                       name="arrivedate">
                                <label class="laydate-icon inline demoicon" onclick="laydate({elem: '#arrivedate', //需显示日期的元素选择器
                event: 'click', //触发事件
                format: 'YYYY-MM-DD', //日期格式
                istoday: true, //是否显示今天
                min: laydate.now(), //最小日期
                max: '2099-12-31', //最大日期
                start: laydate.now(),    //开始日期
                fixed: false, //是否固定在可视区域
                zIndex: 99999999, //css z-index
                //选择好日期的回调
                choose: function(dates){
                    console.log(dates);
                }});"></label>
                            </div>
                        </div>
                        <div class="hr-line-dashed arrivedate_div" style="display: none"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="notes">备注</label>
                            <div class="col-sm-5">
                                <textarea class="form-control" rows="8" id="notes" name="notes"></textarea>
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

<!-- layerDate plugin javascript -->
<script src="js/plugins/layer/laydate/laydate.js"></script>

<script>
    Date.prototype.Format = function (fmt) {
        var o = {
            "y+": this.getFullYear(),
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "h+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S+": this.getMilliseconds()             //毫秒
        };
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                if (k == "y+") {
                    fmt = fmt.replace(RegExp.$1, ("" + o[k]).substr(4 - RegExp.$1.length));
                } else if (k == "S+") {
                    var lens = RegExp.$1.length;
                    lens = lens == 1 ? 3 : lens;
                    fmt = fmt.replace(RegExp.$1, ("00" + o[k]).substr(("" + o[k]).length - 1, lens));
                } else {
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                }
            }
        }
        return fmt;
    };
    let c_date = new Date().Format('yyyy-MM-dd');
    //外部js调用
    laydate({
        elem: '#arrivedate', //需显示日期的元素选择器
        event: 'click', //触发事件
        format: 'YYYY-MM-DD', //日期格式
        istoday: true, //是否显示今天
        min: laydate.now(), //最小日期
        max: '2099-12-31', //最大日期
        start: laydate.now(),    //开始日期
        fixed: false, //是否固定在可视区域
        zIndex: 99999999, //css z-index
        //选择好日期的回调
        choose: function (dates) {
            console.log(dates);
        }
    });

    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
        $.post("doctor", "method=queryAllDoctor", function (msg) {
            let opt = "<option value='" + 0 + "'>===请选择主治医师===</option>";
            console.log(msg);
            $.each(msg, function (i, d) {
                opt += "<option value='" + d.dname + "'>" + d.dname + "</option>"
            });
            $("#dname").html(opt);
        }, "json");
        $("#arrivedate").val(c_date);
        $("#addPatient").validate({
            errorElement: "span",
            errorPlacement: function (error, element) {
                error.appendTo(element.next());
            },

            rules: {
                pname: {
                    required: true
                },
                identify: {
                    required: true,
                    checkIdentify: true
                },
                position: {
                    checkDname: true
                },
                totalcost: {
                    required: true,
                    checkTotalCost: true
                },
                notes: {
                    checkNotes: true
                },
                arrivetime: {
                    checkArrivetime: true
                }
            },
            messages: {
                pname: {
                    required: "姓名不能为空"
                },
                identify: {
                    required: "身份证号不能为空"
                }
            },
            success: function (span) {
                span.html("<i class=\"fa fa-check\"></i>");
            },
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    datatype: "text",
                    success: function (msg) {
                        console.log(msg);
                        if (msg == "success") {
                            alert("添加成功！");
                            window.location.href = "patient_list.jsp";
                        } else if (msg == "fail") {
                            alert("抱歉，一名医师一天只能接诊两名病人！");
                            window.location.href = "patient_add.jsp";
                        }

                    },
                    error: function (err) {
                        console.log(err);
                    }
                });
            }
        });
        jQuery.validator.addMethod("checkIdentify", function (value, element) {
            var tel = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}$)/;
            return this.optional(element) || (tel.test(value));
        }, "请填写正确的身份证号");
        jQuery.validator.addMethod("checkDname", function (value, element) {
            return this.optional(element) || (value != 0);
        }, "请选择您的主治医师");
        jQuery.validator.addMethod("checkNotes", function (value, element) {
            return this.optional(element) || (value.length <= 200);
        }, "备注字符长度不能超过200字");
        jQuery.validator.addMethod("checkTotalCost", function (value, element) {
            return this.optional(element) || (value > 0);
        }, "就诊费用不得等于低于0元");
    });

    function onDnameChanged(dname) {
        if (dname != "0") {
            $.post("doctor", "method=queryDepartmentByDname&dname=" + dname, function (msg) {
                $("#department").val(msg);
            }, "text");
        } else $("#department").val("");
    }

    function getSexAndAge(id) {
        if (id.length == 18) {
            let birth_s = id.substring(6, 15);
            let birth_y = birth_s.substring(0, 4);
            let birth_m = birth_s.substring(4, 6);
            let birth_d = birth_s.substring(6, 8);
            let birth = birth_y + "/" + birth_m + "/" + birth_d;
            let bTime = new Date(birth);
            let cTime = new Date().getTime();
            let age = ((cTime - bTime) / (365 * 24 * 60 * 60 * 1000));
            let sex = id.substring(16, 17);

            $("input[name='age']").val(Math.round(age));
            if (sex % 2 == 1) {
                $("input[name='psex-display']").parent().removeClass("checked");
                $("input[type='radio']#psex-m").parent().addClass("checked");
                $("input[type='radio']#psex-m").prop("checked", true);
                $("input[name='psex']").val("1");
            } else {
                $("input[name='psex-display']").parent().removeClass("checked");
                $("input[type='radio']#psex-f").parent().addClass("checked");
                $("input[type='radio']#psex-f").prop("checked", true);
                $("input[name='psex']").val("0");
            }
        }
    }

    function onArrivetimeChanged() {
        if ($("input[name='inpatient'][value='1']").prop("checked")) {
            $("div.arrivedate_div").css("display", "block");
            return;
        }
        $("div.arrivedate_div").css("display", "none");
    }

</script>
</body>
</html>

