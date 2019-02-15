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
