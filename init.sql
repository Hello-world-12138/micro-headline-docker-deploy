CREATE TABLE news_user (
    uid INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    user_pwd VARCHAR(100),
    nick_name VARCHAR(50)
) CHARACTER SET utf8mb4;

INSERT INTO news_user (username, user_pwd, nick_name) 
VALUES ('zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '张三');  -- 密码 123456 的 MD5

CREATE TABLE `sm_db1`.`Untitled`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL COMMENT '用户id（news_user.uid）',
  `hid` int NOT NULL COMMENT '头条id（news_headline.hid）',
  `browse_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后浏览时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_uid_hid`(`uid` ASC, `hid` ASC) USING BTREE,
  INDEX `idx_uid`(`uid` ASC) USING BTREE,
  INDEX `idx_time`(`browse_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


CREATE TABLE `sm_db1`.`Untitled`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hid` int NOT NULL COMMENT '头条id',
  `uid` int NOT NULL COMMENT '评论用户id',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `is_deleted` int NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_hid`(`hid` ASC) USING BTREE,
  INDEX `idx_uid`(`uid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


CREATE TABLE `sm_db1`.`Untitled`  (
  `hid` int NOT NULL AUTO_INCREMENT COMMENT '头条id',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头条标题',
  `article` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头条新闻内容',
  `type` int NOT NULL COMMENT '头条类型id',
  `publisher` int NOT NULL COMMENT '头条发布用户id',
  `page_views` int NOT NULL COMMENT '头条浏览量',
  `create_time` datetime NULL DEFAULT NULL COMMENT '头条发布时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '头条最后的修改时间',
  `version` int NULL DEFAULT 1 COMMENT '乐观锁',
  `is_deleted` int NULL DEFAULT 0 COMMENT '头条是否被删除 1 删除  0 未删除',
  PRIMARY KEY (`hid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;


CREATE TABLE `sm_db1`.`Untitled`  (
  `tid` int NOT NULL AUTO_INCREMENT COMMENT '新闻类型id',
  `tname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '新闻类型描述',
  `version` int NULL DEFAULT 1 COMMENT '乐观锁',
  `is_deleted` int NULL DEFAULT 0 COMMENT '头条是否被删除 1 删除  0 未删除',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;


CREATE TABLE `sm_db1`.`Untitled`  (
  `uid` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户登录名',
  `user_pwd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户登录密码密文',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `version` int NULL DEFAULT 1 COMMENT '乐观锁',
  `is_deleted` int NULL DEFAULT 0 COMMENT '头条是否被删除 1 删除  0 未删除',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username_unique`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;
