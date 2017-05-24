<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- title -->
<jsp:include page="pages/header.jsp"/>
<html>
	<head>
		<title>FTEngine</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.jsp.js"></script>
		<script type="text/javascript">
			/*此部分代码用于测试。当完成以后，进行转移 @by wx*/
			var closeInfo = function(){
				return "后台还在执行操作，强烈建议不要刷新或关闭";
			};
			/*
			* 功能：重启FTEngine和SolrWEB
			* 先重启FTEngine，再重启Solr。
			* 重启的时候，进行等待验证。
			* */
			function restart(){
				window.onbeforeunload = closeInfo;
				var webroot = Constant.WEB_ROOT();
				$.post(
					"/ftrestarter/trigger-out",{},"json"
				).success(
					function(response) {
						alert("重启"+response.success?"成功":"失败。"+resposne.response);
						window.onbeforeunload = null;
						location.reload();
					}
				).error(
					function(XmlHttpRequest, textStatus, errorThrown) {
						alert("error:"+XmlHttpRequest.responseText);
						window.onbeforeunload = null;
					}
				);

			}
		</script>
	</head>
  
	<body onload="intial();">		
		<div id="div_id_groupofaddress">
   			<h2>访问</h2>
   			<ul>
   				<li id="div_id_apidown">
  			 		<font size="5"><a href="${pageContext.request.contextPath}/attachments/ftengine_rmi_api-1.0b.jar">api.jar</a></font>
  				</li>
    			<li><b>查询地址:</b></li>
      			<table border="1" cellspacing="0" cellpadding="2" width="100%">
      				<tr>
						<th style="text-align: center;width: 10%">方式</th>
						<th style="text-align: center;width: 40%">地址</th>
						<th style="text-align: center;width: 5%">数据</th>
						<th style="text-align: center;width: 35%">参数格式</th>
					</tr>
					<tr>
						<td style="text-align: center;width: 10%">HTTP</td>
						<td style="width: 40%"><c:out value="${String_indexJSPAction_request_HttpSearchAddress}"/></td>
						<td style="text-align: center;width: 5%">JSON</td>
						<td style="width: 35%">method=search&request={SearchRequest.class_json}</td>
					</tr>
					<tr>
						<td style="text-align: center;width: 10%">RMI</td>
						<td style="width: 40%">
							<c:out value="${String_indexJSPAction_request_RMISearchAddress}"/>
							[方法:<c:out value="${String_indexJSPAction_request_RMISearchMethod}"/>]
						</td>
						<td style="text-align: center;width: 5%">Object</td>
						<td style="width: 35%">SearchRequest.class</td>
					</tr>
	  			</table>
      			<c:if test="${!Boolean_indexJSPAction_request_readOnly}">
      			<li><b>索引地址:</b></li>
      			<table border="1"  cellspacing="0" cellpadding="2" width="100%">
      				<tr>
						<th style="text-align: center;width: 10%">方式</th>
						<th style="text-align: center;width: 40%">地址</th>
						<th style="text-align: center;width: 5%">数据</th>
						<th style="text-align: center;width: 35%">参数格式</th>
					</tr>
					<tr>
						<td style="text-align: center;width: 10%">HTTP(post-only)</td>
						<td style="width: 40%"><c:out value="${String_indexJSPAction_request_HttpIndexAddress}"/></td>
						<td style="text-align: center;width: 5%">JSON</td>
						<td style="width: 35%">method=[addIndex|updateIndex|partialUpdateIndex]|[deleteIndex]
							&[document=[[{FTDocument[].class_json}|{FTDocument[].class_json}|{FTDocument[].class_json}]|[deleteQuery=DeleteQuery[].class_json]]
							&command=Command.class_json</td>
					</tr>
					<tr>
						<td style="text-align: center;width: 10%">RMI</td>
						<td style="width: 40%">
							<c:out value="${String_indexJSPAction_request_RMIIndexAddress}"/>
							[方法:<c:out value="${String_indexJSPAction_request_RMIIndexMethod}"/>]
						</td>
						<td style="text-align: center;width: 5%">Object</td>
						<td style="width: 35%">[FTDocument[].class|DeleteQuery[].class],&nbsp;Command.class</td>
					</tr>
	  			</table>
	  			<ul>
	  			   	<li><span style="color:#E70808;">重要:你可以通过指定数据中的"distributionMark"字段(区分大小写)来为数据设置"分布式标记",分布式标记用于分布式检索的时候帮助标记数据位置,默认为DEFAULT</span></li>
   				</ul>
	  			<li><b>索引接口概要:</b></li>
	  			<ul>
   					<li>每单次提交最大允许条数:
   						<c:out value="${int_VeiwServlet_request_maxindexcountPerTime}"/>
   					</li>
   					<li>单条索引执行超时:
   						<c:if test="${int_VeiwServlet_request_indexexecutetimeout>0}">
   							<c:out value="${int_VeiwServlet_request_indexexecutetimeout}"/>毫秒
   						</c:if>
   						<c:if test="${int_VeiwServlet_request_indexexecutetimeout<0}">
   							不超时
   						</c:if>
   					</li>
   					<li><span style="color:#E70808;">分布式访问端口:</span>
   						<c:out value="${int_VeiwServlet_request_distributePort}"/>
   					</li>
   				</ul>
      			</c:if>
  			</ul>
  		</div>
  		<div id="div_id_indexmetainfo">
   			<h2>索引概要</h2>
   			<ul>
   				<li><b>类型定义:</b></li>
   				<c:if test="${!empty FieldTypeInfoList_indexJSPAction_request_ExtendableFieldTypeInfo}">
   					<table border="1" cellspacing="0" cellpadding="2" width="100%">
	      				<tr>
	      					<th style="text-align: center;width: 5%">&nbsp</th>
							<th style="text-align: center;width: 20%">类型名称</th>
							<th style="text-align: center;width: 35%">索引分析器</th>
							<th style="text-align: center;width: 35%">查询分析器</th>
							<th style="text-align: center;width: 5%">最大值</th>
							<th style="text-align: center;width: 5%">最小值</th>
						</tr>
						<c:forEach items="${FieldTypeInfoList_indexJSPAction_request_ExtendableFieldTypeInfo}"
							var="fieldTypeInfo">
							<tr>
								<td class="IMGTD">
									<img onclick="openAanlyzerWindow();"
									 title="查看分词效果" style="border:0px;cursor:hand" width="20" 
									 height="20" src="${pageContext.request.contextPath}/js/edit.png"/>
				 			 	</td>
								<td class="fieldTypeNameTD" style="text-align: center;width: 20%">
									<c:out value="${fieldTypeInfo.name}"/>
								</td>
								<td class="indexAnalyzerTD" style="text-align: center;width: 35%">
									<c:out value="${fieldTypeInfo.indexAnalyzer}"/>
								</td>
								<td class="queryAnalyzerTD" style="text-align: center;width: 35%">
									<c:out value="${fieldTypeInfo.queryAnalyzer}"/>
								</td>
								<td style="text-align: center;width: 5%">
									<c:out value="${fieldTypeInfo.maxValue}"/>
								</td>
								<td style="text-align: center;width: 5%">
									<c:out value="${fieldTypeInfo.minValue}"/>
								</td>
							</tr>
						</c:forEach>
	  				</table>
   				</c:if>
   				<c:if test="${empty FieldTypeInfoList_indexJSPAction_request_ExtendableFieldTypeInfo}">
   					没有定义任何类型,请检查FTEingineWorkspace/config.xml
   				</c:if>
   			</ul>
   			<ul>
   				<li><b>索引列表:</b></li>
                <table border="0" cellspacing="0" style="width: 600px; margin: inherit">
                    <tr>
                        <td>导入IndexMeta Schema:</td>
                        <td><form name="upform" action="request/indexmetaupload" method="post" enctype="multipart/form-data"><input type ="file" name="file1" id="file1"/><input type="submit" value="导入IndexMeta" /></form></td>
                    </tr>
                </table>
                <table border="0" id="indexinfotable_indexjsp" width="60%"></table>
   			</ul>
   		</div>
   		<div id="div_id_other">
   			<h2>其他信息</h2>
   			<ul>
   			<table border="0" cellspacing="0" style="width: 200px; margin: inherit">
   				<tr>
  					<td><li><b>查看线程信息</b></li></td>
	  				<td><a href="javascript:window.open('${pageContext.request.contextPath}/threadview.jsp', 'ThreadView')">打开</a></td>
  				</tr> 
  				<tr>
  					<td><li><b>词库</b></li></td>
	  				<td><a href="${pageContext.request.contextPath}/keywordlib.jsp" target="_blank">打开</a></td>
  				</tr>
				<tr>
					<td><li><b>重启测试</b></li></td>
					<td><a href="javascript:restart();">重启</a></td>
				</tr>
			</table>
   			</ul>
   		</div>
	</body>
</html>
