package com.mboumda.erp_minipro.api.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class CustomerUpdateRequest {
    public String code;
    public String name;
    public String email;
    public String phone;
    public Boolean active;
}
