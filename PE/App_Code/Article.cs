using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PE.App_Code
{
    public class Article
    {
        private int article_id;
        private string title;
        private string content;
        private int type;
        private string img;

        public int Article_id { get => article_id; set => article_id = value; }
        public string Title { get => title; set => title = value; }
        public string Content { get => content; set => content = value; }
        public int Type { get => type; set => type = value; }
        public string Img { get => img; set => img = value; }
    }


}