package com.nhdkn16.historicaltravel.dto;

import com.nhdkn16.historicaltravel.entity.User;
import lombok.Data;

@Data
public class UserForm {
    private Long userId;
    private String username;
    private String email;
    private String password;
    private User.Role role;
    private User.Status status;
}
