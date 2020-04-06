package cn.dibcbks.util;
/**
* @ClassName: ResponseResult
* @Description:(用于处理异步请求所响应的结果)
* @author: ZhouLingZhang
* @date 2019年9月3日
* @param <T>
 */
public class ResponseResult<T> {
	public static final int SUCCESS = 1;//用于标识当前请求是成功
	public static final int ERROR = 0;//用于标识当前请求是失败的
	private Integer state;//判断标识的变量
	private String message;//响应的信息
	private T  data;//响应的数据，定义为泛型数据类型以实现自定义。
	public ResponseResult() {
		super();
	}
	public ResponseResult(Throwable throwable) {
		super();
		this.state=0;
		this.message=throwable.getMessage();
	}
	public ResponseResult(Integer state) {
		super();
		this.state = state;
	}
	public ResponseResult(Integer state, T data) {
		super();
		this.state = state;
		this.data = data;
	}

	public ResponseResult(Integer state, String message) {
		super();
		this.state = state;
		this.message = message;
	}

	public ResponseResult(Integer state, String message, T data) {
		super();
		this.state = state;
		this.message = message;
		this.data = data;
	}
	
	public Integer getState() {
		return state;
	}
	public ResponseResult<T> setState(Integer state) {
		this.state = state;
		return this;
	}
	public String getMessage() {
		return message;
	}
	public ResponseResult<T> setMessage(String message) {
		this.message = message;
		return this;
	}
	public T getData() {
		return data;
	}
	public ResponseResult<T> setData(T data) {
		this.data = data;
		return this;
	}
	
}
