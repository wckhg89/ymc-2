<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "../merchants-include.ftl">
<title>优购商城--商家后台</title>
</head>
<body>
<div class="container">
	<!--工具栏start--> 
	<div class="list_content">
		<div class="top clearfix">
			<ul class="tab">
				<li  >
				  <span><a href="${BasePath}/yitiansystem/merchants/businessorder/to_punishList.sc" class="btn-onselc">违规订单列表</a></span>
				</li>
				<li class="curr">
				  <span><a href="${BasePath}/yitiansystem/merchants/businessorder/to_punishValidList.sc" class="btn-onselc">已审核订单列表</a></span>
				</li>
			</ul>
		</div>
   <div class="modify"> 
     <form action="${BasePath}/yitiansystem/merchants/businessorder/to_punishValidList.sc" name="queryForm" id="queryForm" method="post">
  			  	<div class="wms-top">
                     <label>优购订单号：</label>
                     <input type="text" name="orderNo" id="orderNo" value="${(punishOrderVo.orderNo)!'' }"/>&nbsp;&nbsp;&nbsp;
                     <label>外部订单号：</label>
                     <input type="text" name="thirdOrderNo" id="thirdOrderNo" value="${(punishOrderVo.thirdOrderNo)!'' }"/>&nbsp;&nbsp;&nbsp;
                     <label>商家名称：</label>
                     <input type="text" name="merchantName" id="merchantName" value="${(punishOrderVo.merchantName)!'' }"/>&nbsp;&nbsp;&nbsp;
                     <label>商家编号：</label>
                   	 <input type="text" name="merchantCode" id="merchantCode" value="${(punishOrderVo.merchantCode)!'' }"/>
                </div>
  			  	<div class="wms-top">
  			  		<label>发货状态：</label>
                   	<select name="shipmentStatus" id="shipmentStatus">
                        <option value="">全部</option>
                        <option value="1" <#if (punishOrderVo.shipmentStatus)?? && punishOrderVo.shipmentStatus == "1">selected</#if> >已发货</option>
                        <option value="0" <#if (punishOrderVo.shipmentStatus)?? && punishOrderVo.shipmentStatus == "0">selected</#if> >未发货</option>
                     </select>
                     <label>违规类型：</label>
                   	 <select name="punishType" id="punishType">
                        <option value="">全部</option>
                        <option value="1" <#if (punishOrderVo.punishType)?? && punishOrderVo.punishType == "1">selected</#if>  >超时效</option>
                        <option value="0" <#if (punishOrderVo.punishType)?? && punishOrderVo.punishType == "0">selected</#if> >缺货</option>
                     </select>
                     <label>下单日期：</label>
                   	 <input type="text" name="orderTimeStart" id="orderTimeStart" value="<#if (punishOrderVo.orderTimeStart) ??>${punishOrderVo.orderTimeStart?datetime}</#if>"/>
                   	    至
                   	 <input type="text" name="orderTimeEnd" id="orderTimeEnd" value="<#if (punishOrderVo.orderTimeEnd) ??>${punishOrderVo.orderTimeEnd?datetime}</#if>"/>
                   	 <label>货品负责人：</label>
                     <input type="text" name="supplierYgContacts" id="supplierYgContacts" value="<#if punishOrderVo??&&punishOrderVo.supplierYgContacts??>${punishOrderVo.supplierYgContacts!""}</#if>"/>&nbsp;&nbsp;&nbsp;
                   	 <input type="button" value="搜索" onclick="queryMerchantPunish();" class="yt-seach-btn" />&nbsp;&nbsp;&nbsp;
                   	 <input type="button" value="导出" onclick="exportPunishOrder();" class="btn-add-normal-4ft fr"  />
              	</div>
              	</form>
                <table cellpadding="0" cellspacing="0" class="list_table">
                		<thead>
                        <tr>
                        	<th style="padding-left:0px;width:50px;"><input onClick="allChk(this,'ids')" id="chkb" type="checkbox" /></th>
	                        <th style="width:80px;">优购订单号</th>
	                        <th style="width:80px;">外部订单号</th>
	                        <th style="width:80px;">下单日期</th>
	                        <th style="width:80px;">商家名称</th>
	                        <th style="width:80px;">商家编号</th>
	                        <th style="width:80px;">违规类型</th>
	                        <th style="width:80px;">发货状态</th>
	                        <th style="width:80px;">发货时间</th>
	                        <th style="width:80px;">超出时长</th>
	                        <th style="width:60px;">订单金额</th>
	                        <th style="width:60px;">罚款金额</th>
                        </tr>
                        </thead>
                        <tbody>
                        	<#if pageFinder?? && (pageFinder.data)?? >
	                   		<#list pageFinder.data as item >
	                        <tr>
	                        	<td><input type="checkbox" name="ids"  value='${(item.id)!''}' ></td> 
		                        <td><a target="_blank" href="${omsHost!''}/yitiansystem/ordergmt/orderdetail/toBaseDetail.sc?orderNo=${(item.order_no)!'' }" > ${(item.order_no)!'' }</a> </td>
		                        <td>${(item.third_order_no)!'' }</td>
		                        <td>${(item.order_time)!'' }</td>
		                        <td>${(item.supplier)!'' }</td>
		                        <td>${(item.merchant_code)!'' }</td>
		                        <td>
									<#if (item.punish_type)??>
		                        		<#if item.punish_type == "1">
		                        			超时效
		                        		<#else>
		                        			缺货
		                        		</#if>
		                        	</#if>
								</td>
		                        <td>
		                        	<#if (item.shipment_status)??>
		                        		<#if item.shipment_status == "1">
		                        			已发货
		                        		<#else>
		                        			未发货
		                        		</#if>
		                        	</#if>
		                        </td>
		                        <td>
		                        	<#if (item.shipment_time)??>
		                        		${(item.shipment_time)!'' }
		                        	<#else>
		                        		---
		                        	</#if>
		                        </td>
		                        <td>
		                        	<#if (item.punish_type)?? && (item.punish_type) == "1">
			                        	<#if (overHour)??>
			                        		${(overHour[item.order_no])!''}
			                        	</#if>
			                        <#else>
			                        	--
			                        </#if>
		                        </td>
		                        <td>${(item.order_price)!'' }</td>
		                        <td>${(item.punish_price)!'' }</td>
	                        </tr>
	                        </#list>
	                        </#if>
                      </tbody>
                </table>
              </div>
               <div class="bottom clearfix">
			  	<#if pageFinder ??><#import "../../../common.ftl" as page>
			  		<@page.queryForm formId="queryForm"/></#if>
			  </div>
              <div class="blank20"></div>
          </div>
</div>
</body>
</html>
<script type="text/javascript">

$(document).ready(function() {
	$('#orderTimeStart').calendar({maxDate:'#createStartTime',format:'yyyy-MM-dd HH:mm:ss'});
	$('#orderTimeEnd').calendar({minDate:'#createEndTime',format:'yyyy-MM-dd HH:mm:ss'});
	
});

//根据条件查询
function queryMerchantPunish(){
   document.queryForm.method="post";
   document.queryForm.submit();
}

//导出违规订单
function exportPunishOrder(){
	var ids =  $(":checkbox[name='ids']").serializeArray();
	if(ids == ''){
		alert("请选择要导出的订单!");
		return false;
	}
	
	var idsParam ="";
	if(ids.constructor  === Array ){
		$.each(ids, function(i, field){
			//alert(i);
			idsParam = idsParam + "&ids="+field.value;
		});
	}else{
		idsParam = "&ids=" + ids;
	}
	window.open('${BasePath}/yitiansystem/merchants/businessorder/to_exportPunishOrder.sc?mehtod=param'+idsParam);
	
	$(":checkbox[name='ids'],:checkbox[id='chkb']").each(function(){
		$(this).attr("checked",false);
	});
}



</script>
