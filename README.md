# PE

Asp.net 小 Demo

使用的相关技术可在 About.aspx 中看到

## Database Design

```mysql
create table user
(
    user_id int auto_increment primary key,
    name    varchar(20) null,
    passwd  varchar(30) not null,
    age     int         null,
    sex     varchar(10) null
);
```

```mysql
create table article
(
    article_id int auto_increment primary key,
    title      varchar(255) not null,
    content    text         not null,
    type       int          null
);
```

```mysql
create table comment
(
    comment_id int auto_increment primary key,
    user_id    int                                 not null,
    article_id int                                 not null,
    content    varchar(255)                        not null,
    time       timestamp default CURRENT_TIMESTAMP not null,
    constraint comment_article_article_id_fk
        foreign key (article_id) references article (article_id),
    constraint comment_user_user_id_fk
        foreign key (user_id) references user (user_id)
);
```

## 页面效果

![](https://github.com/Lucelia-L/PE/blob/main/ScreenShots/1.png)
![](https://github.com/Lucelia-L/PE/blob/main/ScreenShots/2.png)
![](https://github.com/Lucelia-L/PE/blob/main/ScreenShots/3.png)
![](https://github.com/Lucelia-L/PE/blob/main/ScreenShots/4.png)
![](https://github.com/Lucelia-L/PE/blob/main/ScreenShots/5.png)
![](https://github.com/Lucelia-L/PE/blob/main/ScreenShots/6.png)
