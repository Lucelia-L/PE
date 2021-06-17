using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PE.App_Code
{
    public class Comment
    {
        private int comment_id;
        private int user_id;
        private int article_id;
        private string content;
        private string time;
        private string name;

        public int Comment_id { get => comment_id; set => comment_id = value; }
        public int User_id { get => user_id; set => user_id = value; }
        public int Article_id { get => article_id; set => article_id = value; }
        public string Content { get => content; set => content = value; }
        public string Time { get => time; set => time = value; }
        public string Name { get => name; set => name = value; }
    }


}