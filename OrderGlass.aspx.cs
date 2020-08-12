using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _202_UserMaintenance
{
    public partial class OrderGlass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryStringn["cat"] !=null)
            {
                DataList1.DataSourceID = null;
                DataList1.DataSourceID = SqlDataSource2;
                DataList1.DataBind();
            }

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            DataList1.DataSourceID = null;
            DataList1.DataSource = SqlDataSource1;
            DataList1.DataBind();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderGlass.aspx?cat=MEN");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            Response.Redirect("OrderGlass.aspx?cat=WOMEN");
        }
    }
}