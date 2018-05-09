using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

namespace Parse_and_Save
{
    public partial class Default : System.Web.UI.Page
    {
        public string DefaultFileDirectory = "Upload/";
        public string DefaultFileName = "";

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TB_word.Text == "")
            {
                Label1.Text = "Please enter search word";
            }
            else
            {
                if (FileUpload1.HasFile)
                {
                    try
                    {
                        FileUpload1.SaveAs(Server.MapPath(DefaultFileDirectory) + FileUpload1.FileName);
                        DefaultFileName = FileUpload1.PostedFile.FileName;
                        Label1.Text = "File name: " +
                             FileUpload1.PostedFile.FileName + "<br>" +
                             FileUpload1.PostedFile.ContentLength + " kb"
                             + "<br><b>Uploaded Successfully";
                        Parse();

                    }
                    catch (Exception ex)
                    {
                        Label1.Text = "ERROR: " + ex.Message.ToString();
                    }

                }
                else
                {
                    Label1.Text = "Please select an file";
                }
            }
            
            
        }

        public void Parse()
        {
            string pathDirectory= System.Web.HttpContext.Current.Server.MapPath(DefaultFileDirectory);
            string absolutePathToFile = Path.Combine(pathDirectory, DefaultFileName);
            
            StreamReader sr = new StreamReader(absolutePathToFile);
            string inputText = sr.ReadLine();
            string searchWord = TB_word.Text;
            try 
            { 
                string[] tempText = inputText.Split(new Char[] { '.' });
                for (int i = 0; i <= tempText.Length - 1; i++)
                {
                    bool cont = tempText[i].Contains(searchWord);
                    Regex reg = new Regex(searchWord);
                    MatchCollection match = reg.Matches(tempText[i]);
                    int countWord = match.Count;

                    if (cont == true)
                    {
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
                        con.Open();
                        string insert = "insert into Sentence (sentence, count) values (@sentence, @count)";
                        SqlCommand cmd = new SqlCommand(insert, con);
                        cmd.Parameters.AddWithValue("@sentence", tempText[i]);
                        cmd.Parameters.AddWithValue("@count", countWord);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                }

            }
            catch (Exception ex) 
            { 
                Label1.Text = "ERROR: " + ex.Message.ToString(); 
            }

        }
    }
}