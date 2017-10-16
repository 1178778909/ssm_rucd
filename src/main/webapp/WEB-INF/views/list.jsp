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
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>SSM_RUCD</h2>
            </div>
        </div>
        <div class="row" style="padding-left: 300px">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary">
                    新增
                </button>
                <button class="btn bg-danger">
                    删除
                </button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                        <c:forEach items="${pageInfo.list}" var="emps">
                            <tr>
                                <td>${emps.empId}</td>
                                <td>${emps.empName}</td>
                                <td>${emps.gender=="M"?"男":"女"}</td>
                                <td>${emps.email}</td>
                                <td>${emps.department.deptName}</td>
                                <td>
                                    <button class="btn btn-primary btn-sm">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        编辑
                                    </button>
                                    <button class="btn bg-danger btn-sm">
                                        <span class="glyphicon glyphicon-trash"></span>
                                        删除
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                当前${pageInfo.pageNum}页, 共${pageInfo.total}条记录。
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">

                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                            <li>
                                <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${!pageInfo.hasPreviousPage}">
                            <li class="disabled"><a href="#">首页</a></li>
                            <li>
                            <li class="disabled">
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>


                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num==pageInfo.pageNum}">
                                <li class="active">
                                    <a href="#">${page_Num}</a>
                                </li>
                            </c:if>
                            <c:if test="${page_Num!=pageInfo.pageNum}">
                                <li>
                                    <a href="${APP_PATH}/emps?pn=${page_Num}">
                                            ${page_Num}
                                    </a>
                                </li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
                        </c:if>
                        <c:if test="${!pageInfo.hasNextPage}">
                            <li class="disabled">
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li class="disabled"><a href="#">末页</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
