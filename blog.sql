# 定义博客数据库
create database blog;
use blog;
show tables;
# 创建文章表
create table bl_article
(
  article_id          int unsigned auto_increment comment '文章id',
  article_title       varchar(255) not null default '' comment '  文章标题',
  article_into        varchar(255) not null default '' comment '  文章简介',
  article_content     text comment ' 文章内容',
  article_addtime     datetime              default CURRENT_TIMESTAMP comment '  发表时间',
  article_modify      datetime              default CURRENT_TIMESTAMP comment '  发布人i',
  article_publisher   varchar(30)  not null default '' comment '  发布人昵',
  article_like        smallint     not null default 0 comment '  点赞数',
  article_comment_num smallint     not null default 0 comment '  评论数',
  article_cart        smallint     not null default 0 comment '  所属分类',
  article_cart_name   varchar(50)  not null default '' comment '所属分类名称',
  primary key (article_id)

) engine = Myisam
  default charset = utf8 comment '文章表';

alter table  bl_article  add  keyword varchar(30) not null default '' comment  '文章关键字';
alter table bl_article add description varchar(255) not null default '' comment '文章描述';
alter table bl_article add title  varchar(100) not null default '' comment '文章标题';

# 创建 评论表
create table bl_comment
(
  comment_id            int unsigned auto_increment comment '评论id',
  comment_content       varchar(255) not null default '' comment '评论内容',
  comment_addtime       datetime              default CURRENT_TIMESTAMP comment '评论时间',
  comment_user_id       smallint     not null default 0 comment '评论用户id',
  comment_user_nickname varchar(50)  not null comment '评论用户昵称',
  comment_article_id    int unsigned not null default 0 comment '评论文章id',
  comment_article_title varchar(50)  not null default '' comment '评论文章标题',
  primary key (comment_id)
) engine = MyIsam
  default charset = utf8 comment = 'utf8';

# 创建 用户表
create table bl_user
(
  user_id       smallint unsigned auto_increment comment '用户id',
  user_account  varchar(30) not null default '' comment '账号',
  user_password char(32)    not null default '' comment '密码',
  user_type     smallint(5) not null default 0 comment '用户类型',
  user_nickname varchar(30) not null default '' comment '昵称',
  user_addtime  datetime    not null default CURRENT_TIMESTAMP comment '用户添加时间',
  primary key (user_id)
) engine = Myisam
  default charset = utf8 comment '用户表';


# 创建 分类表

create table bl_category
(
  category_id     int unsigned auto_increment comment '分类id',
  category_name   varchar(30)  not null default '' comment '分类名称',
  category_parent int unsigned not null default 0 comment '父级分类',
  category_status smallint(5)  not null default 0 comment '分类状态',
  primary key (category_id)
) engine = MyIsam
  default charset = utf8 comment '文章分类表';


create table bl_authority(
authority_id  smallint unsigned primary key auto_increment  comment '权限id',
authority_name varchar(30) not null default '' comment '权限名称',
authority_parent smallint unsigned  not null default  0  comment '父及权限',
authority_description  varchar(255) not null default  '' comment '权限名称',
authority_add_user_id   int  unsigned not null default 0  comment '添加权限用户',
authority_modify_user_id int  unsigned not null default 0 comment  '记录最后修改用户',
authority_addtime  datetime  not null default CURRENT_TIMESTAMP  comment  '添加时间',
authority_modify  DATETIME  not null  default CURRENT_TIMESTAMP  comment  '最后修改权限时间'
)engine = Myisam default charset ='utf8' comment '权限表';

create  table bl_role(
  role_id   smallint unsigned primary key  auto_increment  comment '角色id',
  role_name  varchar(30) not null default '' comment '角色名称',
  role_authority_id_list  varchar(100) not null default 1  comment '当前角色所拥有的权限',
  role_description  varchar(100) not null default '' comment  '角色描述',
  role_add_user_id  smallint  not null  comment '添加当前角色的用户',
  role_addtime   datetime  not null  default  current_timestamp  comment '添加角色时间',
  role_modify_user_id  smallint  unsigned  not null default 0 comment  '最后修改角色用户',
  role_modify_time   datetime  not null default  current_timestamp  comment  '当前校色最后修改时间'
)engine = Myisam  default charset ='utf8';


alter table  bl_user  add  role_id  smallint not null  default 0 comment '所属角色id';


