<body class='<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="ADVANCEDBCW.Instructor" %>'>
</body>

    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Instructor Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

    <body>
        <form id="form1" runat="server" >

            <div>
                 <h1>Instructor Information</h1>
                        <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>
            <asp:GridView runat="server" DataSourceID="SqlDataSource1" ID="gvins" CssClass="table table-striped table-bordered table-hover" DataKeyNames="INSTRUCTOR_ID" AutoGenerateColumns="False" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="ACTION"></asp:CommandField>
                                <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID" />
                                <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                                <asp:BoundField DataField="INSTRUCTOR_DOB" HeaderText="INSTRUCTOR_DOB" SortExpression="INSTRUCTOR_DOB" />
                                <asp:BoundField DataField="INSTRUCTOR_CONTACTNO" HeaderText="INSTRUCTOR_CONTACTNO" SortExpression="INSTRUCTOR_CONTACTNO" />
                                <asp:BoundField DataField="INSTRUCTOR_EMAIL" HeaderText="INSTRUCTOR_EMAIL" SortExpression="INSTRUCTOR_EMAIL" />
                                <asp:BoundField DataField="INSTRUCTOR_COUNTRY" HeaderText="INSTRUCTOR_COUNTRY" SortExpression="INSTRUCTOR_COUNTRY" />
                                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" />
                                <asp:TemplateField HeaderText="COURSE_TITLE">
                                    <ItemTemplate>
                                        <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="coursetitledata" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="coursetitledata" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                                    </ItemTemplate>
                                </asp:TemplateField>
</Columns>
                    </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM &quot;INSTRUCTOR&quot; WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID"
                    InsertCommand="INSERT INTO &quot;INSTRUCTOR&quot; (&quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot;, &quot;INSTRUCTOR_DOB&quot;, &quot;INSTRUCTOR_CONTACTNO&quot;, &quot;INSTRUCTOR_EMAIL&quot;, &quot;INSTRUCTOR_COUNTRY&quot;, &quot;COURSE_ID&quot;) VALUES (:INSTRUCTOR_ID, :INSTRUCTOR_NAME, :INSTRUCTOR_DOB, :INSTRUCTOR_CONTACTNO, :INSTRUCTOR_EMAIL, :INSTRUCTOR_COUNTRY, :COURSE_ID)"
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                    SelectCommand="SELECT * FROM &quot;INSTRUCTOR&quot;"
                    UpdateCommand="UPDATE &quot;INSTRUCTOR&quot; SET &quot;INSTRUCTOR_NAME&quot; = :INSTRUCTOR_NAME, &quot;INSTRUCTOR_DOB&quot; = :INSTRUCTOR_DOB, &quot;INSTRUCTOR_CONTACTNO&quot; = :INSTRUCTOR_CONTACTNO, &quot;INSTRUCTOR_EMAIL&quot; = :INSTRUCTOR_EMAIL, &quot;INSTRUCTOR_COUNTRY&quot; = :INSTRUCTOR_COUNTRY, &quot;COURSE_ID&quot; = :COURSE_ID WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID" OnSelecting="SqlDataSource1_Selecting">
                    <DeleteParameters>
                        <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
                        <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                        <asp:Parameter Name="INSTRUCTOR_DOB" Type="DateTime" />
                        <asp:Parameter Name="INSTRUCTOR_CONTACTNO" Type="String" />
                        <asp:Parameter Name="INSTRUCTOR_EMAIL" Type="String" />
                        <asp:Parameter Name="INSTRUCTOR_COUNTRY" Type="String" />
                        <asp:Parameter Name="COURSE_ID" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                        <asp:Parameter Name="INSTRUCTOR_DOB" Type="DateTime" />
                        <asp:Parameter Name="INSTRUCTOR_CONTACTNO" Type="String" />
                        <asp:Parameter Name="INSTRUCTOR_EMAIL" Type="String" />
                        <asp:Parameter Name="INSTRUCTOR_COUNTRY" Type="String" />
                        <asp:Parameter Name="COURSE_ID" Type="String" />
                        <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
  
               
   
                            <asp:FormView ID="FormView1" runat="server"  DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging" DataKeyNames="INSTRUCTOR_ID">
                                <InsertItemTemplate>
                                                               <HeaderTemplate>
    <h2>Add New Instructor</h2>
</HeaderTemplate>
                                    
                                    INSTRUCTOR_ID:
                                
</br>
<asp:RequiredFieldValidator ID="rfvINSTRUCTOR_ID" runat="server" ControlToValidate="INSTRUCTOR_IDTextBox" ErrorMessage="Please enter INSTRUCTOR_ID" Display="Dynamic" CssClass="text-danger" />
<asp:TextBox ID="INSTRUCTOR_IDTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_ID") %>' CssClass="form-control" />
<br />

INSTRUCTOR_NAME:
                                    </br>
<asp:RequiredFieldValidator ID="rfvINSTRUCTOR_NAME" runat="server" ControlToValidate="INSTRUCTOR_NAMETextBox" ErrorMessage="Please enter INSTRUCTOR_NAME" Display="Dynamic" CssClass="text-danger" />
<asp:TextBox ID="INSTRUCTOR_NAMETextBox" runat="server" Text='<%# Bind("INSTRUCTOR_NAME") %>' CssClass="form-control" />
<br />

INSTRUCTOR_DOB:

<asp:TextBox ID="INSTRUCTOR_DOBTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_DOB") %>' CssClass="form-control" />
<br />

INSTRUCTOR_CONTACTNO:
                                    </br>
<asp:RequiredFieldValidator ID="rfvINSTRUCTOR_CONTACTNO" runat="server" ControlToValidate="INSTRUCTOR_CONTACTNOTextBox" ErrorMessage="Please enter INSTRUCTOR_CONTACTNO" Display="Dynamic" CssClass="text-danger" />
<asp:TextBox ID="INSTRUCTOR_CONTACTNOTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_CONTACTNO") %>' CssClass="form-control" />
<br />

INSTRUCTOR_EMAIL:
                                    </br>
<asp:RequiredFieldValidator ID="rfvINSTRUCTOR_EMAIL" runat="server" ControlToValidate="INSTRUCTOR_EMAILTextBox" ErrorMessage="Please enter INSTRUCTOR_EMAIL" Display="Dynamic" CssClass="text-danger" />
<asp:TextBox ID="INSTRUCTOR_EMAILTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_EMAIL") %>' CssClass="form-control" />
<br />

INSTRUCTOR_COUNTRY:
                                    </br>
<asp:RequiredFieldValidator ID="rfvINSTRUCTOR_COUNTRY" runat="server" ControlToValidate="INSTRUCTOR_COUNTRYTextBox" ErrorMessage="Please enter INSTRUCTOR_COUNTRY" Display="Dynamic" CssClass="text-danger" />
<asp:TextBox ID="INSTRUCTOR_COUNTRYTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_COUNTRY") %>' CssClass="form-control" />
<br />

                                    COURSE_TITLE:
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'  CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                                    <br />
                                   <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" CssClass="btn btn-success" OnClientClick="return validateForm();" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                </InsertItemTemplate>

                                <ItemTemplate>
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Instructor" CssClass="btn btn-dark"/>
                                </ItemTemplate>
                </asp:FormView>
  
               
   
                            </div>
        </form>
         <script type="text/javascript">
        function validateForm() {
            var isValid = true;

            // Perform additional validation if needed
            // Example: Check other conditions and set isValid accordingly

            return isValid;
        }
         </script>
    </body>
    </html>
'