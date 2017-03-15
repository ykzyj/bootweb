<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN SAMPLE TABLE PORTLET-->
						<div class="portlet box purple">
							<div class="portlet-title">
								<div class="caption"><i class="icon-comments"></i>用户信息</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
									<a href="#portlet-config" data-toggle="modal" class="config"></a>
									<a href="javascript:;" class="reload"></a>
									<a href="javascript:;" class="remove"></a>
								</div>
							</div>
							<div class="portlet-body">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>用户名</th>
											<th>真实名</th>
											<th>性别</th>
											<th>电话</th>                                                                                        <th>创建时间</th>                                            <th>修改时间</th>
										</tr>
									</thead>
									<tbody>                                        <c:forEach var="userinfo" items="${userInfoList}">                                            <tr>                                                <td>1</td>                                                <td>${userinfo.u_userName}</td>                                                <td>${userinfo.u_realName}</td>                                                <td>${userinfo.u_sex}</td>                                                <td>${userinfo.u_phone}</td>                                                <td>${userinfo.u_createTime}</td>                                                <td>${userinfo.u_lastChangeTime}</td>                                            </tr>                                        </c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- END SAMPLE TABLE PORTLET-->
					</div>
				</div>                </body>
</html>