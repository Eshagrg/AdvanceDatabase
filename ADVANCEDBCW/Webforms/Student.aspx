<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="ADVANCEDBCW.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />

</head>
<body>
    <form id="form1" runat="server">
                <div>
            <h1>Student Information</h1>
                        <div class="d-flex justify-content-start mb-3">
                    <!-- Back Icon with HyperLink -->
                    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
                        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
                    </asp:HyperLink>
                </div>
        
            <asp:GridView runat="server" ID="gv1" DataSourceID="SqlDataSource1" DataKeyNames="STUDENT_ID"  HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White" CssClass="table table-striped table-bordered table-hover">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="ACTION"></asp:CommandField>
<%--                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
<asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
<asp:BoundField DataField="STUDENT_DOB" HeaderText="STUDENT_DOB" SortExpression="STUDENT_DOB" />
<asp:BoundField DataField="STUDENT_CONTACTNO" HeaderText="STUDENT_CONTACTNO" SortExpression="STUDENT_CONTACTNO" />
<asp:BoundField DataField="STUDENT_EMAIL" HeaderText="STUDENT_EMAIL" SortExpression="STUDENT_EMAIL" />
<asp:BoundField DataField="STUDENT_COUNTRY" HeaderText="STUDENT_COUNTRY" SortExpression="STUDENT_COUNTRY" />--%>

                </Columns>
            </asp:GridView>
       <%--  </div>
                         <div class ="esha2">--%>
                               <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging" DataKeyNames="STUDENT_ID">              
        <InsertItemTemplate>
         <!-- Bootstrap form layout -->
        <h1>Add New  Student</h1>
         <div class="form-group">
             <label for="STUDENT_IDTextBox">STUDENT_ID:</label>
             <asp:TextBox Text='<%# Bind("STUDENT_ID") %>' runat="server" ID="STUDENT_IDTextBox" CssClass="form-control" />
         </div>
         <div class="form-group">
             <label for="STUDENT_NAMETextBox">STUDENT_NAME:</label>
             <asp:TextBox Text='<%# Bind("STUDENT_NAME") %>' runat="server" ID="STUDENT_NAMETextBox" CssClass="form-control" />
         </div>
         <div class="form-group">
             <label for="STUDENT_CONTACTNOTextBox">STUDENT_CONTACTNO:</label>
             <asp:TextBox Text='<%# Bind("STUDENT_CONTACTNO") %>' runat="server" ID="STUDENT_CONTACTNOTextBox" CssClass="form-control" />
         </div>
         <div class="form-group">
             <label for="STUDENT_DOBTextBox">STUDENT_DOB:</label>
             <asp:TextBox Text='<%# Bind("STUDENT_DOB") %>' runat="server" ID="STUDENT_DOBTextBox" CssClass="form-control" />
         </div>
            <div class="form-group">
    <label for="STUDENT_COUNTRYTextBox">STUDENT_COUNTRY:</label>
    <asp:TextBox Text='<%# Bind("STUDENT_COUNTRY") %>' runat="server" ID="STUDENT_COUNTRYTextBox" CssClass="form-control" />
</div>
            <div class="form-group">
    <label for="STUDENT_DOBTextBox">STUDENT_EMAIL:</label>
    <asp:TextBox Text='<%# Bind("STUDENT_EMAIL") %>' runat="server" ID="STUDENT_EMAILTextBox" CssClass="form-control" />
</div>

         <div class="form-group">
             <asp:LinkButton runat="server" Text="Add" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn btn-success" />
             <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn btn-danger"/>
         </div>
     </InsertItemTemplate>
      <ItemTemplate>
    <asp:LinkButton runat="server" Text="Add New Student" CommandName="New" ID="NewButton" CausesValidation="False" CssClass="btn btn-dark" />
</ItemTemplate>
  </asp:FormView>
                                     </div>
 <%--   </div>
</div>
        <!-- Add Bootstrap JS and Popper.js (required for some Bootstrap components) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>--%>






         <asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    DeleteCommand="DELETE FROM STUDENT WHERE STUDENT_ID = :STUDENT_ID"
    InsertCommand="INSERT INTO STUDENT (STUDENT_ID, STUDENT_NAME, STUDENT_CONTACTNO, STUDENT_DOB, STUDENT_COUNTRY, STUDENT_EMAIL)
                   VALUES (:STUDENT_ID, :STUDENT_NAME, :STUDENT_CONTACTNO, :STUDENT_DOB, :STUDENT_COUNTRY, :STUDENT_EMAIL)"
    ProviderName='<%$ ConnectionStrings:ConnectionString.ProviderName %>'
    SelectCommand="SELECT STUDENT_ID, STUDENT_NAME, STUDENT_CONTACTNO, STUDENT_DOB, STUDENT_COUNTRY, STUDENT_EMAIL FROM STUDENT ORDER BY STUDENT_ID ASC"
    UpdateCommand="UPDATE STUDENT SET STUDENT_NAME = :STUDENT_NAME, STUDENT_CONTACTNO = :STUDENT_CONTACTNO, STUDENT_DOB = :STUDENT_DOB, STUDENT_COUNTRY = :STUDENT_COUNTRY, STUDENT_EMAIL = :STUDENT_EMAIL WHERE STUDENT_ID = :STUDENT_ID">

    <DeleteParameters>
        <asp:Parameter Name="STUDENT_ID" Type="String" />
    </DeleteParameters>

    <InsertParameters>
        <asp:Parameter Name="STUDENT_ID" Type="String" />
        <asp:Parameter Name="STUDENT_NAME" Type="String" />
        <asp:Parameter Name="STUDENT_CONTACTNO" Type="String" />
        <asp:Parameter Name="STUDENT_DOB" Type="DateTime" />
        <asp:Parameter Name="STUDENT_COUNTRY" Type="String" />
        <asp:Parameter Name="STUDENT_EMAIL" Type="String" />
    </InsertParameters>

    <UpdateParameters>
        <asp:Parameter Name="STUDENT_NAME" Type="String" />
        <asp:Parameter Name="STUDENT_CONTACTNO" Type="String" />
        <asp:Parameter Name="STUDENT_DOB" Type="DateTime" />
        <asp:Parameter Name="STUDENT_COUNTRY" Type="String" />
        <asp:Parameter Name="STUDENT_EMAIL" Type="String" />
        <asp:Parameter Name="STUDENT_ID" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    </form>
</body>
</html>
