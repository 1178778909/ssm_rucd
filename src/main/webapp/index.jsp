<%--
  Created by IntelliJ IDEA.
  User: tangz_000
  Date: 2017/10/12 0012
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
</head>
<script type="text/javascript"
        src="${APP_PATH}/static/js/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.css">
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>



<body>
<!-- 修改模态窗 -->
<div class="modal fade" id="emp_update_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" >
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email_update_input" placeholder="xxx@xilingf.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="gender_M_update_input">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline" >
                                <input type="radio" name="gender" id="gender_M_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_L_update_input" value="L"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update_input" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="dId"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_save">保存</button>
            </div>
        </div>
    </div>
</div>



<!-- 新增模态窗 -->
<div class="modal fade" id="emp_add_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" >
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"
                                   name="empName" id="empName_add_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email_add_input" placeholder="xxx@xilingf.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="gender_M_add_input">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline" >
                                <input type="radio" name="gender" id="gender_M_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_L_add_input" value="L"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="dId"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_add_save">保存</button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2>SSM_RUCD</h2>
        </div>
    </div>
    <div class="row" style="padding-left: 300px">
        <div class="col-md-2 col-md-offset-10">
            <button class="btn btn-primary"
                    id="emp_add_model_btn">
                新增
            </button>
            <button class="btn bg-danger"
                    id="emp_del_all_btn">
                删除
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check_all">
                        </th>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_info_area"></div>
        <div class="col-md-4 col-md-offset-2">
            <nav aria-label="Page navigation">
                <ul class="pagination" id="page_nav">
                </ul>
            </nav>
        </div>
    </div>
</div><script type="text/javascript">
    var totalRecord, currentPage;
    //加载首页信息
    $(function () {
        to_page(1);
    });

    //定向到数据页面
    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn="+pn,
            type: "get",
            success: function (result) {
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }

    //解析数据
    function build_emps_table(result) {
        $("#emps_table tbody").empty();

        $.each(result.extend.pageInfo.list, function (index, item) {
            var editBtn = $("<button></button>")
                .addClass("btn btn-primary btn-sm edit_btn")
                .attr("edit-id", item.empId)
                .append("<span></span>")
                .addClass("glyphicon glyphicon-pencil")
                .append("编辑");
            var deletBtn = $("<button></button>")
                .addClass("btn bg-danger btn-sm delete_btn")
                .attr("delete-id", item.empId)
                .append("<span></span>")
                .addClass("glyphicon glyphicon-trash")
                .append("删除");
            $("<tr></tr>")
                .append($("<td></td>").append($("<input type='checkbox' class='check_item'>")))
                .append($("<td></td>").append(item.empId))
                .append($("<td></td>").append(item.empName))
                .append($("<td></td>").append(item.gender=='M'?"男":"女"))
                .append($("<td></td>").append(item.email))
                .append($("<td></td>").append(item.department.deptName))
                .append($("<td></td>").append(editBtn).append(" ").append(deletBtn))
                .appendTo("#emps_table tbody");
        });
    }

    //解析并显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();

        $("#page_info_area").append("当前"+
            result.extend.pageInfo.pageNum+"页," +
            "共"+
            result.extend.pageInfo.total+"条记录。");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    //解析并显示分页条
    function build_page_nav(result) {
        $("#page_nav").empty();

        var first_page_li = $("<li></li>")
            .append($("<a></a>").attr("herf", "#").append("首页"));

        var last_page_li = $("<li></li>")
            .append($("<a></a>").attr("herf", "#").append("末页"));

        var pre_page_li = $("<li></li>")
            .append($("<a></a>").attr("href", "#").attr("aria-lable", "Previous")
                .append($("<span></span>").attr("aria-hidden", "true").append("&laquo;")));

        var next_page_li = $("<li></li>")
            .append($("<a></a>").attr("href", "#").attr("aria-lable", "Next")
                .append($("<span></span>").attr("aria-hidden", "true").append("&raquo;")));


        if (result.extend.pageInfo.hasPreviousPage == false) {
            first_page_li.addClass("active");
            pre_page_li.addClass("disabled");
        } else {
            first_page_li.click(function () {
                to_page(1);
            });
            pre_page_li.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }
        if (result.extend.pageInfo.hasNextPage == false) {
            last_page_li.addClass("active");
            next_page_li.addClass("disabled");
        } else {
            last_page_li.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
            next_page_li.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }

        $("#page_nav").append(first_page_li).append(pre_page_li);

        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var num_page_li = $("<li></li>").append($("<a></a>").attr("herf", "#").append(item));
            num_page_li.click(function () {
                to_page(item);
            });
            if (result.extend.pageInfo.pageNum == item) {
                num_page_li.addClass("active")
            }
            $("#page_nav").append(num_page_li);
        });

        $("#page_nav").append(next_page_li).append(last_page_li);
    }
    
    function resetEle(ele) {
        $(ele)[0].reset;
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    $("#emp_add_model_btn").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        resetEle("#emp_add_model form");
        //发送ajax请求，查出部门信息，显示在下拉列表中
        getDepts("#emp_add_model select");
        //弹出模态框
        $("#emp_add_model").modal({
            backdrop:"static"
        });
    });

    function getDepts(ele) {
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "GET",
            success: function (result) {
                $(ele).empty();
                $.each(result.extend.depts, function () {
                    $(ele).append($("<option></option>").append(this.deptName).attr("value", this.deptId));
                });
            }
        });
    }

    $("#empName_add_input").change(function () {
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkuser",
            data:"empName="+empName,
            type:"POST",
            success:function (result) {
                if (result.code==100) {
                    show_validate_msg("#empName_add_input", "success", "用户名可用");
                    $("#emp_add_save").attr("ajax-validate", "success");
                } else {
                    show_validate_msg("#empName_add_input", "error", result.extend.va_msg);
                    $("#emp_add_save").attr("ajax-validate", "fail");
                }
            }
        });
    });

    $("#emp_add_save").click(function () {
        if(!validate_add_form()) {
            return;
        }
        if($(this).attr("ajax-validate")=="error") {
            return;
        }
        $.ajax({
            url: "${APP_PATH}/emp",
            type: "POST",
            data: $("#emp_add_model form").serialize(),
            success: function (result) {
                if (result.code=100) {
                    $("#emp_add_model").modal('hide');
                    to_page(totalRecord);
                } else {
                    if (undefined != result.extend.errorFields.email) {
                        show_validate_msg("#email_add_input", "error", result.extend.errorFields.email)
                    }
                    if (undefined != result.extend.errorFields.empName) {
                        show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                    }
                }
            }
        });
    });
    function validate_add_form() {
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

        if (!regEmail.test(email)) {
            show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_msg("#email_add_input", "success", "");
        }
        return true;
    }

    function show_validate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" === status) {
            $(ele).parent().addClass("has-success");
        } else if ("error" === status) {
            $(ele).parent().addClass("has-error");
        }
        $(ele).next("span").text(msg);
    }

    $(document).on("click", ".edit_btn", function () {
        getDepts("#emp_update_model select");
        getEmp($(this).attr("edit-id"));
        $("#emp_update_save").attr("edit-id", $(this).attr("edit-id"));
        $("#emp_update_model").modal({
           backdrop: "static"
        });
    });

    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function (result) {
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#emp_update_model input[name=gender]").val([empData.gender]);
                $("#emp_update_model select").val([empData.dId]);
            }
        });
    }

    $("#emp_update_save").click(function () {
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

        if (!regEmail.test(email)) {
            show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_msg("#email_update_input", "success", "");
        }

        $.ajax({
            url:"${APP_PATH}/emp/" + $(this).attr("edit-id"),
            type:"PUT",
            data:$("#emp_update_model form").serialize(),
            success:function (result) {
                $("#emp_update_model").modal("hide");
                to_page(currentPage);
            }
        });
    });

    //单个删除
    $(document).on("click", ".delete_btn", function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("确认删除【" + empName + "】吗？")) {
            $.ajax({
                url:"${APP_PATH}/emp/" + $(this).attr("delete-id"),
                type:"DELETE",
                success: function (result) {
                    to_page(currentPage);
                }
            });
        }
    });

    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    $("#emp_del_all_btn").click(function () {
        var empNames = "";
        var del_idstr = "";
        $.each($(".check_item:checked"), function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text() +",";
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() +"-";
        });
        empNames.substring(0, empNames.length-1);
        del_idstr.substring(0, del_idstr.length-1);
        if (confirm("确认删除所选项吗？")) {
            $.ajax({
                url:"${APP_PATH}/emp/" + del_idstr,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });

    $(document).on("click", ".check_item", function () {
        var flag=$(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });
</script>
</body>
</html>
