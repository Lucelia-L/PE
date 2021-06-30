<%@ Page Title="新闻详情" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="PE.Detail" Theme="Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Import Namespace="System.Data.Odbc" %>
    <%@ Import Namespace="System.Diagnostics" %>
    <%@ Import Namespace="PE.App_Code" %>
    <%
        int article_id = Int32.Parse(Request.QueryString["article_id"]);
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        OdbcConnection conn = new OdbcConnection(connstr);
        string title = null;
        string content = null;

        try
        {
            conn.Open();
            string sql = "select * from article where article_id=" + article_id;
            OdbcCommand cmd = new OdbcCommand(sql, conn);
            OdbcDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                title = (string)rdr[1];
                content = (string)rdr[2];
            }
            rdr.Close();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.ToString());
        }
        conn.Close();
    %>
    <div class="detail-main">
        <div class="article">
            <div class="title">
                <%= title%>
            </div>
            <div class="content">
                <%=content %>
            </div>
        </div>
        <div class="comment-send">
            <asp:TextBox CssClass="comment-textarea" ID="TextBox1" TextMode="MultiLine" runat="server"></asp:TextBox>
           
            <asp:Button CssClass="commentBtn" ID="Button1" runat="server" Text="发送" OnClick="SendComment" />
        </div>
        <div class="comment-text">文章评论</div>
        <div class="comments">
            <%
                List<Comment> list = new List<Comment>();
                try
                {
                    conn.Open();
                    string sql = "select c.comment_id,c.user_id,c.article_id,c.content,c.time,u.name " +
                    "from comment as c,user as u where article_id=" + article_id + " and c.user_id=u.user_id";
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
        <div class="myright">Lucelia</div>
    </div>
</asp:Content>
