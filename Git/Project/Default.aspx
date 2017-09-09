<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <h2 align="ceneter">
                Demo Project
            </h2>

         <asp:Button ID="btnInsert" runat="server" Text="Add New Record" OnClick="btnInsert_Click" />
        
        <hr width="70%">
      
           
        </center>
        <br>
        <asp:Panel ID="pnlForm" runat="server" Visible="false">
            <center>
                First Name :
                <asp:TextBox ID="txtFname" required  runat="server"></asp:TextBox>
                <br>
                <br>
                Last Name :
                <asp:TextBox ID="txtLname" required runat="server"></asp:TextBox>
                <br>
                <br>
                Mobile No :
                <asp:TextBox ID="txtMno" required runat="server"></asp:TextBox>
                <br>
                <br>
                Address :
                <asp:TextBox ID="txtAddress" required runat="server"></asp:TextBox>
                <br>
                <br>
                Email :
                <asp:TextBox ID="txtEmail" required runat="server"></asp:TextBox>
                <br>
                <br>
                <asp:Button ID="btnSubmit"  runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <br>
                <br>
            </center>
        </asp:Panel>
        <br>
        <asp:Panel ID="pnlgrid" Visible="true" runat="server">
            <center>
             
                <asp:DropDownList ID="ddlfield" runat="server">
                <asp:ListItem>ID</asp:ListItem>
                <asp:ListItem>Fname</asp:ListItem>
                <asp:ListItem>Lname</asp:ListItem>
                <asp:ListItem>Mno</asp:ListItem>
                <asp:ListItem>Address</asp:ListItem>
                <asp:ListItem>Email</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtserach" runat="server"></asp:TextBox> 
                <asp:Button ID="btnSerach" runat="server" Text="Search Now" 
                    onclick="btnSerach_Click"></asp:Button> 
                <asp:Button ID="btnShowAll" runat="server" Text="Show All" onclick="btnShowAll_Click" 
                    ></asp:Button>     
                <br><br>

                <asp:GridView ID="grvdemo" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC"
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2"
                    ForeColor="Black" OnRowCancelingEdit="grvdemo_RowCancelingEdit" OnRowEditing="grvdemo_RowEditing"
                    OnRowUpdating="grvdemo_RowUpdating" AllowPaging=true PageSize=5 
                     onpageindexchanging="grvdemo_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdate" runat="server" Text="Update" CommandName="Update"></asp:LinkButton>
                                <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                            <%-- <EditItemTemplate>
                            <asp:TextBox ID="gtxtID" runat="server" Width="50px" Text='<%# Eval("ID") %>'></asp:TextBox>
                        </EditItemTemplate>--%>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label ID="lblFname" runat="server" Text='<%# Eval("Fname") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="gtxtFname" runat="server" Width="50px" Text='<%# Eval("Fname") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label ID="lblLname" runat="server" Text='<%# Eval("Lname") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="gtxtLname" runat="server" Width="50px" Text='<%# Eval("Lname") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mobile No">
                            <ItemTemplate>
                                <asp:Label ID="lblMno" runat="server" Text='<%# Eval("Mno") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="gtxtMno" runat="server" Width="100px" Text='<%# Eval("Mno") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="gtxtAddress" runat="server" Width="50px" Text='<%# Eval("Address") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="gtxtEmail" runat="server" Width="120px" Text='<%# Eval("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("ID") %>'
                                    OnCommand="btnDelete_Command" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
               

            </center>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
