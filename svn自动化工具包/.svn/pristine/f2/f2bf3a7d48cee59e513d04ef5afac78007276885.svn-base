INSERT INTO `wt-sso`.`sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('154', '0', '人脸配置', NULL, NULL, '0', 'fa fa-user-o', '0', '2018-11-09 13:38:45', '2018-11-09 13:56:11');
INSERT INTO `wt-sso`.`sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('155', '154', '像机管理', 'base/faceCamera/list.html', NULL, '1', 'fa fa-camera', '0', '2018-11-09 13:43:51', '2018-11-12 09:12:32');
INSERT INTO `wt-sso`.`sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('156', '154', '布控策略管理', 'base/monitorParam/list.html', 'monitorParam:list.html', '1', 'fa fa-file-text', '0', '2018-11-09 13:46:17', '2018-11-12 06:42:27');
INSERT INTO `wt-sso`.`sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('157', '156', '刷新', '/sys/monitorParam/list', 'sys:monitorParam:list', '2', '', '0', '2018-11-12 06:44:11', '2018-11-12 06:47:18');
INSERT INTO `wt-sso`.`sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('158', '156', '新增', '/sys/monitorParam/save', 'sys:monitorParam:save', '2', '', '0', '2018-11-12 06:46:29', '2018-11-12 06:47:29');

INSERT INTO `wt-sso`.`sys_role_menu` (`role_id`, `menu_id`) VALUES ('1', '154');
INSERT INTO `wt-sso`.`sys_role_menu` (`role_id`, `menu_id`) VALUES ('1', '155');
INSERT INTO `wt-sso`.`sys_role_menu` (`role_id`, `menu_id`) VALUES ('1', '156');
INSERT INTO `wt-sso`.`sys_role_menu` (`role_id`, `menu_id`) VALUES ('1', '157');
INSERT INTO `wt-sso`.`sys_role_menu` (`role_id`, `menu_id`) VALUES ('1', '158');

ALTER TABLE `wt-sso`.`biz_face_camera` ADD COLUMN `org_id` varchar(11) NULL COMMENT '组织id' AFTER `modified_time`,
ADD COLUMN `org_name` varchar(128) NULL COMMENT '组织名字' AFTER `org_id`;

alter table biz_face_monitor_param alter column monitor_num set default null; 