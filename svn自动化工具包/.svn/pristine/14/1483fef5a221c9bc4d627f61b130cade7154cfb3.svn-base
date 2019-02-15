/*
Navicat MySQL Data Transfer

Source Server         : 192.168.3.176--3306
Source Server Version : 50723
Source Host           : 192.168.3.176:3306
Source Database       : wt-sso

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-09-25 17:18:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for biz_alarm
-- ----------------------------
DROP TABLE IF EXISTS `biz_alarm`;
CREATE TABLE `biz_alarm` (
  `id` varchar(32) NOT NULL COMMENT '告警id',
  `alarm_type` int(12) NOT NULL COMMENT '告警类型 1:身份证告警 2：驾驶证告警 3:行驶证告警 4：车牌证告警 5：支援性告警',
  `alarm_name` varchar(32) DEFAULT NULL COMMENT '告警类型名称',
  `Id_number` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `alarm_time` datetime DEFAULT NULL COMMENT '告警时间',
  `alarm_title` varchar(100) DEFAULT NULL COMMENT '告警标题',
  `alarm_by` varchar(32) DEFAULT NULL COMMENT '告警人',
  `alarm_content` varchar(1000) DEFAULT NULL COMMENT '告警内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for biz_authorization
-- ----------------------------
DROP TABLE IF EXISTS `biz_authorization`;
CREATE TABLE `biz_authorization` (
  `id` varchar(32) NOT NULL COMMENT '主键编号',
  `res_id` varchar(32) NOT NULL COMMENT '资源编号',
  `police_id` varchar(32) NOT NULL COMMENT '警员编号',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '授权时间',
  `prohibit_time` datetime DEFAULT NULL COMMENT '禁止时间',
  `confirm` int(2) NOT NULL DEFAULT '0' COMMENT '是否确认（0:未确认，1已确认，2已禁止）',
  PRIMARY KEY (`res_id`,`police_id`),
  UNIQUE KEY `un_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_authorization
-- ----------------------------

-- ----------------------------
-- Table structure for biz_camera
-- ----------------------------
DROP TABLE IF EXISTS `biz_camera`;
CREATE TABLE `biz_camera` (
  `id` varchar(32) NOT NULL COMMENT '资源号',
  `coord_x` double(10,6) DEFAULT NULL COMMENT '经度坐标',
  `coord_y` double(10,6) DEFAULT NULL COMMENT '纬度坐标',
  `name` varchar(256) DEFAULT NULL COMMENT '摄像头IP地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) DEFAULT NULL COMMENT '10表示在线，20表示离线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_camera
-- ----------------------------

-- ----------------------------
-- Table structure for biz_cases
-- ----------------------------
DROP TABLE IF EXISTS `biz_cases`;
CREATE TABLE `biz_cases` (
  `case_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '案件信息ID',
  `case_brief` varchar(1000) DEFAULT NULL COMMENT '简要案情 ',
  `case_status` int(11) DEFAULT NULL COMMENT '案件状态  10已接警、20已派警、30已结案',
  `case_name` varchar(100) DEFAULT NULL COMMENT '案件名称',
  `case_accpet_org` varchar(100) DEFAULT NULL COMMENT '接警单位',
  `case_accept_time` datetime DEFAULT NULL COMMENT '案件受理时间(投诉受理时间)',
  `case_occur_addr` varchar(200) DEFAULT NULL COMMENT '案情发生地(案发地址 )',
  `case_occur_lng` double(10,6) DEFAULT NULL COMMENT '经度',
  `case_occur_lat` double(10,6) DEFAULT NULL COMMENT '纬度',
  `case_occur_time` datetime DEFAULT NULL COMMENT '案发时间',
  `case_report_type` varchar(100) DEFAULT NULL COMMENT '报警类别',
  `case_report_method` varchar(100) DEFAULT NULL COMMENT '报警方式',
  `case_reporter_name` varchar(20) DEFAULT NULL COMMENT '报案人姓名',
  `case_reporter_phone` varchar(50) DEFAULT NULL COMMENT '报案人联系方式',
  `case_reporter_sex` varchar(10) DEFAULT NULL COMMENT '报案人性别',
  `case_reporter_age` varchar(10) DEFAULT NULL COMMENT '报案人年龄',
  `case_reporter_idNumber` varchar(100) DEFAULT NULL COMMENT '报警人身份证号',
  `case_reporter_currentAddress` varchar(200) DEFAULT NULL COMMENT '报警人现住址',
  `case_reporter_idAddress` varchar(200) DEFAULT NULL COMMENT '报警人户籍所在地',
  `case_reporter_workAddress` varchar(200) DEFAULT NULL COMMENT '工作单位',
  `case_end_time` datetime DEFAULT NULL COMMENT '案件结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_by` varchar(32) DEFAULT NULL COMMENT '修改人ID',
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_cases
-- ----------------------------

-- ----------------------------
-- Table structure for biz_cases_old
-- ----------------------------
DROP TABLE IF EXISTS `biz_cases_old`;
CREATE TABLE `biz_cases_old` (
  `case_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '案件信息ID',
  `case_way` int(11) DEFAULT NULL COMMENT '1报警受理、2求助受理、3投诉受理',
  `case_way_name` varchar(50) DEFAULT NULL COMMENT '案件大类型名称  1表示报警受理、2表示求助受理、3表示投诉受理',
  `case_type` int(11) DEFAULT NULL COMMENT '案件小类型 \r\n大类型为报警受理，当case_way为1时caseType为\r\n1刑事案件     2治安案（事）件  \r\n3危机人身、财产安全或社会治安秩序的群体性事件\r\n4自然灾害、治安灾害事故\r\n5其他需要公安机关处置的与违法犯罪有关的警报\r\n当case_way为2时  caseType为\r\n1发生溺水、坠楼、自杀等状况，需要公安机...\r\n2老人、儿童以及智障人员、精神疾病患者等...\r\n3公众遇到危难，处于孤立无援状况，需要立...\r\n4涉及水、电、气、热等公共设施出现险情，...\r\n5需要公安机关处理的其他紧急求助事项\r\n当case_way为3时\r\ncaseType为 1投诉受理',
  `case_type_name` varchar(50) DEFAULT NULL COMMENT '案件小类型  如:刑事案件、治安事件(案件)',
  `case_occur_addr` varchar(200) DEFAULT NULL COMMENT '案件地址(案发地址 )',
  `case_occur_time` datetime DEFAULT NULL COMMENT '案发时间',
  `case_accept_time` datetime DEFAULT NULL COMMENT '接警时间(通用)',
  `case_name` varchar(100) DEFAULT NULL COMMENT '案件名称',
  `case_occur_lng` double(10,6) DEFAULT NULL COMMENT '经度',
  `case_occur_lat` double(10,6) DEFAULT NULL COMMENT '纬度',
  `case_status` int(11) DEFAULT NULL COMMENT '案件状态  10已接警、20已派警、30已结案',
  `case_reporter_name` varchar(50) DEFAULT NULL COMMENT '报警人(投述方 )',
  `case_start_time` datetime DEFAULT NULL COMMENT '案件受理时间(投诉受理时间)',
  `case_end_time` datetime DEFAULT NULL COMMENT '案件结束时间',
  `case_brief` varchar(1000) DEFAULT NULL COMMENT '简要案情 ',
  `storage` int(11) DEFAULT NULL COMMENT '是否长期保存  1是   0否',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `create_byName` varchar(20) DEFAULT NULL COMMENT '创建人姓名',
  `create_byNo` varchar(32) DEFAULT NULL COMMENT '创建人警员编号',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_by` varchar(32) DEFAULT NULL COMMENT '修改人ID',
  `modified_byName` varchar(20) DEFAULT NULL COMMENT '修改人姓名',
  `modified_byNo` varchar(32) DEFAULT NULL COMMENT '修改人警员编号',
  `criminal_reporter_org` varchar(200) DEFAULT NULL COMMENT '单位',
  `criminal_report_type` varchar(100) DEFAULT NULL COMMENT '报案方式',
  `criminal_reporter_addr` varchar(200) DEFAULT NULL COMMENT '报警人地址',
  `criminal_accused_name` varchar(50) DEFAULT NULL COMMENT '被告人姓名',
  `criminal_accused_sex` varchar(20) DEFAULT NULL COMMENT '被告人性别',
  `criminal_accused_age` varchar(20) DEFAULT NULL COMMENT '被告人年龄',
  `criminal_accused_addr` varchar(200) DEFAULT NULL COMMENT '被告人地址（或单位）',
  `criminal_accused_features` varchar(1000) DEFAULT NULL COMMENT '被告人特征',
  `criminal_victim_condition` varchar(1000) DEFAULT NULL COMMENT '受害情况',
  `order_accpet_org` varchar(100) DEFAULT NULL COMMENT '接警单位',
  `order_accpet_policeId` varchar(100) DEFAULT NULL COMMENT '接警警员编号',
  `order_accpet_police` varchar(50) DEFAULT NULL COMMENT '接警民警',
  `order_reporter_tel` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `order_report_type` varchar(20) DEFAULT NULL COMMENT '报警形式',
  `order_data` varchar(200) DEFAULT NULL COMMENT '材料（有无）',
  `order_report_addr_tel` varchar(150) DEFAULT NULL COMMENT '报警地点、电话',
  `help_reporter_sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `help_reporter_age` varchar(20) DEFAULT NULL COMMENT '年龄',
  `help_reporter_tel` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `help_reporter_addr` varchar(200) DEFAULT NULL COMMENT '工作单位或地址',
  `help_reporter_cardId` varchar(50) DEFAULT NULL COMMENT '国籍身份/号码',
  `help_reporterType` varchar(300) DEFAULT NULL COMMENT '报警类别',
  `help_reporterMethod` varchar(300) DEFAULT NULL COMMENT '报警方式',
  `complain_tel` varchar(30) DEFAULT NULL COMMENT '电话号码',
  `complain_postcode` varchar(50) DEFAULT NULL COMMENT '邮编',
  `complain_name` varchar(50) DEFAULT NULL COMMENT '投诉代表姓名',
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_cases_old
-- ----------------------------

-- ----------------------------
-- Table structure for biz_cases_picture
-- ----------------------------
DROP TABLE IF EXISTS `biz_cases_picture`;
CREATE TABLE `biz_cases_picture` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `report_id` varchar(32) DEFAULT NULL COMMENT '结案报告ID',
  `object_id` varchar(200) DEFAULT NULL COMMENT 'mongodb objectId',
  `case_id` varchar(32) DEFAULT NULL COMMENT '案情ID',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_type` varchar(50) DEFAULT NULL COMMENT '文件格式',
  `police_id` varchar(32) DEFAULT NULL COMMENT '警员ID',
  `police_no` varchar(32) DEFAULT NULL COMMENT '警员编号',
  `police_name` varchar(20) DEFAULT NULL COMMENT '警员姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_cases_picture
-- ----------------------------

-- ----------------------------
-- Table structure for biz_cases_read_status
-- ----------------------------
DROP TABLE IF EXISTS `biz_cases_read_status`;
CREATE TABLE `biz_cases_read_status` (
  `id` varchar(32) NOT NULL COMMENT '主键记录标识',
  `police_id` varchar(32) NOT NULL COMMENT '警员编号',
  `case_id` varchar(32) NOT NULL COMMENT '案情编号',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否已读(0:未读,1:已读)',
  PRIMARY KEY (`police_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_cases_read_status
-- ----------------------------

-- ----------------------------
-- Table structure for biz_device
-- ----------------------------
DROP TABLE IF EXISTS `biz_device`;
CREATE TABLE `biz_device` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT 'ID',
  `device_id` varchar(32) NOT NULL COMMENT '设备的编号',
  `type` int(10) DEFAULT NULL COMMENT '设备类型 1表示眼镜设备、2表示PDA设备',
  `status` int(11) DEFAULT NULL COMMENT '设备状态 0表示禁用 1表示空闲 2表示正被使用 ',
  `activate` int(11) DEFAULT NULL COMMENT '0表示眼镜休眠，1表示眼镜激活',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_by` varchar(32) DEFAULT NULL COMMENT '修改人ID',
  `police_id` varchar(32) DEFAULT NULL COMMENT '分配的警员ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_biz_glasses_deviceId` (`device_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_device
-- ----------------------------

-- ----------------------------
-- Table structure for biz_device_assign
-- ----------------------------
DROP TABLE IF EXISTS `biz_device_assign`;
CREATE TABLE `biz_device_assign` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT 'ID',
  `glasses_pda_id` varchar(32) DEFAULT NULL COMMENT '眼镜或PDA的UUID',
  `police_id` varchar(32) DEFAULT NULL COMMENT '警员ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_by` varchar(32) DEFAULT NULL COMMENT '修改人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_device_assign
-- ----------------------------

-- ----------------------------
-- Table structure for biz_device_status
-- ----------------------------
DROP TABLE IF EXISTS `biz_device_status`;
CREATE TABLE `biz_device_status` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '眼镜的UUID或PDA的UUID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_device_status
-- ----------------------------

-- ----------------------------
-- Table structure for biz_file
-- ----------------------------
DROP TABLE IF EXISTS `biz_file`;
CREATE TABLE `biz_file` (
  `filename` varchar(128) NOT NULL COMMENT '文件名称',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小',
  `begintime` datetime DEFAULT NULL COMMENT '文件开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '文件结束时间',
  `policeid` varchar(32) DEFAULT NULL COMMENT '警员ID',
  `mssip` varchar(64) DEFAULT NULL COMMENT '内网IP',
  `mssport` int(11) DEFAULT NULL COMMENT '内网端口号',
  `playurl` varchar(128) DEFAULT NULL COMMENT '文件URL',
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_file
-- ----------------------------

-- ----------------------------
-- Table structure for biz_idcard
-- ----------------------------
DROP TABLE IF EXISTS `biz_idcard`;
CREATE TABLE `biz_idcard` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `type` int(11) DEFAULT NULL COMMENT '证件类型，1表示身份证，2表示驾驶证，3表示行驶证，4车牌证',
  `startTime` datetime DEFAULT NULL COMMENT '证件有效期开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '证件有效期截止时间',
  `IdNumber` varchar(200) DEFAULT NULL COMMENT '证件号码',
  `IssuingUnit` varchar(50) DEFAULT NULL COMMENT '签发机关',
  `name` varchar(50) DEFAULT NULL COMMENT '持证人姓名',
  `sex` varchar(10) DEFAULT NULL COMMENT '持证人性别',
  `nation` varchar(20) DEFAULT NULL COMMENT '持证人民族',
  `dateBirth` datetime DEFAULT NULL COMMENT '出生日期',
  `address` varchar(200) DEFAULT NULL COMMENT '住址',
  `DateCertificate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '签证日期',
  `birthPlace` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `image` longtext COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `type_driving` varchar(32) DEFAULT NULL COMMENT '准驾车型',
  `using_nature` varchar(32) DEFAULT NULL COMMENT '使用性质',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_idcard
-- ----------------------------

-- ----------------------------
-- Table structure for biz_mq_task
-- ----------------------------
DROP TABLE IF EXISTS `biz_mq_task`;
CREATE TABLE `biz_mq_task` (
  `id` varchar(32) NOT NULL,
  `msg_code` int(11) NOT NULL COMMENT '消息code，区分不同消息',
  `msg_type` varchar(20) NOT NULL COMMENT '消息code注释',
  `content` varchar(255) DEFAULT NULL COMMENT '消息的内容，Json格式',
  `create_time` datetime NOT NULL COMMENT '消息创建时间',
  `modified_time` datetime DEFAULT NULL,
  `confirm` int(11) DEFAULT '10' COMMENT '未发送=10，已发送=20，确认=30',
  `source_police_id` varchar(32) DEFAULT NULL COMMENT '发起警员',
  `dest_police_id` varchar(32) DEFAULT NULL COMMENT '接受警员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_mq_task
-- ----------------------------

-- ----------------------------
-- Table structure for biz_patrol
-- ----------------------------
DROP TABLE IF EXISTS `biz_patrol`;
CREATE TABLE `biz_patrol` (
  `id` varchar(32) NOT NULL COMMENT '巡更表主键编号',
  `patrol_cycle` varchar(50) DEFAULT NULL COMMENT '巡逻周期',
  `patrol_start_time` varchar(20) DEFAULT NULL COMMENT '巡逻开始时间',
  `patrol_end_time` varchar(20) DEFAULT NULL COMMENT '巡逻结束时间',
  `patrol_scope` varchar(200) DEFAULT NULL COMMENT '巡逻范围',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `modified_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  `geo` longtext COMMENT '巡逻范围坐标点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_patrol
-- ----------------------------

-- ----------------------------
-- Table structure for biz_patrol_user
-- ----------------------------
DROP TABLE IF EXISTS `biz_patrol_user`;
CREATE TABLE `biz_patrol_user` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `patrol_id` varchar(32) NOT NULL COMMENT '巡更表主键id',
  `user_id` varchar(32) NOT NULL COMMENT '用户表主键id',
  PRIMARY KEY (`patrol_id`,`user_id`),
  UNIQUE KEY `un_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_patrol_user
-- ----------------------------

-- ----------------------------
-- Table structure for biz_police_assign
-- ----------------------------
DROP TABLE IF EXISTS `biz_police_assign`;
CREATE TABLE `biz_police_assign` (
  `id` varchar(32) NOT NULL COMMENT '记录标识',
  `case_id` varchar(32) NOT NULL COMMENT '案件表',
  `police_id` varchar(32) NOT NULL COMMENT '警员',
  `assign_start` datetime NOT NULL COMMENT '开始分配时间',
  `assign_end` datetime DEFAULT NULL COMMENT '分配结束时间',
  `case_close` datetime DEFAULT NULL COMMENT '案件办结时间',
  `police_status` int(10) DEFAULT '0' COMMENT '警员状态(0表示未接警、1:已接警,2已到达，3结案)',
  `descriptors` varchar(255) DEFAULT NULL COMMENT '分配任务描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='派警表';

-- ----------------------------
-- Records of biz_police_assign
-- ----------------------------

-- ----------------------------
-- Table structure for biz_police_current_coord
-- ----------------------------
DROP TABLE IF EXISTS `biz_police_current_coord`;
CREATE TABLE `biz_police_current_coord` (
  `police_id` varchar(32) NOT NULL COMMENT '警员编号',
  `longitude` double(10,4) NOT NULL COMMENT 'pda经度',
  `latitude` double(10,4) NOT NULL COMMENT '纬度',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`police_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='坐标记录表';

-- ----------------------------
-- Records of biz_police_current_coord
-- ----------------------------

-- ----------------------------
-- Table structure for biz_police_key
-- ----------------------------
DROP TABLE IF EXISTS `biz_police_key`;
CREATE TABLE `biz_police_key` (
  `police_id` varchar(32) NOT NULL COMMENT '警员编号，如存在则处于执行任务中',
  PRIMARY KEY (`police_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用于判断警员是否为执行任务状态';

-- ----------------------------
-- Records of biz_police_key
-- ----------------------------

-- ----------------------------
-- Table structure for biz_police_track
-- ----------------------------
DROP TABLE IF EXISTS `biz_police_track`;
CREATE TABLE `biz_police_track` (
  `id` varchar(32) NOT NULL COMMENT '记录标识',
  `police_id` varchar(32) NOT NULL COMMENT '警员编号',
  `track_date` date NOT NULL,
  `coord` longtext,
  PRIMARY KEY (`police_id`,`track_date`),
  UNIQUE KEY `idx_id` (`id`),
  KEY `police_id` (`police_id`),
  KEY `track_date` (`track_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='坐标记录表';

-- ----------------------------
-- Records of biz_police_track
-- ----------------------------

-- ----------------------------
-- Table structure for biz_report
-- ----------------------------
DROP TABLE IF EXISTS `biz_report`;
CREATE TABLE `biz_report` (
  `id` varchar(32) NOT NULL COMMENT '报告ID',
  `case_id` varchar(32) DEFAULT NULL COMMENT '该处置报告案情id',
  `leader` varchar(32) DEFAULT NULL COMMENT '带班领导',
  `police_id` varchar(32) DEFAULT NULL COMMENT '处置人',
  `deal_time` datetime DEFAULT NULL COMMENT '处置时间',
  `case_type` varchar(50) DEFAULT NULL COMMENT '案情类型',
  `degree` varchar(50) DEFAULT NULL COMMENT '危害程度',
  `field_situation` varchar(50) DEFAULT NULL COMMENT '现场情况:是否有现场，是否对现场进行勘察',
  `remark` longtext COMMENT '备注',
  `brief` longtext COMMENT '处置报告简要',
  `report_status` int(11) DEFAULT '10' COMMENT '处置报告状态:10（保存），20（提交）',
  `case_suspicio` longtext COMMENT '嫌疑人',
  `create_time` datetime DEFAULT NULL COMMENT '处置报告创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_report
-- ----------------------------

-- ----------------------------
-- Table structure for biz_report_attachment
-- ----------------------------
DROP TABLE IF EXISTS `biz_report_attachment`;
CREATE TABLE `biz_report_attachment` (
  `id` varchar(32) NOT NULL COMMENT '附件表编号',
  `report_id` varchar(32) DEFAULT NULL COMMENT '处置报告编号',
  `object_id` varchar(255) DEFAULT NULL COMMENT '服务器存储图片返回字符',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `police_id` varchar(32) DEFAULT NULL COMMENT '警员编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_report_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for biz_report_template
-- ----------------------------
DROP TABLE IF EXISTS `biz_report_template`;
CREATE TABLE `biz_report_template` (
  `id` varchar(32) NOT NULL COMMENT '主键标识符',
  `template` longtext NOT NULL COMMENT '模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_report_template
-- ----------------------------
INSERT INTO `biz_report_template` VALUES ('59dab364ecb54f1395478d1a10ca9a71', '{caseOccurTime}，在{caseOccurAddr}发生一起{caseType}，经调查，因{cause}，发生{process}，造成{loss}，案件处警结果{result}');
-- ----------------------------
-- Table structure for biz_server
-- ----------------------------
DROP TABLE IF EXISTS `biz_server`;
CREATE TABLE `biz_server` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT 'ID',
  `external_ip` varchar(50) DEFAULT NULL COMMENT '服务器外网IP',
  `intranet_ip` varchar(50) DEFAULT NULL COMMENT '服务器内网IP',
  `external_port` varchar(50) DEFAULT NULL COMMENT '服务器外网端口',
  `intranet_port` varchar(50) DEFAULT NULL COMMENT '服务器内网端口',
  `name` varchar(50) DEFAULT NULL COMMENT '服务器名称',
  `type` int(11) DEFAULT NULL COMMENT '\r\n1=web服务  2=流媒体分发服务  3=中心管理服务  4=web业务负载均衡服务    5=语音对讲服务    6=消息服务  7=图片存储服务(mongodb) \r\n8=图片访问代理服务(gridfs-nginx) 9=PDA历史视频存储服务',
  `type_name` varchar(15) DEFAULT NULL COMMENT '类型名称',
  `status` int(11) DEFAULT NULL COMMENT '服务器状态 0:禁用，1:正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `create_byName` varchar(20) DEFAULT NULL COMMENT '创建人姓名',
  `create_byNo` varchar(32) DEFAULT NULL COMMENT '创建人警员编号',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_by` varchar(32) DEFAULT NULL COMMENT '修改人ID',
  `modified_byName` varchar(20) DEFAULT NULL COMMENT '修改人姓名',
  `modified_byNo` varchar(32) DEFAULT NULL COMMENT '修改人警员编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_server
-- ----------------------------
INSERT INTO `biz_server` VALUES ('2003a8490a9b4fd6997881943dabe497', '192.168.3.4', '192.168.3.4', '5672', '5672', '192.168.3.4', '6', 'MQ', '1', '2018-01-18 17:55:04', 'd0f5ebc74439440393baf760907ba358', 'admin', 'admin', null, null, null, null);
INSERT INTO `biz_server` VALUES ('2b61bfce44b74dd997af1f76b1f40dff', '192.168.3.4', '192.168.3.4', '5060', '5060', '192.168.3.4', '5', 'FS', '1', '2017-01-18 17:54:31', 'd0f5ebc74439440393baf760907ba358', 'admin', 'admin', null, null, null, null);
INSERT INTO `biz_server` VALUES ('beac124316ae43b09f2d39257a263ca0', '192.168.3.4', '192.168.3.4', '1935', '1935', '192.168.3.4', '2', '流媒体服务器', '1', '2018-05-17 16:45:23', null, null, null, null, null, null, null);
INSERT INTO `biz_server` VALUES ('beac124316ae43b09f2d39257a263ca1', '192.168.3.4', '192.168.3.4', null, null, '192.168.3.4', '8', 'gridfs-nginx', null, null, null, null, null, null, null, null, null);
INSERT INTO `biz_server` VALUES ('beac124316ae43b09f2d39257a263ca2', '192.168.3.205', '192.168.3.205', '1935', '1935', '192.168.3.205', '2', '流媒体服务器', '0', null, null, null, null, null, null, null, null);
INSERT INTO `biz_server` VALUES ('beac124316ae43b09f2d39257a263ca5', '192.168.3.4', '192.168.3.4', '21000', '21000', '192.168.3.4', '9', '文件服务器', '1', '2018-05-04 18:16:56', 'd0f5ebc74439440393baf760907ba358', 'admin', 'admin', null, null, null, null);
INSERT INTO `biz_server` VALUES ('beac124316ae43b09f2d39257a263ca7', '192.168.3.4', '192.168.3.4', '', null, '192.168.3.4', '7', 'mongodb', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for biz_version
-- ----------------------------
DROP TABLE IF EXISTS `biz_version`;
CREATE TABLE `biz_version` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `version_number` varchar(50) DEFAULT NULL COMMENT '版本号',
  `object_id` varchar(200) DEFAULT NULL COMMENT 'mongodb objectId',
  `url` varchar(300) DEFAULT NULL COMMENT '地址',
  `type` int(11) DEFAULT NULL COMMENT '类型 1 安卓  2 PC',
  `create_time` datetime DEFAULT NULL COMMENT '版本发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_version
-- ----------------------------

-- ----------------------------
-- Table structure for biz_video_his_camera
-- ----------------------------
DROP TABLE IF EXISTS `biz_video_his_camera`;
CREATE TABLE `biz_video_his_camera` (
  `sessionId` varchar(32) DEFAULT NULL COMMENT '请求表的UUID',
  `resId` varchar(32) DEFAULT NULL COMMENT '资源ID',
  `fileName` varchar(300) DEFAULT NULL COMMENT '文件名称',
  `beginTime` int(20) DEFAULT NULL COMMENT '开始时间秒数',
  `endTime` int(20) DEFAULT NULL COMMENT '结束时间秒数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_video_his_camera
-- ----------------------------

-- ----------------------------
-- Table structure for biz_video_his_request
-- ----------------------------
DROP TABLE IF EXISTS `biz_video_his_request`;
CREATE TABLE `biz_video_his_request` (
  `sessionId` varchar(32) NOT NULL COMMENT '主键',
  `resId` varchar(32) DEFAULT NULL COMMENT '资源ID',
  `police_id` varchar(32) DEFAULT NULL COMMENT '发起请求的警员ID',
  `create_time` datetime DEFAULT NULL COMMENT '发起时间',
  `beginTime` int(20) DEFAULT NULL COMMENT '天网历史视频的开始时间秒数',
  `endTime` int(20) DEFAULT NULL COMMENT '天网历史视频的结束时间秒数',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_video_his_request
-- ----------------------------

-- ----------------------------
-- Table structure for biz_video_live_request
-- ----------------------------
DROP TABLE IF EXISTS `biz_video_live_request`;
CREATE TABLE `biz_video_live_request` (
  `session_id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键',
  `res_id` varchar(32) NOT NULL COMMENT '资源ID',
  `rtmp` varchar(255) DEFAULT NULL COMMENT '可用的RTMP地址',
  `relay_rtmp` varchar(255) DEFAULT NULL COMMENT '转载rtmp地址，非转载时为空',
  `relay_id` varchar(32) DEFAULT NULL COMMENT '转载session_id，非转载时为空',
  `res_type` int(11) NOT NULL COMMENT '天网实时=10，眼镜实时=20，天网历史=30',
  `business_type` int(11) NOT NULL COMMENT '上墙=10，非上墙=20',
  `query_num` int(10) unsigned zerofill DEFAULT NULL,
  `business_status` int(255) NOT NULL COMMENT '初始态=10，请求态=20，可播放态=30，播放态=40，结束态=50',
  `business_num` int(10) DEFAULT NULL COMMENT '业务计数',
  `sync_publish_num` int(10) DEFAULT NULL COMMENT '同步publish的次数',
  `sync_play_num` int(10) DEFAULT NULL COMMENT '同步play的次数',
  `client_id` int(32) DEFAULT NULL COMMENT 'nginx进程ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '发起请求的警员ID',
  `server_ip` varchar(20) DEFAULT NULL COMMENT 'rtmp的ip地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `window_id` varchar(10) DEFAULT NULL COMMENT '屏ID，只对上墙业务有效',
  `device_ip` varchar(32) DEFAULT NULL COMMENT '墙IP，只对上墙业务有效',
  `begin_time` varchar(20) DEFAULT NULL COMMENT '开始播放时间，只对天网历史流播放有效',
  `end_time` varchar(20) DEFAULT NULL COMMENT '结束播放时间，只对天网历史流播放有效',
  `version` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_video_live_request
-- ----------------------------

-- ----------------------------
-- Table structure for biz_video_play
-- ----------------------------
DROP TABLE IF EXISTS `biz_video_play`;
CREATE TABLE `biz_video_play` (
  `session_id` varchar(32) NOT NULL,
  `rtmp` varchar(255) NOT NULL,
  `server_ip` varchar(20) NOT NULL,
  `client_id` int(10) NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_video_play
-- ----------------------------

-- ----------------------------
-- Table structure for biz_video_publish
-- ----------------------------
DROP TABLE IF EXISTS `biz_video_publish`;
CREATE TABLE `biz_video_publish` (
  `rtmp` varchar(255) NOT NULL,
  `server_ip` varchar(20) NOT NULL,
  `client_id` int(11) NOT NULL,
  `sync_publish_num` int(10) DEFAULT NULL COMMENT '合法==10，非法==20',
  PRIMARY KEY (`rtmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_video_publish
-- ----------------------------

-- ----------------------------
-- Table structure for biz_voice_request
-- ----------------------------
DROP TABLE IF EXISTS `biz_voice_request`;
CREATE TABLE `biz_voice_request` (
  `id` varchar(32) NOT NULL COMMENT 'UUID',
  `source_police_id` varchar(32) NOT NULL COMMENT '请求方警员UUID',
  `dest_police_id` varchar(32) DEFAULT NULL COMMENT '被请求方警员UUID',
  `request_time` datetime NOT NULL COMMENT '请求语音通话时间',
  `call_start` datetime DEFAULT NULL COMMENT '通话开始时间',
  `call_end` datetime DEFAULT NULL COMMENT '通话结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_voice_request
-- ----------------------------

-- ----------------------------
-- Table structure for biz_wall
-- ----------------------------
DROP TABLE IF EXISTS `biz_wall`;
CREATE TABLE `biz_wall` (
  `window_id` varchar(32) NOT NULL DEFAULT '' COMMENT '监视窗口编号',
  `server_id` varchar(64) NOT NULL COMMENT '墙的UUID',
  `device_ip` varchar(32) NOT NULL COMMENT '墙的ip',
  `total_width` varchar(10) DEFAULT NULL COMMENT '墙的总宽度',
  `total_height` varchar(10) DEFAULT NULL COMMENT '墙的总高度',
  `pos_x` varchar(10) NOT NULL COMMENT '监视窗口左上角坐标x',
  `pos_y` varchar(10) NOT NULL COMMENT '监视窗口左上角坐标y',
  `pos_w` varchar(10) NOT NULL COMMENT '监视窗口宽',
  `pos_h` varchar(10) NOT NULL COMMENT '监视窗口高',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`window_id`,`device_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_wall
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `citycode` varchar(32) NOT NULL,
  PRIMARY KEY (`citycode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('quartzScheduler', 'localhost.localdomain1537520691449', '1537521111973', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `quartz_job`;
CREATE TABLE `quartz_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'Spring Bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态，0：暂停，1：正常',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of quartz_job
-- ----------------------------

-- ----------------------------
-- Table structure for quartz_job_log
-- ----------------------------
DROP TABLE IF EXISTS `quartz_job_log`;
CREATE TABLE `quartz_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态 0：失败 1：成功',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of quartz_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `area_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '区域id',
  `area_code` varchar(50) NOT NULL COMMENT '行政区划代码',
  `parent_code` varchar(50) NOT NULL COMMENT '父级id',
  `name` varchar(20) DEFAULT NULL COMMENT '地区名称',
  `layer` int(11) DEFAULT NULL COMMENT '层级',
  `order_num` int(11) DEFAULT NULL COMMENT '排序号,1:省级,2:地市,3:区县',
  `status` tinyint(4) DEFAULT NULL COMMENT '显示,1:显示,0:隐藏',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `area_pic` longtext COMMENT '区域图片',
  `longitude` double(10,6) DEFAULT NULL,
  `latitude` double(10,6) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='行政区划';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '1', '0', '区域根目录', '1', '1', '1', '', '2017-04-24 15:54:31', '2018-09-21 16:46:08', '', '114.443574', '30.485920');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_macro
-- ----------------------------
DROP TABLE IF EXISTS `sys_macro`;
CREATE TABLE `sys_macro` (
  `macro_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` bigint(255) DEFAULT NULL COMMENT '父级id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `value` varchar(2000) DEFAULT NULL COMMENT '值',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，0：隐藏   1：显示',
  `type` tinyint(20) DEFAULT NULL COMMENT '类型,0:目录，1:参数配置',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`macro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通用字典表';

-- ----------------------------
-- Records of sys_macro
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, '', '0', 'fa fa-coffee', '0', '2017-08-09 22:49:47', '2017-09-11 17:25:22');
INSERT INTO `sys_menu` VALUES ('2', '1', '系统菜单', 'base/menu/list.html', null, '1', 'fa fa-th-list', '1', '2017-08-09 22:55:15', '2017-08-17 10:00:12');
INSERT INTO `sys_menu` VALUES ('3', '0', '基础资料', null, null, '0', 'fa fa-desktop', '1', '2017-08-09 23:06:55', '2018-01-09 10:29:08');
INSERT INTO `sys_menu` VALUES ('6', '3', '警员管理', 'base/user/list.html', '', '1', 'fa fa-user', '2', '2017-08-10 14:12:11', '2017-12-29 16:01:32');
INSERT INTO `sys_menu` VALUES ('7', '1', '角色管理', 'base/role/list.html', '', '1', 'fa fa-paw', '1', '2017-08-10 14:13:19', '2018-01-09 10:31:26');
INSERT INTO `sys_menu` VALUES ('11', '6', '刷新', '/sys/user/list', 'sys:user:list', '2', null, '0', '2017-08-14 10:51:05', '2017-09-05 12:47:23');
INSERT INTO `sys_menu` VALUES ('12', '6', '新增', '/sys/user/save', 'sys:user:save', '2', null, '0', '2017-08-14 10:51:35', '2017-09-05 12:47:34');
INSERT INTO `sys_menu` VALUES ('13', '6', '编辑', '/sys/user/update', 'sys:user:edit', '2', null, '0', '2017-08-14 10:52:06', '2017-09-05 12:47:46');
INSERT INTO `sys_menu` VALUES ('14', '6', '删除', '/sys/user/remove', 'sys:user:remove', '2', null, '0', '2017-08-14 10:52:24', '2017-09-05 12:48:03');
INSERT INTO `sys_menu` VALUES ('15', '7', '刷新', '/sys/role/list', 'sys:role:list', '2', null, '0', '2017-08-14 10:56:37', '2017-09-05 12:44:04');
INSERT INTO `sys_menu` VALUES ('16', '7', '新增', '/sys/role/save', 'sys:role:save', '2', null, '0', '2017-08-14 10:57:02', '2017-09-05 12:44:23');
INSERT INTO `sys_menu` VALUES ('17', '7', '编辑', '/sys/role/update', 'sys:role:edit', '2', null, '0', '2017-08-14 10:57:31', '2017-09-05 12:44:48');
INSERT INTO `sys_menu` VALUES ('18', '7', '删除', '/sys/role/remove', 'sys:role:remove', '2', null, '0', '2017-08-14 10:57:50', '2017-09-05 12:45:02');
INSERT INTO `sys_menu` VALUES ('19', '7', '操作权限', '/sys/role/authorize/opt', 'sys:role:authorizeOpt', '2', null, '0', '2017-08-14 10:58:55', '2017-09-05 12:45:29');
INSERT INTO `sys_menu` VALUES ('20', '2', '刷新', '/sys/menu/list', 'sys:menu:list', '2', null, '0', '2017-08-14 10:59:32', '2017-09-05 13:06:24');
INSERT INTO `sys_menu` VALUES ('21', '2', '新增', '/sys/menu/save', 'sys:menu:save', '2', null, '0', '2017-08-14 10:59:56', '2017-09-05 13:06:35');
INSERT INTO `sys_menu` VALUES ('22', '2', '编辑', '/sys/menu/update', 'sys:menu:edit', '2', null, '0', '2017-08-14 11:00:26', '2017-09-05 13:06:48');
INSERT INTO `sys_menu` VALUES ('23', '2', '删除', '/sys/menu/remove', 'sys:menu:remove', '2', null, '0', '2017-08-14 11:00:58', '2017-09-05 13:07:00');
INSERT INTO `sys_menu` VALUES ('24', '6', '启用', '/sys/user/enable', 'sys:user:enable', '2', null, '0', '2017-08-14 17:27:18', '2017-09-05 12:48:30');
INSERT INTO `sys_menu` VALUES ('25', '6', '停用', '/sys/user/disable', 'sys:user:disable', '2', null, '0', '2017-08-14 17:27:43', '2017-09-05 12:48:49');
INSERT INTO `sys_menu` VALUES ('26', '6', '重置密码', '/sys/user/rest', 'sys:user:resetPassword', '2', null, '0', '2017-08-14 17:28:34', '2017-09-05 12:49:17');
INSERT INTO `sys_menu` VALUES ('27', '1', '系统日志', 'base/log/list.html', null, '1', 'fa fa-warning', '3', '2017-08-14 22:11:53', '2017-08-17 09:55:19');
INSERT INTO `sys_menu` VALUES ('28', '27', '刷新', '/sys/log/list', 'sys:log:list', '2', null, '0', '2017-08-14 22:30:22', '2017-09-05 13:05:24');
INSERT INTO `sys_menu` VALUES ('29', '27', '删除', '/sys/log/remove', 'sys:log:remove', '2', null, '0', '2017-08-14 22:30:43', '2017-09-05 13:05:37');
INSERT INTO `sys_menu` VALUES ('30', '27', '清空', '/sys/log/clear', 'sys:log:clear', '2', null, '0', '2017-08-14 22:31:02', '2017-09-05 13:05:53');
INSERT INTO `sys_menu` VALUES ('36', '3', '组织机构', 'base/org/list.html', '', '1', 'fa fa-sitemap', '0', '2017-08-17 09:57:14', '2018-01-09 10:29:31');
INSERT INTO `sys_menu` VALUES ('37', '3', '行政区域', 'base/area/list.html', 'sys:area:list', '1', 'fa fa-leaf', '0', '2017-08-17 09:59:57', '2018-01-09 10:30:07');
INSERT INTO `sys_menu` VALUES ('38', '37', '刷新', '/sys/area/list', 'sys:area:list', '2', null, '0', '2017-08-17 10:01:33', '2017-09-05 13:00:54');
INSERT INTO `sys_menu` VALUES ('39', '37', '新增', '/sys/area/save', 'sys:area:save', '2', null, '0', '2017-08-17 10:02:16', '2017-09-05 13:01:06');
INSERT INTO `sys_menu` VALUES ('40', '37', '编辑', '/sys/area/update', 'sys:area:edit', '2', null, '0', '2017-08-17 10:02:33', '2017-09-05 13:01:21');
INSERT INTO `sys_menu` VALUES ('41', '37', '删除', '/sys/area/remove', 'sys:area:remove', '2', null, '0', '2017-08-17 10:02:50', '2017-09-05 13:01:32');
INSERT INTO `sys_menu` VALUES ('42', '36', '刷新', '/sys/org/list', 'sys:org:list', '2', null, '0', '2017-08-17 10:03:36', '2017-09-05 11:47:37');
INSERT INTO `sys_menu` VALUES ('43', '36', '新增', '/sys/org/save', 'sys:org:save', '2', null, '0', '2017-08-17 10:03:54', '2017-09-05 12:40:55');
INSERT INTO `sys_menu` VALUES ('44', '36', '编辑', '/sys/org/update', 'sys:org:edit', '2', null, '0', '2017-08-17 10:04:11', '2017-09-05 12:43:06');
INSERT INTO `sys_menu` VALUES ('45', '36', '删除', '/sys/org/remove', 'sys:org:remove', '2', null, '0', '2017-08-17 10:04:30', '2017-09-05 12:42:19');
INSERT INTO `sys_menu` VALUES ('64', '0', '区域划分', '/area/list.html', 'area:list:html', '1', 'fa fa-send', '2', '2017-12-20 11:31:45', '2018-03-16 10:46:25');
INSERT INTO `sys_menu` VALUES ('65', '0', '地图', '/pstn/list.html', 'pstn:list:html', '1', 'fa  fa-life-ring', '3', '2017-12-20 11:32:45', '2018-03-16 10:46:36');
INSERT INTO `sys_menu` VALUES ('66', '0', '视频查看', '/videos/list.html', 'videos:list:html', '1', 'fa fa-toggle-right', '4', '2017-12-20 11:33:45', '2018-03-16 10:46:50');
INSERT INTO `sys_menu` VALUES ('67', '0', '告警', '/alarm/list.html', 'alarm:list:html', '1', 'fa fa-volume-up', '6', '2017-12-20 11:34:45', '2018-03-16 10:47:03');
INSERT INTO `sys_menu` VALUES ('68', '0', '处置报告', '/report/list.html', 'report:list:html', '1', 'fa fa-file-text', '7', '2017-12-20 11:35:45', '2018-03-16 10:47:15');
INSERT INTO `sys_menu` VALUES ('69', '0', '历史轨迹', '/trail/list.html', 'trail:list:html', '1', 'fa  fa-arrows', '8', '2017-12-20 11:36:45', '2018-03-16 10:47:32');
INSERT INTO `sys_menu` VALUES ('70', '0', '巡更管理', '/patrol/list.html', 'patrol:list:html', '1', 'fa  fa-soundcloud', '9', '2017-12-20 11:36:45', '2018-03-16 10:47:46');
INSERT INTO `sys_menu` VALUES ('74', '3', '眼镜管理', 'base/glasses/list.html', null, '1', 'fa fa-eye', '0', '2017-12-28 20:48:03', '2018-01-09 10:30:34');
INSERT INTO `sys_menu` VALUES ('75', '3', 'PDA管理', 'base/pda/list.html', null, '1', 'fa fa-phone', '1', '2017-12-29 10:33:01', '2018-01-09 10:30:43');
INSERT INTO `sys_menu` VALUES ('76', '74', '刷新', '/sys/device/list', 'sys:device:list', '2', null, '0', '2018-01-05 20:06:25', null);
INSERT INTO `sys_menu` VALUES ('77', '74', '新增', '/sys/device/save', 'sys:device:save', '2', null, '0', '2018-01-05 20:07:14', null);
INSERT INTO `sys_menu` VALUES ('78', '74', '编辑', '/sys/device/update', 'sys:device:edit', '2', null, '0', '2018-01-05 20:09:17', null);
INSERT INTO `sys_menu` VALUES ('79', '74', '分配', '/sys/device/saveAssign', 'sys:device:saveAssign', '2', null, '0', '2018-01-08 15:16:50', null);
INSERT INTO `sys_menu` VALUES ('80', '74', '解除分配', '/sys/device/removeAssign', 'sys:device:removeAssign', '2', null, '0', '2018-01-08 15:21:10', null);
INSERT INTO `sys_menu` VALUES ('81', '75', '刷新', '/sys/device/list', 'sys:device:list', '2', null, '0', '2018-01-08 15:21:38', null);
INSERT INTO `sys_menu` VALUES ('82', '75', '新增', '/sys/device/save', 'sys:device:save', '2', null, '0', '2018-01-08 15:22:00', null);
INSERT INTO `sys_menu` VALUES ('83', '75', '编辑', '/sys/device/update', 'sys:device:edit', '2', null, '0', '2018-01-08 15:22:26', null);
INSERT INTO `sys_menu` VALUES ('84', '75', '分配', '/sys/device/saveAssign', 'sys:device:saveAssign', '2', null, '0', '2018-01-08 15:22:51', null);
INSERT INTO `sys_menu` VALUES ('85', '75', '解除分配', '/sys/device/removeAssign', 'sys:device:removeAssign', '2', null, '0', '2018-01-08 15:23:17', null);
INSERT INTO `sys_menu` VALUES ('86', '0', '案情查看', '/case/list.html', 'case:list:html', '1', 'fa fa-leaf', '10', '2018-02-02 11:54:43', '2018-03-16 10:47:58');
INSERT INTO `sys_menu` VALUES ('87', '86', '查看案件列表', '/cases/list', 'cases:list', '1', null, null, '2018-02-02 16:24:39', null);
INSERT INTO `sys_menu` VALUES ('88', '86', '查看案件详情', '/cases/info', 'cases:info', '1', null, null, '2018-02-02 16:25:58', null);
INSERT INTO `sys_menu` VALUES ('89', '86', '新增案情', '/cases/save', 'cases:save', '1', null, null, '2018-02-02 16:26:40', null);
INSERT INTO `sys_menu` VALUES ('90', '86', '修改案情', '/cases/update', 'cases:update', '1', null, null, '2018-02-02 16:27:14', null);
INSERT INTO `sys_menu` VALUES ('91', '68', '处置报告修改', '', '', '1', null, null, null, '2018-02-11 15:49:54');
INSERT INTO `sys_menu` VALUES ('92', '86', '案情办结', '/cases/close', 'cases:close', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('93', '68', '处置报告列表', '/cases/listReport', 'cases:listReport', '1', null, '0', '2018-02-08 15:42:53', '2018-02-08 15:46:50');
INSERT INTO `sys_menu` VALUES ('94', '68', '处置报告详情', '', '', '1', null, '0', '2018-02-08 15:46:20', '2018-02-11 15:56:43');
INSERT INTO `sys_menu` VALUES ('95', '86', '警员分配', '/police/assign', 'police:assign', '2', null, '0', '2018-02-08 15:49:52', '2018-02-08 16:35:20');
INSERT INTO `sys_menu` VALUES ('96', '86', '解除分配', '/police/removeAssign', 'police:removeAssign', '2', null, '0', '2018-02-08 15:50:39', '2018-02-08 16:35:36');
INSERT INTO `sys_menu` VALUES ('97', '86', '授权天网', '/police/authoriz', 'police:authoriz', '2', null, '0', '2018-02-08 15:51:50', '2018-02-08 16:35:50');
INSERT INTO `sys_menu` VALUES ('98', '0', '登录', '', '', '1', null, '0', '2018-02-09 10:59:41', '2018-02-11 15:48:17');
INSERT INTO `sys_menu` VALUES ('99', '98', 'web登录', 'sys/login', 'sys:login', '2', null, '0', '2018-02-09 11:00:42', null);
INSERT INTO `sys_menu` VALUES ('100', '98', 'pda登录', 'app/sys/login', 'app:sys:login', '2', null, '0', '2018-02-09 11:01:18', null);
INSERT INTO `sys_menu` VALUES ('101', '86', 'pda查看案件列表', '/app/cases/list', 'app:cases:list', '1', null, '0', '2018-02-11 15:34:56', null);
INSERT INTO `sys_menu` VALUES ('102', '86', 'pda查看案件详情', '/app/cases/info', 'app:cases:info', '1', null, '0', '2018-02-11 15:38:54', null);
INSERT INTO `sys_menu` VALUES ('103', '91', 'web端处置报告修改', 'cases/uploadFilePc', 'cases:uploadFilePc', '2', null, '0', '2018-02-11 15:51:20', null);
INSERT INTO `sys_menu` VALUES ('104', '91', 'pda处置报告修改', 'app/cases/updateReport', 'app:cases:updateReport', '2', null, '0', '2018-02-11 15:56:04', null);
INSERT INTO `sys_menu` VALUES ('105', '94', 'web端处置报告详情', 'cases/getReportById', 'cases:getReportById', '2', null, '0', '2018-02-11 15:58:03', null);
INSERT INTO `sys_menu` VALUES ('106', '94', 'pda端处置报告详情', 'app/cases/getReportByCaseId', 'app:cases:getReportByCaseId', '2', null, '0', '2018-02-11 15:58:49', null);
INSERT INTO `sys_menu` VALUES ('107', '0', 'pda用户信息', null, null, '1', null, '0', '2018-02-11 16:07:12', null);
INSERT INTO `sys_menu` VALUES ('108', '107', '通讯录', 'app/sys/user/listCallNumber', 'app:sys:user:listCallNumber', '2', null, '0', '2018-02-11 16:08:21', null);
INSERT INTO `sys_menu` VALUES ('109', '107', '修改密码', 'app/sys/user/updatePswd', 'app:sys:user:updatePswd', '2', null, '0', '2018-02-11 16:09:07', null);
INSERT INTO `sys_menu` VALUES ('110', '107', '修改头像', 'app/sys/user/updatePic', 'app:sys:user:updatePic', '2', null, '0', '2018-02-11 16:10:05', null);
INSERT INTO `sys_menu` VALUES ('113', '0', '告警查看', '/alarm/list.html', 'alarm:list.html', '1', null, '11', '2018-04-04 15:39:35', null);
INSERT INTO `sys_menu` VALUES ('114', '113', '查看告警列表', '/alarm/list', 'alarm:list', '1', null, null, '2018-04-04 15:44:33', null);
INSERT INTO `sys_menu` VALUES ('115', '113', '查看告警详情', '/alarm/info', 'alarm:info', '1', null, null, '2018-04-09 14:50:11', null);
INSERT INTO `sys_menu` VALUES ('116', '113', '新增告警', '/alarm/save', 'alarm:save', '1', null, null, '2018-04-09 14:56:19', null);
INSERT INTO `sys_menu` VALUES ('117', '0', '三证一牌', null, null, '1', null, '0', '2018-04-19 14:54:16', null);
INSERT INTO `sys_menu` VALUES ('118', '117', '三证一牌查询', 'app/passport/query', 'app:idcard:info', '1', null, '0', '2018-04-19 14:56:42', null);
INSERT INTO `sys_menu` VALUES ('119', '117', '告警上报', 'app/alarm/save', 'app:alarm:save', '1', null, '0', '2018-04-19 17:26:00', null);
INSERT INTO `sys_menu` VALUES ('120', '70', '新增巡更', 'patrol/save', 'patrol:save', '1', null, '0', '2018-05-04 17:19:08', null);
INSERT INTO `sys_menu` VALUES ('121', '70', '修改巡更', 'patrol/update', 'patrol:update', '1', null, '0', '2018-05-04 17:19:56', null);
INSERT INTO `sys_menu` VALUES ('122', '70', '删除巡更', 'patrol/remove', 'patrol:remove', '1', null, '0', '2018-05-04 17:20:40', null);
INSERT INTO `sys_menu` VALUES ('123', '70', '巡更详情', 'patrol/info', 'patrol:info', '1', null, '0', '2018-05-04 17:21:20', null);
INSERT INTO `sys_menu` VALUES ('124', '70', '巡更列表', 'patrol/list', 'patrol:list', '1', null, '0', '2018-05-04 17:22:12', null);
INSERT INTO `sys_menu` VALUES ('125', '3', 'APK版本管理', 'base/apk/list.html', 'version:list', '1', 'fa fa-upload', '1', '2018-05-11 14:38:16', '2018-05-11 15:30:35');
INSERT INTO `sys_menu` VALUES ('126', '125', '新增', '/sys/appVersion/upload', 'sys:appVersion:upload', '2', null, '0', '2018-05-11 14:41:09', '2018-05-11 15:34:59');
INSERT INTO `sys_menu` VALUES ('127', '125', '刷新', '/version/list', 'version:list', '2', null, '0', '2018-05-11 15:39:26', '2018-05-11 15:39:59');
INSERT INTO `sys_menu` VALUES ('128', '66', '眼镜历史视频', '', 'video:list:policeVideo', '2', null, '0', '2018-07-24 17:16:17', '2018-08-02 10:42:52');
INSERT INTO `sys_menu` VALUES ('129', '66', '视频查看', 'videos/list', 'videos:list', '2', null, '0', '2018-08-02 14:25:27', null);

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `org_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '机构id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级机构ID，一级机构为0',
  `code` varchar(100) DEFAULT NULL COMMENT '机构编码',
  `name` varchar(100) DEFAULT NULL COMMENT '机构名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) DEFAULT '1' COMMENT '可用标识  1：可用  0：不可用',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`org_id`),
  UNIQUE KEY `unique_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='机构管理';

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('39', '0', '100', '组织根目录', '0', '1', '2018-09-21 16:25:44', '2018-09-21 16:26:12');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` varchar(32) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `unique_roleName` (`role_name`) USING BTREE,
  UNIQUE KEY `unique_roleSign` (`role_sign`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='系统角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '【系统内置】', '2', '2017-08-12 00:43:52', '2017-09-05 14:02:04');
INSERT INTO `sys_role` VALUES ('42', '大队长', 'battalionChief', '【系统内置】', '1', '2018-01-03 21:05:44', '2018-01-09 11:17:11');
INSERT INTO `sys_role` VALUES ('43', '中心值班员', 'centerDutyOfficer', '【系统内置】', '1', '2018-01-09 10:35:49', '2018-01-09 10:36:58');
INSERT INTO `sys_role` VALUES ('44', '警员', 'police', '【系统内置】', '1', '2018-01-09 10:37:48', null);
INSERT INTO `sys_role` VALUES ('45', '测试', 'test', '测试角色', 'd0f5ebc74439440393baf760907ba358', '2018-02-08 18:08:29', null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2914 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1828', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('1829', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('1830', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('1831', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('1832', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('1833', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('1835', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('1836', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('1837', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('1838', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('1839', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('1840', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('1846', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('1847', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('1848', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('1849', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('1850', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('1851', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('1852', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('1853', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('1854', '1', '44');
INSERT INTO `sys_role_menu` VALUES ('1855', '1', '45');
INSERT INTO `sys_role_menu` VALUES ('1856', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('1857', '1', '38');
INSERT INTO `sys_role_menu` VALUES ('1858', '1', '39');
INSERT INTO `sys_role_menu` VALUES ('1859', '1', '40');
INSERT INTO `sys_role_menu` VALUES ('1860', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('1861', '1', '74');
INSERT INTO `sys_role_menu` VALUES ('1862', '1', '76');
INSERT INTO `sys_role_menu` VALUES ('1863', '1', '77');
INSERT INTO `sys_role_menu` VALUES ('1864', '1', '78');
INSERT INTO `sys_role_menu` VALUES ('1865', '1', '79');
INSERT INTO `sys_role_menu` VALUES ('1866', '1', '80');
INSERT INTO `sys_role_menu` VALUES ('1867', '1', '75');
INSERT INTO `sys_role_menu` VALUES ('1868', '1', '81');
INSERT INTO `sys_role_menu` VALUES ('1869', '1', '82');
INSERT INTO `sys_role_menu` VALUES ('1870', '1', '83');
INSERT INTO `sys_role_menu` VALUES ('1871', '1', '84');
INSERT INTO `sys_role_menu` VALUES ('1872', '1', '85');
INSERT INTO `sys_role_menu` VALUES ('1873', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('1874', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('1875', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('1876', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('1877', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('1878', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('1879', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('1880', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('2455', '1', '125');
INSERT INTO `sys_role_menu` VALUES ('2456', '1', '126');
INSERT INTO `sys_role_menu` VALUES ('2457', '1', '127');
INSERT INTO `sys_role_menu` VALUES ('2756', '42', '98');
INSERT INTO `sys_role_menu` VALUES ('2757', '42', '99');
INSERT INTO `sys_role_menu` VALUES ('2758', '42', '100');
INSERT INTO `sys_role_menu` VALUES ('2759', '42', '107');
INSERT INTO `sys_role_menu` VALUES ('2760', '42', '108');
INSERT INTO `sys_role_menu` VALUES ('2761', '42', '109');
INSERT INTO `sys_role_menu` VALUES ('2762', '42', '110');
INSERT INTO `sys_role_menu` VALUES ('2763', '42', '66');
INSERT INTO `sys_role_menu` VALUES ('2764', '42', '129');
INSERT INTO `sys_role_menu` VALUES ('2765', '42', '68');
INSERT INTO `sys_role_menu` VALUES ('2766', '42', '91');
INSERT INTO `sys_role_menu` VALUES ('2767', '42', '103');
INSERT INTO `sys_role_menu` VALUES ('2768', '42', '104');
INSERT INTO `sys_role_menu` VALUES ('2769', '42', '93');
INSERT INTO `sys_role_menu` VALUES ('2770', '42', '94');
INSERT INTO `sys_role_menu` VALUES ('2771', '42', '105');
INSERT INTO `sys_role_menu` VALUES ('2772', '42', '106');
INSERT INTO `sys_role_menu` VALUES ('2773', '42', '69');
INSERT INTO `sys_role_menu` VALUES ('2774', '42', '70');
INSERT INTO `sys_role_menu` VALUES ('2775', '42', '120');
INSERT INTO `sys_role_menu` VALUES ('2776', '42', '121');
INSERT INTO `sys_role_menu` VALUES ('2777', '42', '122');
INSERT INTO `sys_role_menu` VALUES ('2778', '42', '123');
INSERT INTO `sys_role_menu` VALUES ('2779', '42', '124');
INSERT INTO `sys_role_menu` VALUES ('2780', '42', '86');
INSERT INTO `sys_role_menu` VALUES ('2781', '42', '87');
INSERT INTO `sys_role_menu` VALUES ('2782', '42', '88');
INSERT INTO `sys_role_menu` VALUES ('2783', '43', '98');
INSERT INTO `sys_role_menu` VALUES ('2784', '43', '99');
INSERT INTO `sys_role_menu` VALUES ('2785', '43', '64');
INSERT INTO `sys_role_menu` VALUES ('2786', '43', '65');
INSERT INTO `sys_role_menu` VALUES ('2787', '43', '66');
INSERT INTO `sys_role_menu` VALUES ('2788', '43', '128');
INSERT INTO `sys_role_menu` VALUES ('2789', '43', '67');
INSERT INTO `sys_role_menu` VALUES ('2790', '43', '68');
INSERT INTO `sys_role_menu` VALUES ('2791', '43', '91');
INSERT INTO `sys_role_menu` VALUES ('2792', '43', '93');
INSERT INTO `sys_role_menu` VALUES ('2793', '43', '94');
INSERT INTO `sys_role_menu` VALUES ('2794', '43', '105');
INSERT INTO `sys_role_menu` VALUES ('2795', '43', '69');
INSERT INTO `sys_role_menu` VALUES ('2796', '43', '70');
INSERT INTO `sys_role_menu` VALUES ('2797', '43', '123');
INSERT INTO `sys_role_menu` VALUES ('2798', '43', '124');
INSERT INTO `sys_role_menu` VALUES ('2799', '43', '86');
INSERT INTO `sys_role_menu` VALUES ('2800', '43', '87');
INSERT INTO `sys_role_menu` VALUES ('2801', '43', '88');
INSERT INTO `sys_role_menu` VALUES ('2802', '43', '89');
INSERT INTO `sys_role_menu` VALUES ('2803', '43', '90');
INSERT INTO `sys_role_menu` VALUES ('2804', '43', '92');
INSERT INTO `sys_role_menu` VALUES ('2805', '43', '95');
INSERT INTO `sys_role_menu` VALUES ('2806', '43', '96');
INSERT INTO `sys_role_menu` VALUES ('2807', '43', '97');
INSERT INTO `sys_role_menu` VALUES ('2808', '43', '113');
INSERT INTO `sys_role_menu` VALUES ('2809', '43', '114');
INSERT INTO `sys_role_menu` VALUES ('2810', '43', '115');
INSERT INTO `sys_role_menu` VALUES ('2811', '43', '116');
INSERT INTO `sys_role_menu` VALUES ('2840', '45', '98');
INSERT INTO `sys_role_menu` VALUES ('2841', '45', '99');
INSERT INTO `sys_role_menu` VALUES ('2842', '45', '100');
INSERT INTO `sys_role_menu` VALUES ('2843', '45', '107');
INSERT INTO `sys_role_menu` VALUES ('2844', '45', '108');
INSERT INTO `sys_role_menu` VALUES ('2845', '45', '109');
INSERT INTO `sys_role_menu` VALUES ('2846', '45', '110');
INSERT INTO `sys_role_menu` VALUES ('2847', '45', '117');
INSERT INTO `sys_role_menu` VALUES ('2848', '45', '118');
INSERT INTO `sys_role_menu` VALUES ('2849', '45', '119');
INSERT INTO `sys_role_menu` VALUES ('2850', '45', '64');
INSERT INTO `sys_role_menu` VALUES ('2851', '45', '65');
INSERT INTO `sys_role_menu` VALUES ('2852', '45', '66');
INSERT INTO `sys_role_menu` VALUES ('2853', '45', '128');
INSERT INTO `sys_role_menu` VALUES ('2854', '45', '129');
INSERT INTO `sys_role_menu` VALUES ('2855', '45', '67');
INSERT INTO `sys_role_menu` VALUES ('2856', '45', '68');
INSERT INTO `sys_role_menu` VALUES ('2857', '45', '91');
INSERT INTO `sys_role_menu` VALUES ('2858', '45', '103');
INSERT INTO `sys_role_menu` VALUES ('2859', '45', '104');
INSERT INTO `sys_role_menu` VALUES ('2860', '45', '93');
INSERT INTO `sys_role_menu` VALUES ('2861', '45', '94');
INSERT INTO `sys_role_menu` VALUES ('2862', '45', '105');
INSERT INTO `sys_role_menu` VALUES ('2863', '45', '106');
INSERT INTO `sys_role_menu` VALUES ('2864', '45', '69');
INSERT INTO `sys_role_menu` VALUES ('2865', '45', '70');
INSERT INTO `sys_role_menu` VALUES ('2866', '45', '120');
INSERT INTO `sys_role_menu` VALUES ('2867', '45', '121');
INSERT INTO `sys_role_menu` VALUES ('2868', '45', '122');
INSERT INTO `sys_role_menu` VALUES ('2869', '45', '123');
INSERT INTO `sys_role_menu` VALUES ('2870', '45', '124');
INSERT INTO `sys_role_menu` VALUES ('2871', '45', '86');
INSERT INTO `sys_role_menu` VALUES ('2872', '45', '87');
INSERT INTO `sys_role_menu` VALUES ('2873', '45', '88');
INSERT INTO `sys_role_menu` VALUES ('2874', '45', '89');
INSERT INTO `sys_role_menu` VALUES ('2875', '45', '90');
INSERT INTO `sys_role_menu` VALUES ('2876', '45', '92');
INSERT INTO `sys_role_menu` VALUES ('2877', '45', '95');
INSERT INTO `sys_role_menu` VALUES ('2878', '45', '96');
INSERT INTO `sys_role_menu` VALUES ('2879', '45', '97');
INSERT INTO `sys_role_menu` VALUES ('2880', '45', '101');
INSERT INTO `sys_role_menu` VALUES ('2881', '45', '102');
INSERT INTO `sys_role_menu` VALUES ('2882', '45', '113');
INSERT INTO `sys_role_menu` VALUES ('2883', '45', '114');
INSERT INTO `sys_role_menu` VALUES ('2884', '45', '115');
INSERT INTO `sys_role_menu` VALUES ('2885', '45', '116');
INSERT INTO `sys_role_menu` VALUES ('2886', '43', '100');
INSERT INTO `sys_role_menu` VALUES ('2887', '44', '98');
INSERT INTO `sys_role_menu` VALUES ('2888', '44', '99');
INSERT INTO `sys_role_menu` VALUES ('2889', '44', '100');
INSERT INTO `sys_role_menu` VALUES ('2890', '44', '107');
INSERT INTO `sys_role_menu` VALUES ('2891', '44', '108');
INSERT INTO `sys_role_menu` VALUES ('2892', '44', '109');
INSERT INTO `sys_role_menu` VALUES ('2893', '44', '110');
INSERT INTO `sys_role_menu` VALUES ('2894', '44', '66');
INSERT INTO `sys_role_menu` VALUES ('2895', '44', '129');
INSERT INTO `sys_role_menu` VALUES ('2896', '44', '68');
INSERT INTO `sys_role_menu` VALUES ('2897', '44', '91');
INSERT INTO `sys_role_menu` VALUES ('2898', '44', '103');
INSERT INTO `sys_role_menu` VALUES ('2899', '44', '104');
INSERT INTO `sys_role_menu` VALUES ('2900', '44', '93');
INSERT INTO `sys_role_menu` VALUES ('2901', '44', '94');
INSERT INTO `sys_role_menu` VALUES ('2902', '44', '105');
INSERT INTO `sys_role_menu` VALUES ('2903', '44', '106');
INSERT INTO `sys_role_menu` VALUES ('2904', '44', '69');
INSERT INTO `sys_role_menu` VALUES ('2905', '44', '70');
INSERT INTO `sys_role_menu` VALUES ('2906', '44', '123');
INSERT INTO `sys_role_menu` VALUES ('2907', '44', '124');
INSERT INTO `sys_role_menu` VALUES ('2908', '44', '86');
INSERT INTO `sys_role_menu` VALUES ('2909', '44', '87');
INSERT INTO `sys_role_menu` VALUES ('2910', '44', '88');
INSERT INTO `sys_role_menu` VALUES ('2911', '44', '92');
INSERT INTO `sys_role_menu` VALUES ('2912', '44', '101');
INSERT INTO `sys_role_menu` VALUES ('2913', '44', '102');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '用户id',
  `org_id` bigint(10) DEFAULT NULL COMMENT '所属机构',
  `policename` varchar(10) DEFAULT NULL COMMENT '警员姓名',
  `username` varchar(50) DEFAULT NULL COMMENT '警员编号',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `call_number` varchar(100) DEFAULT NULL COMMENT '通话号码',
  `open` int(1) DEFAULT NULL COMMENT '是否公开通信录',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `image` longtext COMMENT '用户图像',
  `user_id_create` varchar(32) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `login_status` int(11) DEFAULT '0' COMMENT '0未登陆，1已登陆',
  `pinyin_name` varchar(50) DEFAULT NULL COMMENT '警员姓名拼音',
  `salt` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `unique_username` (`username`) USING BTREE,
  UNIQUE KEY `unique_callNumber` (`call_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('d0f5ebc74439440393baf760907ba358', '27', 'admin', 'admin', '968206df0718baa2ff7a07d0dc919605', 'admin@163.com', '13593950879', '789456', '1', '1', '132', '', null, null, '2018-06-13 16:01:20', '0', '-a-d-m-i-n', 'ab9fae8e45db789048999449b13a8688');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(32) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=717 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('530', 'd0f5ebc74439440393baf760907ba358', '1');
INSERT INTO `sys_user_role` VALUES ('540', '0012f06c08894431ac90199727378c25', '42');
INSERT INTO `sys_user_role` VALUES ('544', '95dc6757091b4edfaabbe8796a22f8ce', '43');
INSERT INTO `sys_user_role` VALUES ('550', '55845e44bce945969bfaf246681cb929', '44');
INSERT INTO `sys_user_role` VALUES ('552', '592601b1987c4c6c8fa1bfaf34814726', '42');
INSERT INTO `sys_user_role` VALUES ('558', 'd1f5323f9486444ebd25559fe99e7fae', '44');
INSERT INTO `sys_user_role` VALUES ('560', '8ab566945b344469b88cd20dace331c7', '43');
INSERT INTO `sys_user_role` VALUES ('564', '6a25a4b7f49e46e2a356ba4a2fd3b686', '42');
INSERT INTO `sys_user_role` VALUES ('565', '1db412c7a987480a909079066c0cb7d0', '43');
INSERT INTO `sys_user_role` VALUES ('566', '67b19110f0bd43a9803a371219c9f973', '44');
INSERT INTO `sys_user_role` VALUES ('577', '06b96d369bcf47c7ae3168c18d2b956e', '44');
INSERT INTO `sys_user_role` VALUES ('586', 'd882a9f7d37840188da17b3db2749145', '43');
INSERT INTO `sys_user_role` VALUES ('587', '098534641e1c461b94b9ad2c1af1c498', '42');
INSERT INTO `sys_user_role` VALUES ('596', '30dee2696e79411695ef5cdfb2163dbf', '43');
INSERT INTO `sys_user_role` VALUES ('597', '467f97d185944c88ae0f6e69ae0796c7', '44');
INSERT INTO `sys_user_role` VALUES ('599', 'de82e67ff8144ae3a0df29f87a65e238', '44');
INSERT INTO `sys_user_role` VALUES ('600', 'f6cebac91b254db5afc9fe1fcd8ad3c5', '44');
INSERT INTO `sys_user_role` VALUES ('601', 'efabbdfcfbc1470ab11b83150024461e', '44');
INSERT INTO `sys_user_role` VALUES ('602', 'b21cdbada17a4caa932ed268244b6594', '44');
INSERT INTO `sys_user_role` VALUES ('603', '1d3e0b5ab1994666a41dcedb15c1e1ac', '44');
INSERT INTO `sys_user_role` VALUES ('604', 'c34dd31b177e4a30a009f5b337e5a68b', '44');
INSERT INTO `sys_user_role` VALUES ('605', '1d03789ff11343a7af004faf98e1687f', '44');
INSERT INTO `sys_user_role` VALUES ('606', '129f57b8ee90408087be1a97d8c59f33', '44');
INSERT INTO `sys_user_role` VALUES ('607', '904cbe9453c14c478f7938567d51f1eb', '44');
INSERT INTO `sys_user_role` VALUES ('608', '2086ed64bda848c188abacfc68a3198c', '44');
INSERT INTO `sys_user_role` VALUES ('609', '0d9ff3b8fd614f6dbef05238a0858b54', '44');
INSERT INTO `sys_user_role` VALUES ('610', 'b583b8d6dc084e588f86d1e8100ca4f9', '44');
INSERT INTO `sys_user_role` VALUES ('611', '61db601bece94d4fa12df7ebae87f0b9', '44');
INSERT INTO `sys_user_role` VALUES ('612', '4adfd043c7db4176af94bfd50e9696e7', '44');
INSERT INTO `sys_user_role` VALUES ('613', '4164d9aed41f4a69bec7549c958e4321', '44');
INSERT INTO `sys_user_role` VALUES ('614', 'd55317b4acd145969767c5c43bb55329', '44');
INSERT INTO `sys_user_role` VALUES ('615', '4ec477f4a8944c62b184ee9d10f3c694', '44');
INSERT INTO `sys_user_role` VALUES ('616', '6110e9a55871416fadd7c44173825fcd', '44');
INSERT INTO `sys_user_role` VALUES ('617', 'ec8ceab74188412f8385e820f5bc052b', '44');
INSERT INTO `sys_user_role` VALUES ('618', '2579b3f62b3c46cba82a36a5afbe302d', '44');
INSERT INTO `sys_user_role` VALUES ('619', '1407decbcb334ae3aaa2a4f37750c7d7', '44');
INSERT INTO `sys_user_role` VALUES ('620', 'a092e2dc5fb340bbafa4f7bd5dd39bf4', '44');
INSERT INTO `sys_user_role` VALUES ('621', '6099d44f1b93477dbe0e7cbba35f5d6c', '44');
INSERT INTO `sys_user_role` VALUES ('622', '3592a067e91347b19ae274f8c9334d44', '44');
INSERT INTO `sys_user_role` VALUES ('623', '48da5a50a17f4b70b8c0642b500a3f9e', '44');
INSERT INTO `sys_user_role` VALUES ('624', '6550557bad764a7aa65ba7862b107c1b', '44');
INSERT INTO `sys_user_role` VALUES ('625', '23d108552fe34e629f44840a05cdd7ad', '44');
INSERT INTO `sys_user_role` VALUES ('626', '644264f46dee48ada807588bf70383e0', '44');
INSERT INTO `sys_user_role` VALUES ('627', '8de1a77f42cc477d9a70be3b13b9ce3d', '44');
INSERT INTO `sys_user_role` VALUES ('629', 'aa1598f603ae41f7b41d5bd08e8a08fe', '44');
INSERT INTO `sys_user_role` VALUES ('630', '3884b204db794e7b95584647c23798c2', '44');
INSERT INTO `sys_user_role` VALUES ('631', 'bdfc641c5d3a49ed8e1ca4e103d5d235', '44');
INSERT INTO `sys_user_role` VALUES ('632', '6661ec72d6794a4fa66d54b403b3f4e9', '44');
INSERT INTO `sys_user_role` VALUES ('633', 'd3583f6ce8cf453eacd2b3d3837190b6', '44');
INSERT INTO `sys_user_role` VALUES ('634', '6b7b383236c645888e45490b9577f655', '44');
INSERT INTO `sys_user_role` VALUES ('635', 'd0711c8666f140c8b93607cc7251f8b6', '44');
INSERT INTO `sys_user_role` VALUES ('636', '278856928c554e4a9c282ee5d7cef08c', '44');
INSERT INTO `sys_user_role` VALUES ('637', '517c51b0aac543e59248401ea79a743a', '44');
INSERT INTO `sys_user_role` VALUES ('638', '5d12764a02c342699038539466ac2919', '44');
INSERT INTO `sys_user_role` VALUES ('639', '72184c505dfa494f9baa8e1c04c06997', '44');
INSERT INTO `sys_user_role` VALUES ('640', '3b7fc21f0d554adba680cc301df9e20a', '44');
INSERT INTO `sys_user_role` VALUES ('641', '632e251e134542758b06f7a5969e331d', '44');
INSERT INTO `sys_user_role` VALUES ('642', 'c1d3b5ac5b184761b59c77316860bef5', '44');
INSERT INTO `sys_user_role` VALUES ('643', 'b89adfd0058541278c62ca2d36cc8fd0', '44');
INSERT INTO `sys_user_role` VALUES ('644', 'c356111de6ac4f2a9dc95ce9743786fb', '44');
INSERT INTO `sys_user_role` VALUES ('645', '50894930f2a94c8fb58d61d29f445dd7', '44');
INSERT INTO `sys_user_role` VALUES ('648', '3d97c14dd3494640ab43255e126ede46', '43');
INSERT INTO `sys_user_role` VALUES ('649', 'f404d68753ca4889b9aeb184dded3af3', '43');
INSERT INTO `sys_user_role` VALUES ('651', 'b75d181331c64ad08494f7dfd3454b50', '44');
INSERT INTO `sys_user_role` VALUES ('653', '7df62d783e4a41768db1158883f0557e', '44');
INSERT INTO `sys_user_role` VALUES ('656', 'c92142bbf8d646dd95c7fbafff9944e2', '43');
INSERT INTO `sys_user_role` VALUES ('657', '81e999e6d8d34fcda01302f585fba2ec', '43');
INSERT INTO `sys_user_role` VALUES ('662', '517b8b9cd46d485d9e1ce79e2af74d53', '43');
INSERT INTO `sys_user_role` VALUES ('682', '3448d14dd1244c49b83b98d303228911', '42');
INSERT INTO `sys_user_role` VALUES ('684', 'd62cc21565334a9188b69dd1171243e7', '44');
INSERT INTO `sys_user_role` VALUES ('685', '0a3e4c4e2d1940d6bb7f9bbbac56df0f', '43');
INSERT INTO `sys_user_role` VALUES ('692', '5f9e61e0110d476d8d9423c515e19963', '44');
INSERT INTO `sys_user_role` VALUES ('696', '62dcc6612a0c4482a318f8de5ebc3996', '44');
INSERT INTO `sys_user_role` VALUES ('700', 'e4a7f33f78284683adde565324c5cf38', '44');
INSERT INTO `sys_user_role` VALUES ('701', 'c44bd3c9d9c841a39629decf1a60f6d4', '44');
INSERT INTO `sys_user_role` VALUES ('704', 'ed7dfe0a0ff645198b154358be266ea6', '44');
INSERT INTO `sys_user_role` VALUES ('705', '04c535dd240a454ba3f9ed457499a95a', '44');
INSERT INTO `sys_user_role` VALUES ('709', '3d077079630f4087ba661ad9ec1cef29', '43');
INSERT INTO `sys_user_role` VALUES ('710', '3f537e4314dd47e5af749463e6e97692', '43');
INSERT INTO `sys_user_role` VALUES ('713', 'fa281beffa6044eaba764a2fca9f0e28', '42');
INSERT INTO `sys_user_role` VALUES ('714', 'becf173c37ac48699839170bb5aead8d', '44');
INSERT INTO `sys_user_role` VALUES ('715', 'c71dfb9ab80e4d158e31f28a68bf281f', '44');
INSERT INTO `sys_user_role` VALUES ('716', '53fe1730be4744128070a009b3025f43', '43');

alter table biz_camera add column type int(11) DEFAULT 0;

alter table biz_camera add column has_ptz int(11) DEFAULT 0;

CREATE TABLE `biz_face_alarm` (
  `alarm_id` varchar(32) NOT NULL COMMENT '报警ID主键',
  `alarm_time` datetime NOT NULL COMMENT '报警时间13位时间戳',
  `monitor_id` varchar(32) NOT NULL COMMENT '布控ID',
  `camera_id` varchar(32) NOT NULL COMMENT '像机设备Id',
  `capture_id` varchar(32) NOT NULL COMMENT '抓拍ID',
  `capture_time` datetime NOT NULL COMMENT '抓拍时间13位时间戳',
  `capture_url_full` varchar(128) NOT NULL COMMENT '抓拍照URL全路径',
  `tran_capture_url_full` varchar(255) NOT NULL,
  `panorama_id` varchar(32) NOT NULL COMMENT '全景照ID',
  `panorama_url_full` varchar(128) NOT NULL COMMENT '全景照URL全路径',
  `tran_panorama_url_full` varchar(255) NOT NULL,
  `matcher` longtext NOT NULL COMMENT '匹配人员信息',
  PRIMARY KEY (`alarm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `biz_face_camera` (
  `camera_id` varchar(64) NOT NULL COMMENT '眼镜mac地址，唯一值',
  `camera_name` varchar(64) NOT NULL COMMENT '警员编号+警员名称 （以“-”分隔）',
  `camera_type` varchar(20) NOT NULL COMMENT '设备类型 RTSP',
  `camera_status` int(11) NOT NULL COMMENT '10=未添加，20=未启动，30=已启动',
  `org_id` varchar(32) DEFAULT NULL COMMENT '警务融合指挥平台组织id',
  `address` varchar(128) DEFAULT NULL,
  `para` varchar(64) NOT NULL COMMENT '设备状态为VMS_GB时为国标ID，其他情况为RTSP地址，RTSP地址(rtsp://admin:admin@192.168.40.31:8554/testvideo)',
  `lng` varchar(12)  DEFAULT NULL COMMENT '经度--上线的经度',
  `lat` varchar(12)  DEFAULT NULL COMMENT '维度--上线的纬度',
  `type` int(11) DEFAULT NULL COMMENT '10=眼镜、20=天网',
  PRIMARY KEY (`camera_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `biz_face_monitor` (
  `id` varchar(32) NOT NULL COMMENT '主键编号',
  `monitor_id` varchar(32) DEFAULT NULL COMMENT '布控编号',
  `monitor_name` varchar(100) NOT NULL COMMENT '布控名称',
  `monitor_param_id` varchar(32) NOT NULL COMMENT '布控策略编号',
  `monitor_status` int(11) NOT NULL DEFAULT '0' COMMENT '10 : 已启动  20 ：已停止  ',
  `monitor_time_b` datetime DEFAULT NULL COMMENT '布控开始时间',
  `monitor_time_e` datetime DEFAULT NULL COMMENT '布控结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `biz_face_monitor_camera` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `monitor_ref_id` varchar(32) NOT NULL COMMENT '布控主键编号',
  `camera_id` varchar(32) NOT NULL COMMENT '像机主键编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `biz_face_monitor_param` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `topn` int(6) DEFAULT '1' COMMENT '报警topn',
  `alarm_threshold` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '报警阈值0~1\r\n\r\n默认写0.8 ，即相似度对比，达到80%，传递告警信息给我平台',
  `monitor_time_type` int(1) NOT NULL DEFAULT '0' COMMENT '布控时间类型\r\n0:永久\r\n1:一天\r\n3:三天\r\n7:一周\r\n30:一个月\r\n19:自定义\r\n\r\n默认写0',
  `monitor_type` int(1) NOT NULL DEFAULT '1' COMMENT '布控类型：\r\n1：黑名单报警\r\n2：陌生人报警\r\n3：在册维族报警\r\n4：陌生人维族报警\r\n5：维族人聚集报警\r\n\r\n默认写1',
  `monitor_level_id` int(1) NOT NULL DEFAULT '1' COMMENT '报警等级规则编号\r\n默认写1',
  `monitor_minute` int(11) DEFAULT NULL COMMENT '聚集分钟数(维族聚集布控的时候传该字段)\r\nNull',
  `monitor_num` int(3) DEFAULT '1' COMMENT '聚集数量(维族聚集布控的时候传该字段) 取值范围1~100\r\n默认写1',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

alter table biz_face_monitor_param  modify column alarm_threshold decimal(4,2);
alter table biz_face_monitor_camera ADD UNIQUE ( camera_id );

INSERT INTO `sys_menu` VALUES ('132', '3', '服务器管理', 'base/server/list.html', null, '1', 'fa fa-server', '0', '2018-10-24 23:45:43', null);
INSERT INTO `sys_menu` VALUES ('133', '132', '刷新', '/sys/server/list', 'sys:server:list', '2', null, '0', '2018-10-15 02:09:19', '2018-10-15 02:10:55');
INSERT INTO `sys_menu` VALUES ('134', '132', '删除', '/sys/server/remove', 'sys:server:remove', '2', null, '0', '2018-10-15 02:10:17', null);
INSERT INTO `sys_menu` VALUES ('145', '132', '新增', '/sys/server/save', 'sys:server:save', '2', null, '0', '2018-10-15 02:12:12', null);
INSERT INTO `sys_menu` VALUES ('146', '132', '编辑', '/sys/server/edit', 'sys:server:edit', '2', null, '0', '2018-10-15 02:12:56', '2018-10-15 03:47:35');
INSERT INTO `sys_menu` VALUES ('147', '37', '中心', '/sys/area/center', 'sys:area:center', '2', null, '0', '2018-10-12 08:54:13', null);
INSERT INTO `sys_menu` VALUES ('148', '0', '人脸识别', '/recognition/list.html', 'recognition:list:html', '1', '', '0', '2018-09-21 08:45:03', '2018-10-16 06:43:08');

INSERT INTO `sys_role_menu` VALUES ('2714', '1', '132');
INSERT INTO `sys_role_menu` VALUES ('2715', '1', '133');
INSERT INTO `sys_role_menu` VALUES ('2716', '1', '134');
INSERT INTO `sys_role_menu` VALUES ('2717', '1', '145');
INSERT INTO `sys_role_menu` VALUES ('2718', '1', '146');
INSERT INTO `sys_role_menu` VALUES ('2719', '1', '147');
INSERT INTO `sys_role_menu` VALUES ('2726', '43', '148');

DELETE FROM biz_police_current_coord;

alter  table biz_police_current_coord modify  column create_time  BIGINT(13)  NOT NULL COMMENT '上报时间';

CREATE TABLE `biz_external_device` (
  `id` varchar(32) NOT NULL COMMENT '主键编号ID',
  `device_name` varchar(32) DEFAULT NULL COMMENT '外接设备名称',
  `device_type` varchar(32) NOT NULL COMMENT '外接设备类型\r\n0:平台资源（天网）\r\n1：布控球（枪）资源，\r\n2：车载资源\r\n3:密拍设备\r\n4:无人机',
  `device_icon` longtext COMMENT '外接设备图标',
  `ismove` varchar(100) DEFAULT '0' COMMENT '是否移动设备\r\n0：不移动\r\n1：移动\r\n默认为1',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `biz_external_device` VALUES ('54e550b6ddd04e10a6ad37d5af96af1a', '平台', '0', 'iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAADtElEQVRYhe2YTWhdRRiGn2v9SUlSg9Tf2tqK0lhrQ0tsVURsg2bnxhJ/wJVLwZWIC6GLLgVpqSAIXakR/AOhKIqg4B9WxJqmtRaKUA0alUqMJra1Pi7mHj0595wzc3NvcOMLwz33zDfvvDPfnG++GfgfnaFR9lJNbb8O2A6MAIPASqAHWAbMAF8D7wJvAV8lCWoslLRYgSPAI8BdQB9wHDgKTAGzQD+wCtgIXAfMAweAfcAH7QgshVpVrlZf8V98qq6rsUe9UT2Sa/O8enmVfRIqGt+pfuNCzKn71Bsq2tykjqtnCu2OqdtSBKa6+G7gNYI7y/AH8EmzzABrgE3ALcAFFW1+Ae4F3lsgaBEu3qKecmlwSt1YN4MxgStcuH6WAgfVniqB50W07gI2pA2LM8B3wElgOrENwM3A423Y/zOD69X5hBn4Xt1tcFVfczZWqncYPqC5BI4ZdXXZDNYJ3JtA/I7xMLNNPZzAtbsdgf3qVITwY7U3Ii4rV6kTEb7jak+qwJEI2Yw6WBBxkTqmPq0+ql5WqN+qno7wbi1qqfpIWgwLeAE4Vnj3F2G7GwT2Ah8Bw7n6g8AbEd7h4osqgesjRK/nnnsIwfgsMAk8DMwR9uBxYEXO9qUIb0u/VQIvrSH5jZAcZLinQNwAstV+PbAjV3cU+LOG+4pUgRfWkPxO2NoybAaeAq5pCnoW6M3Vr849zxEymyq09Ht+heHpGpI+YHnu/xfAE8Ahgqt7C/YnatoW0SK+agZ/qCHpZaFLs2R0oETcJPB+7v8Q1ZNS2m+VwMkaEoAHcs+zwBgwUbA5AjxEcGuGsQhvMTKUQ701Eq/mDLlePs71qQ+qTzbjYX+hfod6tobznLo5VeBy9URE5Oe2BuOqssbWZLeICbUld6xy8TzwcmQcW4C3KQmuBdzWtFsbsRsnxNI4mqNeq85GRq3B3c+o29Ur1QH1WnVUfdH49qb6k81zSjsCUXclkOfxo/qt+mub7R7L+mxXYI/h5LaU+NCajDomEEPWMr1E4k4allLHx87bDZlzNzGlDhf7WqxA1A3qZ10S96WtcbRjgagXq3tMO2eUYd6Q0F5S1UenArMypD6n/pwobFrdbzhj13J3S2BWVqn3qwcqhL2q7rTmLmapBWZltEJg6f1LOwLrUp88BoBRQjpVZDlH2M7KcB8hNVtWeN8gZOZvNn/bQ8nI9lfMUKfYE5vB2NVHhk1tjzINQzGDVIFFF3UL0f5T1+AhwtpLvrxOQAM43EW+/wZ/A+/HbVCDBUS0AAAAAElFTkSuQmCC', '0', '这是一个平台资源', '2018-10-26 03:07:53', 'd0f5ebc74439440393baf760907ba358');
INSERT INTO `biz_external_device` VALUES ('cbdfad0b445d438bb7f09f28adf2d2c8', '无人机', '4', 'iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAADBElEQVRYhe3WS6hVVRgH8N+5XeVi0cULRnVDyahEKixvSBFFD3vQwGrSg5RLBBFNegwaNnFYk4gSeoya1KQsgiLNbGCFQYOkVHwU5O2mCFmZpXW/Bus7ejjue9rn3IgG+w+LvdZe3/et/9rfa9OgQYMGDRrMBa32JCJgHM9iMY7heG4vwFnYi6fw/QBnXYDncBF+xdE8/8y0vTttT7VardO1I2JdRMxExEcRcUtE6Bqrcy8iYrJiv9eYTL2PI+LOiv3bI2JryqytvF5uvtKhNBYRC3K+qOP9hpSdqEluIuU3dLxbmLZbXbZfjXTlbASHImI0It7K9aGI2JnzPRFxTUQM5/qJmgSfTPk2sY25PhgRu3O+Ky8y0k2wMwaP4mvchCFcnvGyGJsxhd/xDlZgqXqxOI79+AKrMQ+Xpf4SbErbx/EelrdarZG28lCHoRU4B9vxMA4gMIHDuB6v4w9cUpOctHMxZvJy9+I7DKftn3ArPsQYrupU7s5imEyFYzkfwgfYgUN4G7vwKO7A+UqWj+JsJTuPKJl6GJ/iGazEbcpX+xmPJ8nPsE/x0mvQmcVVBDuxE5fmzffiOsX1k8rXfVBx2Z85TuSh7TGTF/oxn1/hS/yC+7AIa9L+KVI1CN6M5xXXzKsgPo0XlLg5o+pmib8UDzyCC2eROYDHsLGK4PAsSvOxvMfB52J9j/1+MK6ERiV6uXg97k4Do/8SmU5MKQnyuZKUMydJ9RGDlDg5DzfgLqUMDYqtSrxtxh4loU7DbK2u7rg2It6N/rAlIm6se0Yl+iDYHptqktvWr+1ODFXTrYX5Sq3rhRNzsI/BCa7EFVirFO0q7MdDWIYrBzxnYIL34Ful8B7J9UtK8X5TaWfTSoZOKx3kPyV4tVImXlaa/ftO/ZCOKt3iE7yYBCcGJXgSfQbyjkyA7bl+OtcP5PONLrktgyZJnTrYjWX4BgeV9vWb0nXWKG5fgm3KFxxTWtkIFiqF+R8x1zp4f0T8EBFLa8qvivJzumqQL9igQYMGDf7n+BsMdquvWtb+dQAAAABJRU5ErkJggg==', '1', '这是无人机', '2018-10-29 02:21:51', 'd0f5ebc74439440393baf760907ba358');
INSERT INTO `biz_external_device` VALUES ('d341b8dcae8d497d972eab1579ef9457', '布控球', '1', 'iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAFS0lEQVRYhe2YW4hWVRTHf5+OTg02himWml2cCI2K0LCgHiqjUqSyC9RLJFJQVHS/QEJFSuZLRgZlFhERVBTVQ1nZRaSyi6WkpN0tMxmtrCydy6+HtU+z58z3zXxj40v4h8P+vrP3/u//WWuvtdc5sA//c1Sq3VT7mjcYaAJOAs4ATgQmAkMAE28bsB74EHgTeB/YCXT0KqhSVVJPgb1co9Rr1bX2D2vUm9VxvfHXhRqTB6vnqO/VENCpble3pLazxrhP1bMSX58C63VxI3AtMBcYlt3/A/gK+BjYAqwBWoGRwPHAaGAyMKE070/gLmARsKuboD1w8f7q/JIVOtRl6mx1TG8uSy6dncZ3lHjmJ/49tuBgYB5wS9b9A7AQeBzYke6dQATMqIIC2EAExnfpXjNwOXATMC7jWwDcQQqe/liwos4qPfG36vTsiceq96vrquy1dnWlep3anM2ZnnhyzErr9S0uEzhCXZ+RbFKnZQtNUd/I+nen8a+ntgiSDvVp9dBs7rTEV2B9Wq9ugYPUORnB7+r12QIT1OVZ/4vq3eqT6ofqUvUG9dVszBPqARnH9Ym3wBx1UL0CR6gbs8nL1aaMfH5moUfVBUaee0FdrL6rfqbepj6SWXh2xtFUesiN6oiyllqKpwIt6fc2YAlxCkCcGucRAfYssJk4TZ4CdgPLgYuB+4BLifSzkjhlLqQrkHYm3m3pf0taty6Bs7LfXyYhBVqAI4hIfQ+YASwDLiAicV0S9QzwGHAJsCJ7uBMzrmcTf4Hz6xU4MbUSybct6zuaSNxfAIcBPxKJeSdwdRII0Am8QyTuv4HfgAOJdFOgLfEX0XFyvQInpfZPYG2pb3Dp/3DgYeBs4NdS32+ECxsJ91dLcmvTOgCH1iuwqDh2ExbKsY6wzvhEPgwYQxxZ5TwxFTg4CRsF/AL8XhrzY1oHunuqV4EFKkBD6d5G4Gui3DoNeAu4ETgHGJrGNAIXAfcS+6/YMmuI8qu8Rk2UFy8wJPtdrt9WAy8BNxDReg/wCXA7MJOwUDMwhQiev4Bz6dqTW0t8+9FlqCGlvpoWbE1tE3Bsqa8DeBD4KBHeSljsc2AscAzh1lXp/nVp3kpgaZW1JtNV6bRW6e+JdBIUWGH1KmWCUaEU2KC+pr6c2g1Z33NqSw2eFdm4Hg9Qy8XvEpUHwOFEtbI66x8JHJesso2o/SYCR5V41hHu/xzocUok3sNL63ZDrXJrLFGEjgbaidLqitR9CnFKTCL21/YkclNqW4gidixwUHqYkcTWeBu4kwgygEcIQzQAPwOTK5VKOWtUFdigLspM/4N6knpIySUFdqmt6ldp7PdG2b+rythXjLP+5DS2wCK1h0drubgdWExE6Wgiz80lgqOVeFvLS/UKkcArxIlSIZJ2J91zY2Oy5FTgmsQLEdmL07p9w66XpCvtKtM71efV8WqjOiS19V7F+PGJp6iG2tXLjBKvLn15hDWrS9S2zBWr1FPVoVaPylrX0DRvVcbVZpRn/1bc/RWIUWQ+WdpH29V56rF2L0KrXQekcfPSvAK71YfUYfn4Mup97RwPPECUVnm23w68CLxORG478SLVTOzvCcCZRP2Yp5k2Ys/dTmSCLkH/4ctCg7owPXk17FC3qatTu6PGuPbE01htnbrQi7sak6tqfTXoC1uNzx9VxQ2EQNT91KvUn/opbrPxetkr/0AILK4Z6jd1ivtAPb0e3oEUiBGd+ZtZNSxTj6yXc6AFYhx/z1UR1mF8dTikP3x7QyDqcHWuEaGFuDuN/dovrr0lEOMou8z4sjAz/e83zz4MNP4BK2L3l/MGp04AAAAASUVORK5CYII=', '1', '这是布控球', '2018-10-31 05:18:45', 'd0f5ebc74439440393baf760907ba358');
INSERT INTO `biz_external_device` VALUES ('d363e17bea5f44f29dbda30cc2208daf', '车载资源', '2', 'iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAC2klEQVRYhe3Yz4scRRQH8M+om6wGxE0IhBCFLCsh+GPJIXiK4kEP4kJEELxoRE/6DwTRS8zBWw4BD0LIKV4MiRcRPKkXY/xxUIJiIIImKmo0C+qqu8nzUN1JT6V7Z2d6WjzMF4qpetVV79tv3ntVr5lggglWRa/sRMQ49nsKd+LlTMfQm/d6vX5BRIzano2I+4r+hoiYK/rzEXEoIqZH2bfETSPZqR9/YSs24zBm8Dp+wvfFfHu0sGDZ3ol+7GyzX4kbWr7Xw9iPGzGbze3GAp5uo6DtX3waS7iMf7K5afyIi20UrDWKN0mROS+91OVC/jsuYQv2YF1lzUV8WRDdVNEX+AGv4VgjsSGieGNEXIhu8Ng4fPAZKUq7wPODHlgLwbvHQKQJ2wY9sJYg2ZGNT+NtTA1JZhmP496KbE7yz8GB1OAL6yJiMfObvYNy2CptX40f3t/GB3fg1kx2Zi3masAXNbK7VlswiOA92fgCzg7DKMPnWBygow/DEvxoWEYZlvFJJls1CAcRzBefGpZRDT6s0TE44Bqc+lzm0JtbBEjZ5moCZaYpSOrSzF7pyjSD7RX5FelisGT0S8YV3FYjPyL59lc4WrsyIqYi4r2at/uv8W40pJn9eGBEy4wTD+GFclAl+Gil/wtexKsdk/kbB/AS/qjIF8pOnQ8uYhfOF+NP8WYH5FbwoGtR/RY+xs0q18CqBZeL388q5OA4fuuA4Hn9KecMvs641EbjTv2WncUt42YnXXKrZcJW/VkD9QS3SNn+STyHD7C+A4LTeB/7pLrllOvP/cbr1jze6IBUjm2a8l6BqgU3dstlKFxN5lULni0mpqVTpERIRfiK9mVqiRVscL1RfpZOm3OloFrVTRUEHsGJbOEdUgk5ToILOJnJZws9K71ebzknWHZvx7eVRUu6ieLtKpbCn5JVca3srLPId3ilIPYrnuiAHHyDg9K3m0vSl7EJJvjf4V98KUZxVT6X3gAAAABJRU5ErkJggg==', '1', '这是车载资源', '2018-11-06 02:01:40', 'd0f5ebc74439440393baf760907ba358');
INSERT INTO `biz_external_device` VALUES ('e03e9c28e15b4017ae7a9b3ce32f4647', '密拍', '3', 'iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAACFElEQVRYhe2XsWsUQRTGf5tLLEQiqDEJYiWiVv4Jip1CKjsJiME+jaaz0Vok2qQRbdRORBBiEQjapD8QoiQa5CxEEgM2KvhZzO75bt3NzLhhF2Q/GHh3M9+8Hzv75rHQqlWr/0SS7Lgo6ZUG9UbSXG5d0ZiWtJLzdiXNBnj7YyfAe9pZryUNl2z8wONdkjRUBXDOkyDTy4JNbwZ6n/4r4FhggkxTZsOjkd6zoYBDhvFS5Gs7Y+LpSO/V0IUW8FRkkuMmPh3pPRm60AJ2IpN0SuLYvMEL1yOTbJh4NdIbnMsCPolM8sjEjyt4w5RWz3xgFXYLKu9+oHfFV8EquWay8dyT4IOk8ZKNlzzet5IOVgVE0nVJH3Obb0takLTPs/kNSb2cd1PSHUkjIXAWMLGABToAHAE2gV7kWzMGTAJfgE+RXpLEoQ2b/y4DZ9JYwDawBXwHRoDRFNh3pfwy3h+pd3/qzYryPXArCDQLJL0ALoSYdkFbOOC8RnFdZj1JkmcweM3EHmEVbeR+nwMWgDXgNn9OcuCI69RXYC/uac3wd6vsP6ymAHvACWC+ZL7/ngf3xF1WB1dMXjUFmOBuCq+aAgxWC1hVTQH+BPaELGwKcAJ4h7uUPxfM9yu8KcBDuH59DTgGXAEWzfzhLLCA47WgOU2a+BvwEDiP+5i6C3SzSdtJlnHtpw6VfcOsArM1MbRq1aoW/QY+z6JC1BcXawAAAABJRU5ErkJggg==', '1', '这是密拍设备', '2018-10-26 05:32:47', 'd0f5ebc74439440393baf760907ba358');


INSERT INTO `wt-sso`.`sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES (149, 3, '外接设备管理', 'base/deivce/list.html', 'deivce:list:html', 1, 'fa fa-sign-language', 0, '2018-10-25 08:00:12', '2018-10-25 09:07:33');
INSERT INTO `wt-sso`.`sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES (150, 149, '新增', '/sys/externalDevice/save', 'sys:externalDevice:save', 2, NULL, 0, '2018-10-29 01:29:43', '2018-10-29 01:35:10');
INSERT INTO `wt-sso`.`sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES (151, 149, '删除', '/sys/externalDevice/remove', 'sys:externalDevice:remove', 2, NULL, 0, '2018-10-29 01:31:04', '2018-10-29 01:35:31');
INSERT INTO `wt-sso`.`sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES (152, 149, '编辑', '/sys/externalDevice/edit', 'sys:externalDevice:edit', 2, NULL, 0, '2018-10-29 01:31:48', '2018-10-29 01:35:48');
INSERT INTO `wt-sso`.`sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES (153, 149, '刷新', '/sys/externalDevice/list', 'sys:externalDevice:list', 2, NULL, 0, '2018-10-29 01:32:59', '2018-10-29 01:36:07');

INSERT sys_role_menu (role_id, menu_id) VALUES (1,149);
INSERT sys_role_menu (role_id, menu_id) VALUES (1,150);
INSERT sys_role_menu (role_id, menu_id) VALUES (1,151);
INSERT sys_role_menu (role_id, menu_id) VALUES (1,152);
INSERT sys_role_menu (role_id, menu_id) VALUES (1,153);

ALTER TABLE biz_face_camera ADD   `create_time` datetime NOT NULL COMMENT '像机添加时间' DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE biz_face_camera ADD   `modified_time` datetime NULL COMMENT '像机修改时间';
ALTER TABLE biz_face_camera DROP COLUMN `org_id`;

CREATE TABLE `biz_external_device_track` (
  `id` varchar(32) NOT NULL,
  `device_id` varchar(32) NOT NULL,
  `track_date` date NOT NULL,
  `coord` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table biz_camera alter column status set default 10;

ALTER TABLE biz_face_monitor_param ADD  column `monitor_param_name` VARCHAR(200) NULL COMMENT '布控策略名称';

ALTER TABLE biz_face_monitor_param ADD  column `face_group_id` VARCHAR(200) NULL COMMENT '识别库 存储id以逗号分割，从config配置文件中获取';

ALTER TABLE biz_face_monitor_param ADD  column `face_group_name` VARCHAR(200) NULL COMMENT '识别库 存储name以逗号分割，从config配置文件中获取';

ALTER TABLE biz_face_monitor_param ADD   `create_time` datetime NOT NULL COMMENT '添加时间' DEFAULT CURRENT_TIMESTAMP;

alter table biz_face_monitor_param modify column id varchar(32);

CREATE TABLE `biz_monitorparam_device` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `device_id` varchar(32) NOT NULL COMMENT '设备编号',
  `monitor_param_id` varchar(32) NOT NULL COMMENT '布控策略编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE biz_alarm ADD  column `existence_read` int(11) DEFAULT 0 COMMENT '是否已读 0未读 1已读';

update biz_alarm ba set ba.existence_read = 1 where 1=1;

ALTER TABLE biz_alarm ADD  column `face_alarm_id` varchar(64) DEFAULT null COMMENT '人脸识别告警ID';

ALTER TABLE `sys_user` ADD COLUMN `device_status` int(11) NULL DEFAULT 20 COMMENT  '警员有设备时 10表示在线，20表示离线';

INSERT INTO `wt-sso`.`sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('154', '0', '人脸配置', NULL, NULL, '0', 'fa fa-user-o', '0', '2018-11-09 13:38:45', '2018-11-09 13:56:11');
INSERT INTO `wt-sso`.`sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('155', '154', '像机管理', 'base/faceCamera/list.html', NULL, '1', 'fa fa-camera', '0', '2018-11-09 13:43:51', '2018-11-12 09:12:32');
INSERT INTO `wt-sso`.`sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('156', '154', '布控策略管理', 'base/monitorParam/list.html', 'monitorParam:list.html', '1', 'fa fa-file-text', '0', '2018-11-09 13:46:17', '2018-11-12 06:42:27');
INSERT INTO `wt-sso`.`sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('157', '156', '刷新', '/sys/monitorParam/list', 'sys:monitorParam:list', '2', '', '0', '2018-11-12 06:44:11', '2018-11-12 06:47:18');
INSERT INTO `wt-sso`.`sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('158', '156', '新增', '/sys/monitorParam/save', 'sys:monitorParam:save', '2', '', '0', '2018-11-12 06:46:29', '2018-11-12 06:47:29');

INSERT INTO `wt-sso`.`sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES ('2962', '1', '154');
INSERT INTO `wt-sso`.`sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES ('2963', '1', '155');
INSERT INTO `wt-sso`.`sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES ('2964', '1', '156');
INSERT INTO `wt-sso`.`sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES ('2965', '1', '157');
INSERT INTO `wt-sso`.`sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES ('2966', '1', '158');

ALTER TABLE `wt-sso`.`biz_face_camera` ADD COLUMN `org_id` varchar(11) NULL COMMENT '组织id' AFTER `modified_time`,
ADD COLUMN `org_name` varchar(128) NULL COMMENT '组织名字' AFTER `org_id`;

alter table biz_face_monitor_param alter column monitor_num set default null; 

alter table biz_police_current_coord modify column longitude double(10,6) NOT NULL COMMENT 'pda经度';
alter table biz_police_current_coord modify column latitude double(10,6) NOT NULL COMMENT '纬度';
INSERT INTO `sys_menu` VALUES (160, 86, '110警情消息', '/police/policeCase', 'police:policeCase', 2, '', 0, '2018-12-11 14:43:26', NULL);
INSERT INTO `sys_role_menu` VALUES (3293, 43, 159);

INSERT  INTO  `sys_menu`  VALUES  ('161',  '0',  '通话',  '/home/call',  'home:call',  '2',  null,  '0',  '2018-12-12  14:11:31',  null);
INSERT  INTO  `sys_role_menu`  VALUES  ('3300',  '43',  '161');

CREATE TABLE `biz_police_case` (
  `case_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '案件信息ID',
  `case_brief` varchar(1000) DEFAULT NULL COMMENT '简要案情 ',
  `case_status` int(11) DEFAULT NULL COMMENT '',
  `case_name` varchar(100) DEFAULT NULL COMMENT '案件名称',
  `case_accpet_org` varchar(100) DEFAULT NULL COMMENT '接警单位',
  `case_accept_time` datetime DEFAULT NULL COMMENT '案件受理时间(投诉受理时间)',
  `case_occur_addr` varchar(200) DEFAULT NULL COMMENT '案情发生地(案发地址 )',
  `case_occur_lng` double(10,6) DEFAULT NULL COMMENT '经度',
  `case_occur_lat` double(10,6) DEFAULT NULL COMMENT '纬度',
  `case_occur_time` datetime DEFAULT NULL COMMENT '案发时间',
  `case_report_type` varchar(100) DEFAULT NULL COMMENT '报警类别',
  `case_report_method` varchar(100) DEFAULT NULL COMMENT '报警方式',
  `case_reporter_name` varchar(20) DEFAULT NULL COMMENT '报案人姓名',
  `case_reporter_phone` varchar(50) DEFAULT NULL COMMENT '报案人联系方式',
  `case_reporter_sex` varchar(10) DEFAULT NULL COMMENT '报案人性别',
  `case_reporter_age` varchar(10) DEFAULT NULL COMMENT '报案人年龄',
  `case_reporter_idNumber` varchar(100) DEFAULT NULL COMMENT '报警人身份证号',
  `case_reporter_currentAddress` varchar(200) DEFAULT NULL COMMENT '报警人现住址',
  `case_reporter_idAddress` varchar(200) DEFAULT NULL COMMENT '报警人户籍所在地',
  `case_reporter_workAddress` varchar(200) DEFAULT NULL COMMENT '工作单位',
  `case_end_time` datetime DEFAULT NULL COMMENT '案件结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modified_by` varchar(32) DEFAULT NULL COMMENT '修改人ID',
  `handle_status` varchar(32) DEFAULT NULL COMMENT '处理状态：0未处理,1已处理 默认为0',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `handle_by` varchar(32) DEFAULT NULL COMMENT '处理人ID',
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table biz_police_case_param(
  `id` varchar(32) NOT NULL DEFAULT '0' COMMENT '主键ID',
  `policecase_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '110接警ID',
  `case_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'caseID',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table biz_face_camera MODIFY COLUMN org_id varchar(32);

CREATE TABLE `biz_facecamera_server_param` (
  `id` varchar(32) NOT NULL DEFAULT '0' COMMENT '主键ID',
  `camera_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '相机ID',
  `faceserver_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '人脸服务ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `wt-sso`.`sys_user` (`user_id`, `org_id`, `policename`, `username`, `password`, `email`, `mobile`, `call_number`, `open`, `status`, `remark`, `image`, `user_id_create`, `gmt_create`, `gmt_modified`, `login_status`, `pinyin_name`, `salt`, `device_status`) VALUES ('00237ac4304b451da4334a67afe9c53f', '27', 'keshihua', 'keshihua', '8a4b25d863a7700b0c3aa8e26857cba9', '328897842@qq.com', '15527082449', '15575258456', '0', '1', '11', '', 'd0f5ebc74439440393baf760907ba358', '2018-12-27 13:47:43', NULL, '10', '-k-e-s-h-i-h-u-a', 'a5ef1014da0968649e3080785ba93e8f', '20');

