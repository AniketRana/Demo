using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration ;


public partial class _Default : System.Web.UI.Page
{
    //OleDbConnection cnnstr = new OleDbConnection("provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:/Aniket/Demo/App_Data/dbDemo.accdb");
    OleDbConnection cnnstr = new OleDbConnection(ConfigurationManager.ConnectionStrings["Demo"].ConnectionString);
    string sql;
    DataSet ds = new DataSet();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }   
    }
    public void Bind()
    {
        if (cnnstr.State == ConnectionState.Open)
        {
            cnnstr.Close();
        }
        cnnstr.Open();
        sql = "Select * from tblDemo";
        OleDbDataAdapter adp = new OleDbDataAdapter(sql, cnnstr);
       
        adp.Fill(ds);
        grvdemo.DataSource = ds;
        grvdemo.DataBind();

        cnnstr.Close();
        txtFname.Text = "";
        txtLname.Text = "";
        txtMno .Text = "";
        txtAddress.Text = "";
        txtEmail.Text = "";
    }

    protected void grvdemo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvdemo.EditIndex = -1;
        Bind();
    }
    protected void grvdemo_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvdemo.EditIndex =e.NewEditIndex;
        Bind();
    }
    protected void grvdemo_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblID = (Label)grvdemo.Rows[e.RowIndex].FindControl("lblID");
        TextBox gtxtFname= (TextBox)grvdemo.Rows[e.RowIndex].FindControl("gtxtFname");
        TextBox gtxtLname = (TextBox)grvdemo.Rows[e.RowIndex].FindControl("gtxtLname");
        TextBox gtxtMno= (TextBox)grvdemo.Rows[e.RowIndex].FindControl("gtxtMno");
        TextBox gtxtAddress = (TextBox)grvdemo.Rows[e.RowIndex].FindControl("gtxtAddress");
        TextBox gtxtEmail = (TextBox)grvdemo.Rows[e.RowIndex].FindControl("gtxtEmail");

        cnnstr.Open();
       
        sql = "Update tblDemo set Fname = '" + gtxtFname.Text + "',Lname = '"+gtxtLname .Text+"',Mno = '"+gtxtMno .Text+"',Address = '"+gtxtAddress .Text+"',Email = '"+gtxtEmail .Text+"' Where ID = "+lblID.Text+ "";
        OleDbCommand cmd = new OleDbCommand(sql, cnnstr);
        cmd.ExecuteNonQuery();
        cnnstr.Close();
        grvdemo.EditIndex = -1;
        Bind();
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        Button btnId = (Button)sender;
        string ID = btnId.CommandArgument;
       
        cnnstr.Open();
        sql = "Delete from tblDemo where ID = " + ID + "";
        OleDbCommand cmd = new OleDbCommand(sql, cnnstr);
        cmd.ExecuteNonQuery();
        cnnstr.Close();
        Bind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        cnnstr.Open();
        sql = "insert into tblDemo (Fname ,Lname , Mno, Address, Email) values ('" + txtFname.Text + "','" + txtLname.Text + "','" + txtMno.Text + "','" + txtAddress.Text + "','"+txtEmail .Text +"')";
        OleDbCommand cmd = new OleDbCommand(sql, cnnstr);
        cmd.ExecuteNonQuery();
        cnnstr.Close();

        Bind();

        pnlForm.Visible = false;
        pnlgrid.Visible = true;

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        pnlForm.Visible = true;
        pnlgrid.Visible = false;
    }
    protected void btnSerach_Click(object sender, EventArgs e)
    {
        if (cnnstr.State == ConnectionState.Open)
        {
            cnnstr.Close();
        }
        cnnstr.Open();
        sql = "Select * from tblDemo where "+ddlfield.SelectedValue+" LIKE '%" + txtserach.Text + "%' ";
        OleDbDataAdapter adp = new OleDbDataAdapter(sql, cnnstr);
        DataSet ds1 = new DataSet();
        adp.Fill(ds1);
        grvdemo .DataSource = ds1;
        grvdemo.DataBind();
        cnnstr.Close();
    }
    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        Bind();
    }
    protected void grvdemo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //grvdemo.EditIndex = e.NewPageIndex;
        //Bind();
        Bind();
        grvdemo.PageIndex = e.NewPageIndex;
        grvdemo.DataBind();
    }

}