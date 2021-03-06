<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优购商家中心-淘宝品牌设置</title>
<link rel="stylesheet" type="text/css" href="${BasePath}/yougou/css/base.css"/>
<link rel="stylesheet" type="text/css" href="${BasePath}/yougou/css/mold.css?${style_v}"/>
  <link rel="stylesheet" href="${BasePath}/yougou/css/zTreeStyle.css?${style_v}" type="text/css">
<script type="text/javascript" src="${BasePath}/yougou/js/bootstrap.js"></script>
<script type="text/javascript" src="${BasePath}/yougou/js/ztree/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${BasePath}/yougou/js/ztree/jquery.ztree.exedit-3.5.min.js"></script>
<script type="text/javascript" src="${BasePath}/yougou/js/ztree/jquery.ztree.excheck-3.5.min.js"></script>
<script type="text/javascript" src="${BasePath}/yougou/js/ymc.common.js?${style_v}"></script>
<style>
	div.input-style{border:1px solid #C9C9C9;height:25px;width:560px;color:#000000;position:relative;cursor:pointer}
	div.input-text{float:left;width:530px;height:25px;padding-top:5px;padding-left:10px;}
	div.input-icon{float:left;width:20px;cursor:pointer;font-weight:bold;font-size:20px;text-align:center;margin-top:-2px;}
	div.tree-con{position:absolute;display:none;border:1px solid #797979;width:100%;top:25px;left:-1px;background:#FFFFFF;z-index:1000;}
	.headstep{background:url('${BasePath}/yougou/images/importtaobaostep-new.jpg');height:25px;padding-top:6px;color:#ffffff;font-weight:bold;}
	.info{background:#F2F2F2;padding:10px;margin:10px 0px;font-size:13px;}
</style>
<script>
	var taobaoYougouItemCatBind = {};
	taobaoYougouItemCatBind.basePath  ="${BasePath}";
	taobaoYougouItemCatBind.yougouTree = eval(${yougouTree}).yougouTree;
</script>
<script type="text/javascript" src="${BasePath}/yougou/js/manage/taobao/taobao.yougou.itemcatbind.js?${style_v}"></script>
</head>
<body>
<div class="main_container">
		<div class="normal_box">
			<p class="title site">当前位置：商家中心 &gt; 淘宝商品导入 &gt; 淘宝商品导入设置</p>
			<div class="tab_panel  relative">
			<p style="position:absolute;top:0;right:0;">
				<div class="headstep">
					<div style="float:left;width:330px;text-align:center;">分类对应设置</div>
					<div style="float:left;width:330px;text-align:center;color:#000000">分类属性对应设置</div>
					<div style="float:left;width:295px;text-align:center;color:#000000">设置成功</div>
				</div>
				<div class="info">
					<div>1. 由于淘宝品牌名称、分类属性、分类属性值与优购不一致，需要手动匹配对应关系。</div>
					<div style="margin-top:10px;">2. 请保证分类及属性对应的准确性，避免误操作导致商品资料匹配异常，从而需要投入更多精力进行后期的修改。</div>
				</div>
			</p>
				<div class="tab_content"> 
					<form id="bindForm" method="post" action="${BasePath}/taobao/bindTaobaoYougouItemCat.sc">
						<input type="hidden" name="yougouItemId" id="yougouItemId">
						<input type="hidden" name="bindId" id="bindId">
						<input type="hidden" name="taobaoCatFullName" id="taobaoCatFullName">
						<input type="hidden" name="yougouCatFullName" id="yougouCatFullName">
						<table>
							<tr style="height:30px">
								<td style="text-align:right">导入店铺：</td>
								<td>
									<#if shopList??>
										<select id="nickId" name="nickId" style="width:554px">
										<#list shopList as item>
											<option value="${item.nid}">${item.taobaoShopName}</option>
										</#list>
										</select>
									</#if>
								</td>
							</tr>
							<tr style="height:30px">
								<td>选择优购分类：</td>
								<td>
									<div class="input-style" id="yougouInput">
										<div class="input-text" id="yougouItemName"></div>
										<div class="input-icon" id="yougouIcon">+</div>
										<div class="tree-con" id="yougouTree">
											<ul id="tree_yougou" class="ztree" style="width:548px; overflow:auto;"></ul>
										</div>
									</div>
								</td>
							</tr>
							<tr style="height:30px">
								<td>选择淘宝分类：</td>
								<td>
									<div class="input-style" id="taobaoInput">
										<div class="input-text" id="taobaoItemName"></div>
										<div class="input-icon" id="taobaoIcon">+</div>
										<div class="tree-con"  id="taobaoTree">
											<ul id="tree_taobao" class="ztree" style="width:548px; overflow:auto;"></ul>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td></td>		
								<td><a class="button" id="mySubmit" style="margin-left:0px;color:#666666" href="javascript:taobaoYougouItemCatBind.nextStep()" ><span>&nbsp;&nbsp;下一步&nbsp;&nbsp;</span></a></td>						
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
</div>
</body>
</html>