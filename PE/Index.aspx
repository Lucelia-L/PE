<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PE.Index" Theme="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="main">

        <div class="main-top">
            <div class="ad">
                <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="AdRotator.xml" Height="120px" Width="240px" />
                <asp:AdRotator ID="AdRotator2" runat="server" AdvertisementFile="AdRotator.xml" Height="120px" Width="240px" />
                <asp:AdRotator ID="AdRotator3" runat="server" AdvertisementFile="AdRotator.xml" Height="120px" Width="240px" />
                <asp:AdRotator ID="AdRotator4" runat="server" AdvertisementFile="AdRotator.xml" Height="120px" Width="240px" />
                <asp:AdRotator ID="AdRotator5" runat="server" AdvertisementFile="AdRotator.xml" Height="120px" Width="240px" />
            </div>

            <div class="carousel-main">
                <div class="carousel">
                    <ul>
                        <li>
                            <img src="img/1.jpg" alt="img">
                        </li>
                        <li>
                            <img src="img/2.jpg" alt="img">
                        </li>
                        <li>
                            <img src="img/3.jpg" alt="img">
                        </li>
                        <li>
                            <img src="img/4.jpg" alt="img">
                        </li>
                        <li>
                            <img src="img/5.jpg" alt="img">
                        </li>
                    </ul>
                </div>


                <div class="textList">
                    <ul>
                        <li>22:00视频直播：中国女排VS意大利</li>
                        <li>美洲杯-内尔马独造3球 巴西开门红</li>
                        <li>阿杜28分欧文伤退 雄鹿胜篮网2-2</li>
                        <li>正视频直播校园足球联赛大学组比赛</li>
                        <li>[我鲜说]巴西开门红 克赖奇科娃双冠</li>
                    </ul>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select * from article where type = 0"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Dsn=pe" ProviderName="System.Data.Odbc" SelectCommand="select * from article where type =1"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Dsn=pe" ProviderName="System.Data.Odbc" SelectCommand="select * from article where type=2"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Dsn=pe" ProviderName="System.Data.Odbc" SelectCommand="select * from article where type=3"></asp:SqlDataSource>
        <div class="tabs">
            <div class="tabContainer">
                <ul class="tab">
                    <li class="tab-item" >热门</li>
                    <li class="tab-item" >篮球</li>
                    <li class="tab-item" >足球</li>
                    <li class="tab-item" >田径</li>
                </ul>
                <div class="tabCon">
                    <div id="tabCon_0">
                        <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="article_id" DataSourceID="SqlDataSource1" ForeColor="#333333" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                            <AlternatingItemStyle BackColor="White" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="#EFF3FB" />
                            <ItemTemplate>
                                article_id:
                                <asp:Label ID="article_idLabel" runat="server" Text='<%# Eval("article_id") %>' />
                                <br />
                                title:
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                                <br />
                                content:
                                <asp:Label ID="contentLabel" runat="server" Text='<%# Eval("content") %>' />
                                <asp:Button ID="Button1" runat="server" Text="查看详情" CommandArgument='<%#Eval("article_id")%>' OnClick="Button1_Click" />
                                <br />
                                <br />
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>

                    </div>
                    <div id="tabCon_1">

                        <asp:DataList ID="DataList2" runat="server" DataKeyField="article_id" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                article_id:
                                <asp:Label ID="article_idLabel" runat="server" Text='<%# Eval("article_id") %>' />
                                <br />
                                title:
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                                <br />
                                content:
                                <asp:Label ID="contentLabel" runat="server" Text='<%# Eval("content") %>' />
                                <br />
                                type:
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>

                    </div>
                    <div id="tabCon_2">
                        <asp:DataList ID="DataList3" runat="server" DataKeyField="article_id" DataSourceID="SqlDataSource3">
                            <ItemTemplate>
                                article_id:
                                <asp:Label ID="article_idLabel" runat="server" Text='<%# Eval("article_id") %>' />
                                <br />
                                title:
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                                <br />
                                content:
                                <asp:Label ID="contentLabel" runat="server" Text='<%# Eval("content") %>' />
                                <br />
                                type:
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>

                    </div>
                    <div id="tabCon_3">
                        <asp:DataList ID="DataList4" runat="server" DataKeyField="article_id" DataSourceID="SqlDataSource4">
                            <ItemTemplate>
                                article_id:
                                <asp:Label ID="article_idLabel" runat="server" Text='<%# Eval("article_id") %>' />
                                <br />
                                title:
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                                <br />
                                content:
                                <asp:Label ID="contentLabel" runat="server" Text='<%# Eval("content") %>' />
                                <br />
                                type:
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>

                    </div>
                </div>
            </div>

        </div>

    </div>
    <script src="js/jquery.min.js"></script>
    <script>
        //tab背景与切换
        $(".tabContainer ul li").hover(function () {
            var j = $(this).index();
            console.log(j);
            $(this).addClass("bg").siblings().removeClass("bg");
            for (i = 0; i <= 3; i++) {
                document.getElementById("tabCon_" + i).style.display = "none"; //将所有的层都隐藏 
            }
            document.getElementById("tabCon_" + j).style.display = "block";//显示当前层    
        });




        //轮播图
        var i = 0;
        var time = 0;

        $(".textList ul li").hover(function () {
            console.log("ss");
            i = $(this).index();
            console.log(i);
            $(".carousel ul li").eq(i).fadeIn(100).siblings().fadeOut(100);
            $(this).addClass("bg").siblings().removeClass("bg");
            clearInterval(time);
        }, function () {
            time = setInterval("jumper()", 3000);
        })


        function jumper() {
            i++;
            if (i > 4) {
                i = 0;
            }
            // console.log(new Date());
            $(".carousel ul li").eq(i).fadeIn(100).siblings().fadeOut(100);
            $(".textList ul li").eq(i).addClass("bg").siblings().removeClass("bg");
        }

        time = setInterval("jumper()", 3000);

    </script>
</asp:Content>
