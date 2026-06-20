package com.gophermarket.common.dto;

import java.util.Map;

public class ApiResponse<T> {

    private boolean success;
    private String message;
    private T data;
    private Map<String, String> errors;
    private long timestamp;

    public ApiResponse() {
    }
    public ApiResponse(boolean success, String message, T data, Map<String, String> errors, long timestamp) {
        this.success = success;
        this.message = message;
        this.data = data;
        this.errors = errors;
        this.timestamp = timestamp;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Map<String, String> getErrors() {
        return errors;
    }

    public void setErrors(Map<String, String> errors) {
        this.errors = errors;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }

    public static <T> ApiResponse<T> success(T data){
        return new ApiResponse<>(true, "Success", data, null, System.currentTimeMillis());
    }

    public static <T> ApiResponse<T> error(String message) {
        return new ApiResponse<>(false, message, null, null, System.currentTimeMillis());
    }

    public static <T> ApiResponse<T> validationError(Map<String, String> errors) {
        return new ApiResponse<>(false, "Validation failed", null, errors, System.currentTimeMillis());
    }
}
