SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */
SET GROUP_CONCAT_MAX_LEN=32768;
SET @tables = NULL;
SELECT GROUP_CONCAT('`', table_name, '`') INTO @tables
  FROM information_schema.tables
  WHERE table_schema = (SELECT DATABASE());
SELECT IFNULL(@tables,'dummy') INTO @tables;

SET @tables = CONCAT('DROP TABLE IF EXISTS ', @tables);
PREPARE stmt FROM @tables;
EXECUTE stmt;
SET FOREIGN_KEY_CHECKS = 1;

/* Create Tables */
-- 部落信息
CREATE TABLE m_clan
(
	-- id
	id bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
	-- Tag
	clan_tag varchar(10) NOT NULL COMMENT '部落ID',
	-- 用户名
	clan_name varchar(32) NOT NULL COMMENT '部落名',
	-- 邀请种类
	invite_type char(1) NOT NULL COMMENT '邀请种类',
	-- 描述
	description varchar(256) COMMENT '描述',
	-- 部落等级
	clan_level bigint(2) NOT NULL COMMENT '部落等级',
    -- clanPoints
    clan_points bigint(20) NOT NULL COMMENT 'clanPoints',
    -- clanVersusPoints
    clan_versus_points bigint(20) NOT NULL COMMENT 'clanVersusPoints',
    -- requiredTrophies
    required_trophies bigint(20) NOT NULL COMMENT 'requiredTrophies',
    -- 战斗频度
    war_frequency char(1) NOT NULL COMMENT '战斗频度',
    -- warWinStreak
    war_win_streak bigint(5) NOT NULL COMMENT '连胜次数',
    -- 胜利次数
    war_wins bigint(5) NOT NULL COMMENT '胜利次数',
    -- 平局次数
    war_ties bigint(5) NOT NULL COMMENT '平局次数',
    -- 失败次数
    war_losses bigint(5) NOT NULL COMMENT '失败次数',
    -- 日志公开
    is_war_log_public char(1) NOT NULL COMMENT '日志公开',
    -- 成员数量
    members bigint(3) NOT NULL COMMENT '成员数量',
    -- -- 成员IDS
    -- memberList text COMMENT '成员IDS',
    PRIMARY KEY (clan_tag),
	UNIQUE (id)

) COMMENT = '部落信息' DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;



--  部落成员信息
CREATE TABLE m_player
(
    -- id
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    -- Tag
    player_tag varchar(10) NOT NULL COMMENT '用户ID',
    -- 用户名
    player_name varchar(32) NOT NULL COMMENT '用户名',
    -- 所属部落TAG
    clan_tag varchar(10) NOT NULL COMMENT '部落ID',
    -- 大本营级别
    town_hall_level bigint(2) NOT NULL COMMENT '大本营级别',
    -- 等级
    exp_level bigint(4) COMMENT '等级',
    -- 奖杯数
    trophies bigint(5) NOT NULL COMMENT '奖杯数',
    -- 最高奖杯数
    best_trophies bigint(5) NOT NULL COMMENT '最高奖杯数',
    -- 赛季进攻胜利次数
    attack_wins bigint(5) NOT NULL COMMENT '赛季进攻胜利次数',
    -- 赛季防守胜利次数
    defense_wins bigint(5) NOT NULL COMMENT '赛季防守胜利次数',
    -- 夜世界大本等级
    builder_hall_level bigint(2) NOT NULL COMMENT '夜世界大本等级',
    -- 夜世界奖杯
    versus_trophies bigint(5) NOT NULL COMMENT '夜世界奖杯',
    -- 夜世界最高奖杯
    best_versus_trophies bigint(5) NOT NULL COMMENT '夜世界最高奖杯',
    -- 夜世界获胜次数
    versus_battle_wins bigint(5) NOT NULL COMMENT '夜世界获胜次数',
    -- 职位
    role varchar(1) NOT NULL COMMENT '职位',
    -- 援兵捐出人口
    donations bigint(6) NOT NULL COMMENT '援兵捐出人口',
    -- 援兵收到人口
    donations_received bigint(6) NOT NULL COMMENT '援兵收到人口',
    -- 删除FLG
    delete_flg char(1) DEFAULT '0' COMMENT '削除フラグ',
    PRIMARY KEY (player_tag),
    UNIQUE (id)

) COMMENT = '部落成员信息' DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;


-- --  部落常规对战信息
-- CREATE TABLE clan_war_log
-- (
--     -- id
--     id bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
--     -- Tag
--     clan_tag varchar(10) NOT NULL COMMENT '部落ID',
--     -- 用户名
--     clan_name varchar(32) NOT NULL COMMENT '部落名',
--     -- 邀请种类
--     invite_type char(1) NOT NULL COMMENT '邀请种类',
--     -- 描述
--     description varchar(256) COMMENT '描述',
--     -- 部落等级
--     clan_level bigint(2) NOT NULL COMMENT '部落等级',
--     -- clanPoints
--     clan_points bigint(20) NOT NULL COMMENT 'clanPoints',
--     -- clanVersusPoints
--     clan_versus_points bigint(20) NOT NULL COMMENT 'clanVersusPoints',
--     -- requiredTrophies
--     required_trophies bigint(20) NOT NULL COMMENT 'requiredTrophies',
--     -- 战斗频度
--     war_frequency char(1) NOT NULL COMMENT '战斗频度',
--     -- warWinStreak
--     war_win_streak bigint(5) NOT NULL COMMENT '连胜次数',
--     -- 胜利次数
--     war_wins bigint(5) NOT NULL COMMENT '胜利次数',
--     -- 平局次数
--     war_ties bigint(5) NOT NULL COMMENT '平局次数',
--     -- 失败次数
--     war_losses bigint(5) NOT NULL COMMENT '失败次数',
--     -- 日志公开
--     is_war_log_public char(1) NOT NULL COMMENT '日志公开',
--     -- 成员数量
--     members bigint(3) NOT NULL COMMENT '成员数量',
--     -- 成员IDS
--     memberList text COMMENT '成员IDS',
--     PRIMARY KEY (clan_tag),
--     UNIQUE (id)

-- ) COMMENT = '部落情报' DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;




/* Create Foreign Keys */
--ALTER TABLE m_clan
--	ADD FOREIGN KEY (salary_id)
--	REFERENCES salary_base (salary_id)
--	ON UPDATE RESTRICT
--	ON DELETE RESTRICT
--;

/* Create Indexes */
--CREATE INDEX m_user_01 USING BTREE ON m_user (account_id ASC);

