<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="PE.Detail" Theme="Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Import Namespace="System.Data.Odbc" %>
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
            <textarea class="comment-textarea" id="TextArea1" cols="145" rows="5"></textarea>
            <asp:Button CssClass="commentBtn" ID="Button1" runat="server" Text="发送" />
        </div>

    </div>
</asp:Content>
