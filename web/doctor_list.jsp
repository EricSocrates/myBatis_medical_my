<%--
  Created by IntelliJ IDEA.
  User: Yy
  Date: 2019/1/24
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>医师列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <style>
        .vertical-center {
            padding-top: 7px;
        }
    </style>
</head>
<body>
<div class="modal fade" id="queryDoctorByDnoModal" tabindex="-1" role="dialog"
     aria-labelledby="queryDoctorByIdModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="queryDoctorById">详细信息</h5>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="updateDoctor" method="post" action="doctor">
                    <input type="hidden" name="method" value="updateDoctorByDno">
                    <input type="hidden" name="dno" id="dno_input">
                    <div class="form-group">
                        <label for="dno_modal" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10 vertical-center">
                            <span id="dno_modal"></span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label for="dname_modal" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10 vertical-center">
                            <span id="dname_modal"></span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label for="dsex_modal" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10 vertical-center">
                            <span id="dsex_modal"></span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所属科室&职务级别</label>

                        <div class="col-sm-5">
                            <select class="form-control m-b" name="department" id="department_modal"
                                    onchange="onDepartmentChanged(this.value)">

                            </select>
                            <select class="form-control m-b" name="position" id="position_modal">
                            </select>
                            <span class="help-block m-b-none"></span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="phone_modal">联系方式</label>
                        <div class="col-sm-5">
                            <input type="tel" class="form-control" id="phone_modal" name="phone" autocomplete="off">
                            <span class="help-block m-b-none"></span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label for="count_modal" class="col-sm-2 control-label">看诊人数</label>
                        <div class="col-sm-10 vertical-center">
                            <span id="count_modal"></span>
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
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">返回</button>
            </div>
        </div>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>医师列表</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-2 m-b-xs">
                            <a type="button" class="btn btn-w-m btn-success" href="doctor_add.jsp"><i class="fa fa-plus"
                                                                                                      style="padding-right:10px"></i>新增</a>
                        </div>
                        <div class="col-sm-7 m-b-xs">
                            <button type="button" class="btn btn-w-m btn-danger" style="display:none;"
                                    onclick="delDoctorSelected()"><i class="fa fa-minus" style="padding-right:10px"></i>删除选中项
                            </button>
                        </div>
                        <div class="col-sm-3 m-b-xs">
                            <div class="input-group">
                                <input type="text" placeholder="请输入要搜索的姓名" class="input-sm form-control"
                                       id="keyWord"><span class="input-group-btn">
                                            <button type="button" class="btn btn-sm btn-primary"
                                                    onclick="queryDoctorByNameHazily()">搜索</button> </span>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAll" name="checkbox" onchange="checkAll()"><label
                                        for="checkAll">全选</label></th>
                                <th>编号</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>所属科室</th>
                                <th>职称级别</th>
                                <th>联系方式</th>
                                <th>看诊人数</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="data">

                            </tbody>
                        </table>
                        <div>
                            总共<span id="state_total"></span>条记录，
                            当前显示<span id="state_start"></span>条到<span id="state_end"></span>条记录。
                            每页显示 <select name="ps" id="ps" onchange="changePageSize(this.value)">
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                        </select>条
                            <br>
                            <button id="first" type="button" class="btn btn-warning">首页</button>
                            <button id="pre" type="button" class="btn btn-warning">上一页</button>
                            <button id="next" type="button" class="btn btn-warning">下一页</button>
                            <button id="end" type="button" class="btn btn-warning">尾页</button>
                        </div>
                    </div>

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
    let pn = 1;
    let ps = 5;
    let pre, next, end;
    let condition = "";
    let dno = "";
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
        queryDoctorSeparated(pn, ps, condition);
        $("#first").on("click", function () {
            queryDoctorSeparated(1, ps, condition);
        });
        $("#pre").on("click", function () {
            queryDoctorSeparated(pre, ps, condition);
        });
        $("#next").on("click", function () {
            queryDoctorSeparated(next, ps, condition);
        });
        $("#end").on("click", function () {
            queryDoctorSeparated(end, ps, condition);
        });
        $.post("doctor", "method=queryAllDepartment", function (msg) {
            let opt = "";
            $.each(msg, function (i, dept) {
                opt += "<option value='" + dept.department + "'>" + dept.department + "</option>"
            });
            $("#department_modal").html(opt);
        }, "json");
        $("#updateDoctor").validate({
            errorElement: "span",
            errorPlacement: function (error, element) {
                error.appendTo(element.next());
            },
            rules: {
                phone: {
                    required: true,
                    checkPhone: true
                },
                position: {
                    checkPosition: true
                }
            },
            messages: {
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
                            alert("修改成功！");
                            $("#queryDoctorByDnoModal").modal("hide");
                            window.location.href = "doctor_list.jsp";
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

    function queryDoctorSeparated(pageNumber, pageSize, c) {
        $("input#checkAll").prop("checked", false);
        $.ajax({
            type: "POST",
            url: "doctor",
            data: "method=queryDoctorSeparated&pageNumber=" + pageNumber + "&pageSize=" + pageSize + c,
            dataType: "json",
            success: function (msg) {
                console.log(msg[0]);
                data = msg[0];
                let trs = "";
                pre = data.pre;
                next = data.next;
                end = data.pageCount;
                ps = data.pageSize;
                $.each(data.rows, function (i, d) {
                    trs += "<tr><td><input style='display:none' type='checkbox' onchange='checkedChange()' name='check' value='" + d.dno + "'></td><td>" + d.dno + "</td><td>" + d.dname + "</td><td>" + (d.dsex == "1" ? "男" : "女") + "</td><td>" + d.department + "</td><td>" + d.position + "</td><td>" + d.phone + "</td><td>" + d.count + "</td><td><button type='button' class='btn btn-info' style='margin: 0 10px' onclick='queryDoctorByDno(\"" + d.dno + "\")'>" + "修改" + "</button><button type='button' class='btn btn-danger' style='margin: 0 10px' name='delDoctorById' id='delDoctorById' onclick='onClickDelDoctorById(\"" + d.dno + "\")'>" + "删除" + "</button></td></tr>";
                });
                $("#state_total").text(data.total);
                $("#state_start").text(data.start + 1);
                if (data.pageNumber == data.pageCount) {
                    $("#state_end").text(data.total % data.pageSize == 0 ? (data.start + data.pageSize) : (data.start + (data.total - (data.pageCount - 1) * data.pageSize)));
                } else {
                    $("#state_end").text(data.start + data.pageSize);
                }
                $("select#ps").val(data.pageSize);
                $("#data").html(trs);
            },
            error: function (err) {
                console.log(err);
            }
        });
    }

    function delDoctor(value) {
        console.log(value);
        $.post("doctor", "method=delDoctorByDno&dno=" + value, function (msg) {
            alert("删除成功！")
            queryDoctorSeparated(1, ps, "");
        }, "text");
    }

    function onClickDelDoctorById(dno) {
        if (confirm("您确定要删除这条数据吗？")) {
            console.log(dno);
            delDoctor(dno);
        }
    }

    function delDoctorSelected() {
        if (confirm("您确定要删除选中的数据吗？")) {
            $("input[name='check']:checked").each(function () {
                delDoctor($(this).val());
            });
        }
    }

    function checkedChange() {

        let flag = true;
        $("input[name=check]").each(function () {
            if (!$(this).prop("checked")) {
                flag = false;
            }
        });

        if (flag) {
            $("input#checkAll").prop("checked", true);
        } else {
            $("input#checkAll").prop("checked", false);
        }
    }

    function checkAll() {
        if ($("input#checkAll").prop("checked")) {
            $("input[name='check']").css("display", "inline").prop("checked", true);
            $("button:contains('删除选中')").css({"display": "block", "margin-bottom": "20px"});
            return;
        }
        $("input[name='check']").css("display", "none").prop("checked", false);
        $("button:contains('删除选中')").css("display", "none");
    }

    function queryDoctorByNameHazily() {
        condition = "";
        let keyWord = $("input#keyWord").val();
        if (keyWord != null && keyWord !== "") {
            condition = "&keyWord=" + keyWord;
        }
        queryDoctorSeparated(1, ps, condition);
    }

    function queryDoctorByDno(dno) {

        $.post("doctor", "method=queryDoctorByDno&dno=" + dno, function (msg) {

            console.log(msg);

            $("#dno_modal").text(msg.dno);
            $("#dno_input").val(msg.dno);
            $("#dname_modal").text(msg.dname);
            $("#dsex_modal").text(msg.dsex == "1" ? "男" : "女");
            $("#department_modal").val(msg.department);
            onDepartmentChanged(msg.department);
            $("#position_modal").val(msg.position);
            $("#phone_modal").val(msg.phone);
            $("#count_modal").text(msg.count);

            $("#queryDoctorByDnoModal").modal("show");
        }, "json");
    }

    function onDepartmentChanged(department) {
        $.post("doctor", "method=queryPositionByDeno&department=" + department, function (msg) {
            let opt = "";
            $.each(msg, function (i, pos) {
                opt += "<option value='" + pos.position + "'>" + pos.position + "</option>"
            });
            $("#position_modal").html(opt);
        }, "json");
    }

    function changePageSize(val) {
        queryDoctorSeparated(1, val, condition);
    }
</script>
</body>
</html>
