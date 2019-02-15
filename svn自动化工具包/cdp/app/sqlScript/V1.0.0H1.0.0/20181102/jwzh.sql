CREATE TABLE `biz_external_device_track` (
  `id` varchar(32) NOT NULL,
  `device_id` varchar(32) NOT NULL,
  `track_date` date NOT NULL,
  `coord` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table biz_camera alter column status set default 10;