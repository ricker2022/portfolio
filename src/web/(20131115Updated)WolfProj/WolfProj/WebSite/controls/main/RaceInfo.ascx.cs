using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class controls_main_RaceInfo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string raceString = string.Empty;
        HtmlTable outterTable = new HtmlTable();
        outterTable.Border = 0;
        HtmlTableRow innerRow = null;
        HtmlTableCell innerCell = null;
        Label innerLabel = null;

        innerRow = new HtmlTableRow();
        outterTable.Rows.Add(innerRow);

        innerCell = new HtmlTableCell();
        innerRow.Cells.Add(innerCell);
        innerLabel = new Label();
        //innerLabel.CssClass = "";
        innerLabel.Style.Add("color", "blue");
        innerCell.Controls.Add(innerLabel);
        innerLabel.Text = "排名";


        innerCell = new HtmlTableCell();
        innerRow.Cells.Add(innerCell);
        innerLabel = new Label();
        innerCell.Controls.Add(innerLabel);
        innerLabel.Text = "隊伍";


        innerCell = new HtmlTableCell();
        innerRow.Cells.Add(innerCell);
        innerLabel = new Label();
        innerCell.Controls.Add(innerLabel);
        innerLabel.Text ="應賽";



        innerCell = new HtmlTableCell();
        innerRow.Cells.Add(innerCell);
        innerLabel = new Label();
        innerCell.Controls.Add(innerLabel);
        innerLabel.Text ="出賽";

        innerCell = new HtmlTableCell();
        innerRow.Cells.Add(innerCell);
        innerLabel = new Label();
        innerCell.Controls.Add(innerLabel);
        innerLabel.Text = "戰績";

        if (this.Cache["TeamMember"] == null)
        {
            List<TeamMember> bbb = ttt();

            if(bbb.Count>0)
            {
                foreach (var item in bbb)
                {
                    innerRow = new HtmlTableRow();
                    outterTable.Rows.Add(innerRow);

                    innerCell = new HtmlTableCell();
                    innerRow.Cells.Add(innerCell);
                    innerLabel = new Label();
                    innerCell.Controls.Add(innerLabel);
                    innerLabel.Text = item.tno;


                    innerCell = new HtmlTableCell();
                    innerRow.Cells.Add(innerCell);
                    innerLabel = new Label();
                    innerCell.Controls.Add(innerLabel);
                    innerLabel.Text = " <img src='" + item.timg + "' width='40' height='40' border='0'/>";


                    innerCell = new HtmlTableCell();
                    innerRow.Cells.Add(innerCell);
                    innerLabel = new Label();
                    innerCell.Controls.Add(innerLabel);
                    innerLabel.Text = item.tall;



                    innerCell = new HtmlTableCell();
                    innerRow.Cells.Add(innerCell);
                    innerLabel = new Label();
                    innerCell.Controls.Add(innerLabel);
                    innerLabel.Text = item.tjoin;

                    innerCell = new HtmlTableCell();
                    innerRow.Cells.Add(innerCell);
                    innerLabel = new Label();
                    innerCell.Controls.Add(innerLabel);
                    innerLabel.Text = item.reward;
                    //raceString += item.tno + " <img src='" + item.timg + "' width='40' height='40' border='0'/>" + " " + item.tall + " " + item.tjoin + " " + item.reward + "<br/>";
                }
            }
            else
            {
                innerRow = new HtmlTableRow();
                outterTable.Rows.Add(innerRow);

                innerCell = new HtmlTableCell();
                innerCell.ColSpan = 5;
                innerRow.Cells.Add(innerCell);
                innerLabel = new Label();
                innerCell.Controls.Add(innerLabel);
                innerLabel.Text = "empty";
            }

          
            this.Cache.Insert("TeamMember", bbb, null, DateTime.Now.AddSeconds(10), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.High, null);
        }
        else
        {
            if (((List<TeamMember>)Cache["TeamMember"]).Count>0)
            {
                foreach (var item in (List<TeamMember>)Cache["TeamMember"])
                {
                    innerRow = new HtmlTableRow();
                    outterTable.Rows.Add(innerRow);

                    innerCell = new HtmlTableCell();
                    innerRow.Cells.Add(innerCell);
                    innerLabel = new Label();
                    innerCell.Controls.Add(innerLabel);
                    innerLabel.Text = item.tno;


                    innerCell = new HtmlTableCell();
                    innerRow.Cells.Add(innerCell);
                    innerLabel = new Label();
                    innerCell.Controls.Add(innerLabel);
                    innerLabel.Text = " <img src='" + item.timg + "' width='40' height='40' border='0'/>";


                    innerCell = new HtmlTableCell();
                    innerRow.Cells.Add(innerCell);
                    innerLabel = new Label();
                    innerCell.Controls.Add(innerLabel);
                    innerLabel.Text = item.tall;



                    innerCell = new HtmlTableCell();
                    innerRow.Cells.Add(innerCell);
                    innerLabel = new Label();
                    innerCell.Controls.Add(innerLabel);
                    innerLabel.Text = item.tjoin;

                    innerCell = new HtmlTableCell();
                    innerRow.Cells.Add(innerCell);
                    innerLabel = new Label();
                    innerCell.Controls.Add(innerLabel);
                    innerLabel.Text = item.reward;
                    // raceString += item.tno + " <img src='" + item.timg + "' width='40' height='40' border='0'/>" + " " + item.tall + " " + item.tjoin + " " + item.reward + "<br/>";
                }
            }
            else
            {
                innerRow = new HtmlTableRow();
                outterTable.Rows.Add(innerRow);

                innerCell = new HtmlTableCell();
                innerCell.ColSpan = 5;
                innerRow.Cells.Add(innerCell);
                innerLabel = new Label();
                innerCell.Controls.Add(innerLabel);
                innerLabel.Text = "empty";
            }
         

        }
        this.racecontent.Controls.Add(outterTable);
    }
    struct TeamMember
    {
        public string tno;
        public string timg;
        public string tall;
        public string tjoin;
        public string reward;
    }
    private List<TeamMember> ttt()
    {
        List<TeamMember> result = new List<TeamMember>();
        string html;

        try
        {
            // obtain some arbitrary html....
            using (var client = new WebClient())
            {
                html = client.DownloadString("http://www.esports.com.tw/index.php");
            }
        
            HtmlDocument doc = new HtmlDocument();
            doc.LoadHtml(html);
            // StringBuilder sb = new StringBuilder();


            HtmlNodeCollection node = doc.DocumentNode.SelectNodes("/html[1]/body[1]/div[2]/div[4]/ul[4]/li[1]/div[1]/div[2]/div[1]/table[1]/tr ");
            //var node = doc.DocumentNode.SelectSingleNode("//div[@class='overview'] ");
            // foreach (HtmlNode node in doc.DocumentNode.SelectNodes("//div[@class='overview'] ")) ////div[@class='search_hit']"
            //  {               
            //sb.AppendLine(node.InnerHtml);
            ////string gettest = node.Name;

            foreach (HtmlNode node2 in node)
            {
                TeamMember tempResult = new TeamMember();

                HtmlNodeCollection contentNode = node2.SelectNodes("./td ");
                //var a5 = node2.SelectSingleNode("./td ");
                int columnCounts = contentNode.Count;
                tempResult.tno = contentNode[0].InnerText;

                tempResult.timg = "http://www.esports.com.tw" + contentNode[1].SelectSingleNode(@".//img[@class='teamLogo']").Attributes["src"].Value;
                tempResult.tall = contentNode[2].InnerText;
                tempResult.tjoin = contentNode[3].InnerText;
                tempResult.reward = contentNode[4].InnerText;
                result.Add(tempResult);

            }
            //  }

            //return sb.ToString();
        }
        catch (Exception)
        {
            //use cache file

            //throw;
        }

        return result;


    }

    private string postData2(string pLink)
    {
        string result = string.Empty;
        Encoding myEncoding = Encoding.GetEncoding("UTF-8");
        string address = pLink;

        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(address);

        req.Method = "GET";
        //   string postData = pData;
        //   byte[] byteArray = Encoding.UTF8.GetBytes(postData);

        CookieContainer cookieContainer = new CookieContainer();
        req.CookieContainer = cookieContainer;
        using (WebResponse wr = req.GetResponse())
        {

            using (StreamReader myStreamReader = new StreamReader(wr.GetResponseStream(), myEncoding))
            {

                result = myStreamReader.ReadToEnd();

                Console.WriteLine("data:" + result);

            }

        }

        return result;

    }
}