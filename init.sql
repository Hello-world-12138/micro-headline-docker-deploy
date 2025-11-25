CREATE TABLE news_user (
    uid INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    user_pwd VARCHAR(100),
    nick_name VARCHAR(50),
    version INT DEFAULT 1,
    is_deleted INT DEFAULT 0
) CHARACTER SET utf8mb4;

INSERT INTO news_user (username, user_pwd, nick_name) 
VALUES ('zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '张三'); -- 123456 的 MD5

CREATE TABLE news_type (
    tid INT PRIMARY KEY AUTO_INCREMENT,
    tname VARCHAR(10) NOT NULL,
    version INT DEFAULT 1,
    is_deleted INT DEFAULT 0
) CHARACTER SET utf8mb4;

INSERT INTO news_type (tname) VALUES ('新闻'),('体育'),('娱乐'),('科技'),('其他');

CREATE TABLE news_headline (
    hid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    article VARCHAR(5000) NOT NULL,
    type INT NOT NULL,
    publisher INT NOT NULL,
    page_views INT DEFAULT 0,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    version INT DEFAULT 1,
    is_deleted INT DEFAULT 0
) CHARACTER SET utf8mb4;

CREATE TABLE news_comment (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    hid INT NOT NULL,
    uid INT NOT NULL,
    content VARCHAR(500) NOT NULL,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_deleted INT DEFAULT 0,
    INDEX idx_hid (hid),
    INDEX idx_uid (uid)
) CHARACTER SET utf8mb4;

CREATE TABLE browse_history (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    uid INT NOT NULL,
    hid INT NOT NULL,
    browse_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE INDEX uniq_uid_hid (uid, hid),
    INDEX idx_uid (uid),
    INDEX idx_time (browse_time)
) CHARACTER SET utf8mb4;
