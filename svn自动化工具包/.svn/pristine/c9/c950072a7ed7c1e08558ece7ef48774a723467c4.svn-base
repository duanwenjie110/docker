INSERT INTO `sys_menu` VALUES (160, 86, '110警情消息', '/police/policeCase', 'police:policeCase', 2, '', 0, '2018-12-11 14:43:26', NULL);
INSERT INTO `wt-sso`.`sys_role_menu` (`role_id`, `menu_id`) VALUES ('43', '160');

INSERT  INTO  `sys_menu`  VALUES  ('161',  '0',  '通话',  '/home/call',  'home:call',  '2',  null,  '0',  '2018-12-12  14:11:31',  null);
INSERT INTO `wt-sso`.`sys_role_menu` (`role_id`, `menu_id`) VALUES ('43', '161');

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


