<%@ Page Title="我的" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PE.Home" Theme="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Import Namespace="System.Data.Odbc" %>
    <%@ Import Namespace="System.Diagnostics" %>
    <%@ Import Namespace="PE.App_Code" %>
    <div class="home-main-all">
        <div class="home-main">
            <div class="tabs">
                <ul>
                    <li class="active">我的</li>
                    <li>评论</li>
                </ul>
            </div>
            <div class="container">
                <div id="tabCon_0">
                    <div class="tab-main">
                        <div class="tab-title">我的信息</div>
                        <div>用户名：<%=Session["username"] %></div>
                        <div>年龄：<%=Session["age"] %></div>
                        <div>性别：<%=Session["sex"] %></div>
                    </div>
                </div>
                <div id="tabCon_1">
                    <div class="tab-main">
                        <div class="tab-title">我的评论</div>
                        <%
                            string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                            OdbcConnection conn = new OdbcConnection(connstr);
                            List<Comment> list = new List<Comment>();
                            int user_id = (int)Session["user_id"];
                            try
                            {
                                conn.Open();
                                string sql = "select c.comment_id,c.user_id,c.article_id,c.content,c.time,u.name from comment " +
                    "as c,user as u where c.user_id=" + user_id + " and c.user_id=u.user_id";
                                OdbcCommand cmd = new OdbcCommand(sql, conn);
                                OdbcDataReader rdr = cmd.ExecuteReader();

                                while (rdr.Read())
                                {

                                    Comment comment = new Comment();
                                    comment.Comment_id = (int)rdr[0];
                                    comment.User_id = (int)rdr[1];
                                    comment.Article_id = (int)rdr[2];
                                    comment.Content = (string)rdr[3];
                                    comment.Time = rdr[4].ToString();
                                    comment.Name = (string)rdr[5];
                                    list.Add(comment);
                                }
                                rdr.Close();
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine(ex.ToString());
                            }
                            conn.Close();
                            foreach (Comment c in list)
                            {
                                Response.Write("<div class='comment-item'><div class='comment-title'><span class='comment-name'>");
                                Response.Write(c.Name);
                                Response.Write("</span><span class='comment-time'>");
                                Response.Write(c.Time);
                                Response.Write("</span></div><div class='comment-content'>");
                                Response.Write(c.Content);
                                Response.Write("</div></div>");
                            }
                        %>
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
            console.log(j);
            $(this).addClass("bg").siblings().removeClass("bg");
            for (i = 0; i <= 1; i++) {
                document.getElementById("tabCon_" + i).style.display = "none"; //将所有的层都隐藏 
            }
            document.getElementById("tabCon_" + j).style.display = "block";//显示当前层    
        });
    </script>
</asp:Content>
