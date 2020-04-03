using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryManager
{
    public partial class MainForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=LAPTOP-00JVMEVI\SQLEXPRESS;Initial Catalog=InventoryLevels;Integrated Security=True");
            SqlCommand update = new SqlCommand();
            update.Connection = con;
            var itemName = itemNameInput.SelectedValue;
            var quantity = UpdateAmount.Text;
            update.Parameters.AddWithValue("@itemName", itemName);
            update.Parameters.AddWithValue("@quantity", quantity);
            update.CommandText = "Update Inventory Set Quantity = @quantity where ItemName = @itemName";

            con.Open();
            update.ExecuteNonQuery();
            con.Close();
           

            GridView1.DataBind();
         

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=LAPTOP-00JVMEVI\SQLEXPRESS;Initial Catalog=InventoryLevels;Integrated Security=True");
            SqlCommand insert = new SqlCommand();
            insert.Connection = con;
            var itemName = newItemName.Text;
            var quantity = UpdateAmount.Text;
            insert.Parameters.AddWithValue("@itemName", itemName);
            insert.Parameters.AddWithValue("@quantity", quantity);
            insert.CommandText = "Insert into Inventory (ItemName, Quantity) Values (@itemName, @quantity)";

            con.Open();
            insert.ExecuteNonQuery();
            con.Close();


            GridView1.DataBind();

        }
    }
}