<%@ Page Title="About" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PE.About" Theme="About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="about-main-all">
        <div class="about-main">
            <div class="tabs">
                <ul>
                    <li class="active">网站主题</li>
                    <li>设计思路与使用技术</li>
                </ul>
            </div>
            <div class="container">
                <div id="tabCon_0">
                    <div class="tab-main">
                        这个网站是一个关于体育的网站。主要包含了当前的体育新闻和体育赛事。
                    </div>
                </div>
                <div id="tabCon_1">
                    <div class="tab-main">
                        <h3>设计思路</h3>
                        <p>
                            主要包含7个页面，整体采用Flex布局。<br>
                            Index页面为首页，上半部分主要为赛事的新闻的轮播图，下半部分为热门的和各分类的体育新闻<br>
                            Deatil页面为新闻详情页，就是在Index展示的新闻的详细内容。里面包含新闻和对新闻的评论，用户可以在此发表评论<br>
                            Game页面为赛事页面，主要展示当前的各种赛事。左半部分为赛事的分类导航，右半部分显示内容<br />
                            Home页面为用户信息页面。左半部分为导航，有我的信息和我的评论两部分。<br />
                            Login页面采用Flex的居中布局，用户输入用户名和密码然后进行登录，没有账号可以跳转到Register页面<br />
                            Register页面采用Flex居中布局，用户输入信息后进行注册，注册成功后跳转Login页面<br />
                            About页面为该网站的介绍页面。左半部分是导航，右半部分是介绍本网站的主题和设计思路集使用的技术
                        </p>
                        <h3>使用技术</h3>
                        <p>
                            <b>数据库：</b>使用了Mysql数据库，主要有三张表。分别是user表，article表和comment表。在登录注册中点击登录
                            注册按钮时，连接数据库，并将数据发送到数据库中。其中登录要将数据库中用户的信息取出来再和用户输入的作比较。主要是用
                            ODBC连接数据库然后写Sql语句写入数据库中

                        </p>
                        <p>
                            <b>模板：</b>创建了一个Frame.Master的母版页。这个母版页只要是有一个顶端的导航栏。可以去到网站的其它页面。
                            Index，Game，Home，About和Deatil页面都是用Frame母版页创建的子页
                        </p>
                        <p>
                            <b>验证控件：</b>在Register页面使用了RequiredFieldValidator在用户名和密码，使输入不能为空。使用了CustomValidator
                            控件使用户必须选择性别。在Login页面也使用了RequiredFieldValidator在用户名和密码，使输入不能为空

                        </p>
                        <p>
                            <b>留言功能：</b>在Index页面可以在下方看到各类的信息，点击查看详情，可以进入到新闻的详情页。详情页就是Detail页面，
                            先根据跳转路由传过来的article_id去数据库中查到该文章的详细内容。然后同时也根据article_id去联合user表和comment表
                            查询关于这篇文章的评论。详情页中间有一个评论框，当点击发送时会连接数据库，将评论框中的内容写入数据库的comment表中。然后
                            可以在下方的评论列表中看到
                        </p>
                        <p>
                            <b>广告控件：</b>在Index页面的导航栏下方放置了一排5个广告控件，放置了两个相关的广告，内容放在了AdRotator.xml中，
                            一个比重是20，另一个是30
                        </p>
                        <p>
                            <b>轮播图：</b>Index页面上方设置了一个图片和文字的轮播图。在页面中写一个函数，设置一个变量去控制元素的显示。利用
                            setInterval每三秒调用写的那个函数。在文字列表里写一个鼠标悬停就调用一个函数去显示该文字对应的图片，并改变文字的
                            背景色
                        </p>
                    </div>
                </div>
            </div>
            
        </div>
            <div class="myright">Lucelia</div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script>
        $(".active").addClass("bg");
        document.getElementById("tabCon_0").style.display = "block";//显示第一个
        $(".tabs ul li").click(function () {
            var j = $(this).index();
            $(this).addClass("bg").siblings().removeClass("bg");
            for (i = 0; i <= 1; i++) {
                document.getElementById("tabCon_" + i).style.display = "none"; //将所有的层都隐藏 
            }
            document.getElementById("tabCon_" + j).style.display = "block";//显示当前层    
        });
    </script>
</asp:Content>
