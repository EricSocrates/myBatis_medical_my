<%--
  Created by IntelliJ IDEA.
  User: Yy
  Date: 2019/1/25
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>患者列表</title>
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
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>患者列表</h5>
                </div>
                <div class="ibox-content">
                    <div class="row no-gutters">
                        <div class="col-sm-2 m-b-xs">
                            <a type="button" class="btn btn-w-m btn-success" href="patient_add.jsp"><i
                                    class="fa fa-plus" style="padding-right:10px"></i>新增</a>
                        </div>
                        <div class="col-sm-4 m-b-xs">
                            <button type="button" class="btn btn-w-m btn-danger" style="display:none;"
                                    onclick="delPatientSelected()"><i class="fa fa-minus"
                                                                      style="padding-right:10px"></i>删除选中项
                            </button>
                        </div>
                        <div class="col-sm-6 m-b-xs">
                            <div class="row">
                                <div class="col-sm-6">
                                    <input type="text" placeholder="请输入医师或患者姓名的关键字" class="input-sm form-control"
                                           id="keyWord">
                                </div>
                                <div class="col-sm-4">
                                    <select class="form-control m-b" name="typeToSelect" id="typeToSelect">
                                        <option value="1">按医师姓名</option>
                                        <option value="2" selected>按患者姓名</option>
                                    </select>
                                </div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-sm btn-primary"
                                            onclick="queryPatientByNameHazily()">搜索
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped text-nowrap">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAll" name="checkbox" onchange="checkAll()"><label
                                        for="checkAll">全选</label></th>
                                <th>姓名</th>
                                <th>身份证号</th>
                                <th>性别</th>
                                <th>年龄</th>
                                <th>就诊科室</th>
                                <th>主治医师</th>
                                <th>就诊费用</th>
                                <th>就诊时间</th>
                                <th>住院时间</th>
                                <th>备注</th>
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
        queryPatientSeparated(pn, ps, condition);
        $("#first").on("click", function () {
            queryPatientSeparated(1, ps, condition);
        });
        $("#pre").on("click", function () {
            queryPatientSeparated(pre, ps, condition);
        });
        $("#next").on("click", function () {
            queryPatientSeparated(next, ps, condition);
        });
        $("#end").on("click", function () {
            queryPatientSeparated(end, ps, condition);
        });
    });

    function queryPatientSeparated(pageNumber, pageSize, c) {
        $("input#checkAll").prop("checked", false);
        $.ajax({
            type: "POST",
            url: "patient",
            data: "method=queryPatientSeparated&pageNumber=" + pageNumber + "&pageSize=" + pageSize + c,
            dataType: "json",
            success: function (msg) {
                console.log(msg[0]);
                data = msg[0];
                let trs = "";
                pre = data.pre;
                next = data.next;
                end = data.pageCount;
                ps = data.pageSize;
                $.each(data.rows, function (i, p) {
                    trs += "<tr><td><input style='display:none' type='checkbox' onchange='checkedChange()' name='check' value='" + p.pno + "'></td><td>" + p.pname + "</td><td>" + p.identify + "</td><td>" + (p.psex == "1" ? "男" : "女") + "</td><td>" + p.age + "</td><td>" + p.department + "</td><td>" + p.dname + "</td><td>" + p.totalcost + "</td><td>" + formattedDate(p.treatedate) + "</td><td>" + (p.arrivedate == null ? "未办理住院" : formattedDate(p.arrivedate)) + "</td><td>" + p.notes + "</td><td><button type='button' class='btn btn-danger' style='margin: 0 10px' name='delPatientById' id='delPatientById' onclick='onClickDelPatientById(\"" + p.pno + "\")'>" + "删除" + "</button></td></tr>";
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

    function delPatient(value) {
        console.log(value);
        $.post("patient", "method=delPatientByPno&pno=" + value, function (msg) {
            alert("删除成功！")
            queryPatientSeparated(1, ps, "");
        }, "text");
    }

    function onClickDelPatientById(dno) {
        if (confirm("您确定要删除这条数据吗？")) {
            console.log(dno);
            delPatient(dno);
        }
    }

    function delPatientSelected() {
        if (confirm("您确定要删除选中的数据吗？")) {
            $("input[name='check']:checked").each(function () {
                delPatient($(this).val());
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

    function queryPatientByNameHazily() {
        condition = "";
        let keyWord = $("input#keyWord").val();
        let typeToSelect = $("#typeToSelect").val();
        if (keyWord != null && keyWord !== "") {
            condition = "&keyWord=" + keyWord + "&type=" + typeToSelect;
        }
        queryPatientSeparated(1, ps, condition);
    }

    function onDepartmentChanged(department) {
        $.post("patient", "method=queryPositionByDeno&department=" + department, function (msg) {
            let opt = "";
            $.each(msg, function (i, pos) {
                opt += "<option value='" + pos.position + "'>" + pos.position + "</option>"
            });
            $("#position_modal").html(opt);
        }, "json");
    }

    function changePageSize(val) {
        queryPatientSeparated(1, val, condition);
    }


    function formattedDate(timestamp) {
        let year = (1900 + timestamp.year);
        let month = (timestamp.month + 1) >= 10 ? (timestamp.month + 1) : "0" + (timestamp.month + 1);
        let date = (timestamp.date) >= 10 ? (timestamp.date) : "0" + (timestamp.date);
        return year + "-" + month + "-" + date;
    }
</script>
</body>
</html>
