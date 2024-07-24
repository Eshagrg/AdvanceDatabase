<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QnA_Section.aspx.cs" Inherits="ADVANCEDBCW.Webforms.Q_A_Section" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <h1>Q&A Information</h1>
                                <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="QANDA_SECTION_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="ACTION" />
                    <asp:BoundField DataField="QANDA_SECTION_ID" HeaderText="QANDA_SECTION_ID" ReadOnly="True" SortExpression="QANDA_SECTION_ID" />
                    <asp:BoundField DataField="SECTION_TITLE" HeaderText="SECTION_TITLE" SortExpression="SECTION_TITLE" />
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                                                    <asp:TemplateField HeaderText="COURSE_TITLE">
                                    <ItemTemplate>
                                        <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="coursetitledata" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="coursetitledata" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                                    </ItemTemplate>
                                </asp:TemplateField>
</Columns>
              

<HeaderStyle BackColor="Red" ForeColor="White"></HeaderStyle>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;QANDA_SECTION&quot; WHERE &quot;QANDA_SECTION_ID&quot; = :QANDA_SECTION_ID" InsertCommand="INSERT INTO &quot;QANDA_SECTION&quot; (&quot;QANDA_SECTION_ID&quot;, &quot;SECTION_TITLE&quot;, &quot;COURSE_ID&quot;) VALUES (:QANDA_SECTION_ID, :SECTION_TITLE, :COURSE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;QANDA_SECTION&quot;" UpdateCommand="UPDATE &quot;QANDA_SECTION&quot; SET &quot;SECTION_TITLE&quot; = :SECTION_TITLE, &quot;COURSE_ID&quot; = :COURSE_ID WHERE &quot;QANDA_SECTION_ID&quot; = :QANDA_SECTION_ID">
                <DeleteParameters>
                    <asp:Parameter Name="QANDA_SECTION_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="QANDA_SECTION_ID" Type="String" />
                    <asp:Parameter Name="SECTION_TITLE" Type="String" />
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SECTION_TITLE" Type="String" />
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                    <asp:Parameter Name="QANDA_SECTION_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="QANDA_SECTION_ID" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">
                <InsertItemTemplate>
                      <h2>Add New Q&A Section</h2>
                    QANDA_SECTION_ID:
                    <asp:TextBox ID="QANDA_SECTION_IDTextBox" runat="server" Text='<%# Bind("QANDA_SECTION_ID") %>' CssClass="form-control" />
                    <br />
                    SECTION_TITLE:
                    <asp:TextBox ID="SECTION_TITLETextBox" runat="server" Text='<%# Bind("SECTION_TITLE") %>' CssClass="form-control" />
                    <br />
                    COURSE_NAME:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="qna_course" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="qna_course" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" CssClass="btn btn-success" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                </InsertItemTemplate>
                <ItemTemplate>
               <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Q&A Details" CssClass="btn btn-dark" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
