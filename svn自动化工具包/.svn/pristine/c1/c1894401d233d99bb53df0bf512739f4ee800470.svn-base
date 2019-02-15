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

INSERT INTO `sys_menu` VALUES ('131', '3', '服务器管理', 'base/server/list.html', '', '1', '', '0', '2018-09-26 06:29:07', '2018-09-26 06:29:22');
INSERT INTO `sys_menu` VALUES ('137', '37', '中心', '/sys/area/center', 'sys:area:center', '2', null, '0', '2018-10-12 08:54:13', null);
INSERT INTO `sys_menu` VALUES ('138', '131', '刷新', '/sys/server/list', 'sys:server:list', '2', null, '0', '2018-10-15 02:09:19', '2018-10-15 02:10:55');
INSERT INTO `sys_menu` VALUES ('139', '131', '删除', '/sys/server/remove', 'sys:server:remove', '2', null, '0', '2018-10-15 02:10:17', null);
INSERT INTO `sys_menu` VALUES ('140', '131', '新增', '/sys/server/save', 'sys:server:save', '2', null, '0', '2018-10-15 02:12:12', null);
INSERT INTO `sys_menu` VALUES ('141', '131', '编辑', '/sys/server/edit', 'sys:server:edit', '2', null, '0', '2018-10-15 02:12:56', '2018-10-15 03:47:35');

INSERT INTO `sys_role_menu` VALUES ('2945', '1', '131');
INSERT INTO `sys_role_menu` VALUES ('2946', '1', '137');
INSERT INTO `sys_role_menu` VALUES ('2947', '1', '138');
INSERT INTO `sys_role_menu` VALUES ('2948', '1', '139');
INSERT INTO `sys_role_menu` VALUES ('2949', '1', '140');
INSERT INTO `sys_role_menu` VALUES ('2950', '1', '141');

DELETE FROM biz_police_current_coord;

alter  table biz_police_current_coord modify  column create_time  BIGINT(13)  NOT NULL COMMENT '上报时间';




