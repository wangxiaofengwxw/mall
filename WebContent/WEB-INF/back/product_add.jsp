<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
function selectTwo(obj) {
    var oneId = $(obj).val();
    //清空城市下拉框中的内容，出第一项外
     $("#two option:gt(0)").remove();
    //alert("123");
    $.ajax({
        url:"${pageContext.request.contextPath}/product/findTwo.action",
        data:"oneId="+oneId,
        dataType:"json",
        success:function(data,textStatus,ajax){
           //alert(ajax.responseText);
           //append_template(data, "city");
           
           var html = "<option>-请选择-</option>";
           for(var i=0;i<data.length;i++){
               html +="<option value='"+data[i].parent_id+"'>"+data[i].name+"</option>";
           }
           $("#two").html(html);
        }
    });
}
function uploadPic() {
    //定义参数
    var options = {
        url:"${pageContext.request.contextPath}/product/uploadPic.action",
        dataType:"json",
        type:"post",
        success: function(data) {
            $("#imgId").attr("src","/pic/" + data.fileName);
            $("#mainImage").val(data.fileName);
        }
    };
     $("#form-add").ajaxSubmit(options);
 }

</script>
<title>Insert title here</title>
</head>
<body>
<%@include file="../common/product_header.jsp" %>
<%@ include  file="../common/head.jsp"%>

<div class="container">
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/product/list.action"  class="list-group-item ">商品管理</a>
                <a href="${pageContext.request.contextPath}/product/toAdd.action" class="list-group-item active">添加商品</a>
                <a href="${pageContext.request.contextPath}/product/toCategoryList.action" class="list-group-item">种类管理</a>
                <a href="${pageContext.request.contextPath}/product/toSearchProduct.action" class="list-group-item">商品查询</a>
            </div>
        </div>
        <div class="col-md-10">
            <ul class="nav nav-tabs">
                <li>
                    <a href="${pageContext.request.contextPath}/product/list.action" >商品管理</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/product/toAdd.action" >添加商品</a>
                </li>
                <li>
                	<a href="${pageContext.request.contextPath}/product/toCategoryList.action">种类管理</a>
                </li>
                <li>
                	<a href="${pageContext.request.contextPath}/product/toSearchProduct.action">商品查询</a>
                </li>
            </ul>
                
                  <!-- 商品添加表单  begin -->
		            <form id="form-add" action="${pageContext.request.contextPath}/product/add.action"enctype="multipart/form-data"  method="post" class="form_border">
		        <div class="form-group">
	                        <label>商品id</label>
	                        <input type="text" name="id" class="form-control" placeholder="id自增">
	                    </div>
	            <div class="form-group">
	                        <label>一级分类</label>
	                        <select id="oneCategory" onchange="selectTwo(this)" class="form-control">
	                             <option>请选择</option>
	                        	<c:forEach items="${oneList}" var="category">
		                            <option value="${category.id }">${category.name }</option>
	                        	</c:forEach> 
	                        </select>
	                    </div> 
	                 <div class="form-group">
	                        <label>二级分类</label>
	                        <select name="category.id"  id="two"class="form-control">
	                        	 <option value="">-请选择-</option>
	                        </select>
	                    </div> 
	                     <div class="form-group">
	                        <label>商品名称</label>
	                        <input type="text"name="name" class="form-control" placeholder="请输入商品名称">
	                    </div>
	                    <div class="form-group">
	                        <label>副标题</label>
	                        <input type="text" name="subtitle" class="form-control" placeholder="请输入副标题">
	                    </div>
	                  <div class="form-group">
	                        <label>主图</label>
	                        <img alt="" id="imgId" src="" width=100 height=100>
	                        <input type="hidden" name="main_image" id="mainImage"/>
	                        <input type="file" name="pictureFile" onchange="uploadPic();"/>
	                    </div>
	                   <!--  <div class="form-group">
	                        <label>扩展图</label>
	                        <input  type="file" name="sub_images" class="form-control" placeholder="扩展图">
	                    </div> -->
	                      <div class="form-group">
	                        <label>商品详情</label>
	                        <input type="text" name="detail" class="form-control" placeholder="请输入商品详情">
	                    </div>
	                    <div class="form-group">
	                        <label>价格</label>
	                        <input type="text" name="price" class="form-control" placeholder="请输入价格">
	                    </div>
	                    <div class="form-group">
	                        <label>库存</label>
	                        <input type="text" name="stock" class="form-control" placeholder="请输入库存">
	                    </div>
	                    <div class="form-group">
	                        <label>状态</label>
	                        <select name="status" class="form-control">
	                        	 <option value="1">上架-</option>
	                        	 <option value="2">下架-</option>
	                        </select>
	                    </div> 
	                    <div class="form-group">
	                        <label>创建时间</label>
	                        <input type="text" name="createTime" class="form-control" placeholder="请输入创建时间">
	                    </div>
	                    <div class="form-group">
	                        <label>更新时间</label>
	                        <input type="text" name=updateTime class="form-control" placeholder="请输入更新时间">
	                    </div>  
	                    
	                    <input class="btn btn-success btn-lg" type="submit" value="添加"  />
                	</form>
		            <!-- 商品添加表单  end -->
            
           </div> 
        </div>    
    </div>        
</body>
</html>