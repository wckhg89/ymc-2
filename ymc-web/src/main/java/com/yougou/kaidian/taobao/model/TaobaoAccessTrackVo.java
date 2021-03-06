package com.yougou.kaidian.taobao.model;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

public class TaobaoAccessTrackVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;

	// 商家编码
	private String nickId;

	// 淘宝API
	private String taobaoApi;

	// 访问开始时间
	private Long accessStart;

	// 访问结束时间
	private Long accessEnd;

	// 访问结果
	private String accessResult;

	// 操作员
	private String operater;

	// 操作时间
	private String operated;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickId() {
		return nickId;
	}

	public void setNickId(String nickId) {
		this.nickId = nickId;
	}

	public String getTaobaoApi() {
		return taobaoApi;
	}

	public void setTaobaoApi(String taobaoApi) {
		this.taobaoApi = taobaoApi;
	}

	public Long getAccessStart() {
		return accessStart;
	}

	public void setAccessStart(Long accessStart) {
		this.accessStart = accessStart;
	}

	public Long getAccessEnd() {
		return accessEnd;
	}

	public void setAccessEnd(Long accessEnd) {
		this.accessEnd = accessEnd;
	}

	public String getAccessResult() {
		return accessResult;
	}

	public void setAccessResult(String accessResult) {
		this.accessResult = accessResult;
	}

	public String getOperater() {
		return operater;
	}

	public void setOperater(String operater) {
		this.operater = operater;
	}

	public String getOperated() {
		return operated;
	}

	public void setOperated(String operated) {
		this.operated = operated;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
