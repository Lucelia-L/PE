<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="PE.Detail" Theme="Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Import Namespace="System.Data.Odbc" %>
    <%@ Import Namespace="System.Diagnostics" %>
    <%@ Import Namespace="PE.App_Code" %>
    <%
        int article_id = Int32.Parse(Request.QueryString["article_id"]);

        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        Console.WriteLine(connstr);

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
                // Response.Write(rdr[1]);
                // Response.Write(rdr[2]);
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
                    Debug.WriteLine("comment获取数据");
                    conn.Open();
                    string sql = "select c.comment_id,c.user_id,c.article_id,c.content,c.time,u.name from comment as c,user as u where article_id=" + article_id + " and c.user_id=u.user_id";
                    Debug.WriteLine(sql);
                    OdbcCommand cmd = new OdbcCommand(sql, conn);
                    OdbcDataReader rdr = cmd.ExecuteReader();

                    Debug.WriteLine("comment-data");
                    while (rdr.Read())
                    {
                        Debug.WriteLine("评论。。。。");
                        Comment comment = new Comment();

                        comment.Comment_id = (int)rdr[0];
                        Debug.WriteLine(comment.Comment_id);
                        comment.User_id = (int)rdr[1];
                        Debug.WriteLine(comment.User_id);
                        comment.Article_id = (int)rdr[2];
                        Debug.WriteLine(comment.Article_id);
                        comment.Content = (string)rdr[3];
                        Debug.WriteLine(comment.Content);
                        comment.Time = rdr[4].ToString();
                        Debug.WriteLine(comment.Time);
                        comment.Name = (string)rdr[5];
                        Debug.WriteLine(comment.Name);
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
</asp:Content>
