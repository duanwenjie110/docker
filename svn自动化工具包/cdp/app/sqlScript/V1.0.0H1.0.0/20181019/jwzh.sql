ALTER TABLE biz_face_camera ADD   `create_time` datetime NOT NULL COMMENT '像机添加时间' DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE biz_face_camera ADD   `modified_time` datetime NULL COMMENT '像机修改时间';
ALTER TABLE biz_face_camera DROP COLUMN `org_id`;

alter table biz_camera add column status int(11) DEFAULT '10' COMMENT '10表示在线，20表示离线';

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
