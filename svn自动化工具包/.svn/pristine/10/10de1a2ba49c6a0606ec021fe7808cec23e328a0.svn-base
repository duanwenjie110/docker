alter table biz_face_camera MODIFY COLUMN org_id varchar(32);

CREATE TABLE `biz_facecamera_server_param` (
  `id` varchar(32) NOT NULL DEFAULT '0' COMMENT '主键ID',
  `camera_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '相机ID',
  `faceserver_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '人脸服务ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `wt-sso`.`sys_user` (`user_id`, `org_id`, `policename`, `username`, `password`, `email`, `mobile`, `call_number`, `open`, `status`, `remark`, `image`, `user_id_create`, `gmt_create`, `gmt_modified`, `login_status`, `pinyin_name`, `salt`, `device_status`) VALUES ('00237ac4304b451da4334a67afe9c53f', '27', 'keshihua', 'keshihua', '8a4b25d863a7700b0c3aa8e26857cba9', '328897842@qq.com', '15527082449', '15575258456', '0', '1', '11', '', 'd0f5ebc74439440393baf760907ba358', '2018-12-27 13:47:43', NULL, '10', '-k-e-s-h-i-h-u-a', 'a5ef1014da0968649e3080785ba93e8f', '20');

INSERT INTO `wt-sso`.`sys_user_role` (`user_id`, `role_id`) VALUES ('00237ac4304b451da4334a67afe9c53f', '43');
