package com.nhdkn16.historicaltravel.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CommentResponse {
    private Long commentId;
    private String username;
    private String content;
    private Long userId;
}
