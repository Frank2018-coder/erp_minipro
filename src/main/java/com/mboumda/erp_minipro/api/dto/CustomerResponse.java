package com.mboumda.erp_minipro.api.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CustomerResponse {
    private Long id;
    private String code;
    private String name;
    private String email;
    private String phone;
    private Boolean active;
    private LocalDateTime createdAt;

}
