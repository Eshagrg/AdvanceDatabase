<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content.aspx.cs" Inherits="ADVANCEDBCW.Webforms.Content" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
                        <div>
             <h1>Content Details</h1>
                    <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CONTENT_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="ACTION" />
                    <asp:BoundField DataField="CONTENT_ID" HeaderText="CONTENT_ID" ReadOnly="True" SortExpression="CONTENT_ID" />
                    <asp:BoundField DataField="CONTENT_TYPE" HeaderText="CONTENT_TYPE" SortExpression="CONTENT_TYPE" />
                    <asp:BoundField DataField="CONTENT_DESCRIPTION" HeaderText="CONTENT_DESCRIPTION" SortExpression="CONTENT_DESCRIPTION" />
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID"  ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="LESSON_NO" HeaderText="LESSON_NO"  ReadOnly="True" SortExpression="LESSON_NO" />
                    <asp:TemplateField HeaderText="COURSE_TITLE">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList3" runat="server" DataSourceID="course" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="course" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LESSON_TITLE">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" DataSourceID="Lesson" DataTextField="LESSON_TITLE" DataValueField="LESSON_NO" SelectedValue='<%# Bind("LESSON_NO") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Lesson" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

<HeaderStyle BackColor="Red" ForeColor="White"></HeaderStyle>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;CONTENT&quot; WHERE &quot;CONTENT_ID&quot; = :CONTENT_ID" InsertCommand="INSERT INTO &quot;CONTENT&quot; (&quot;CONTENT_ID&quot;, &quot;CONTENT_TYPE&quot;, &quot;CONTENT_DESCRIPTION&quot;, &quot;COURSE_ID&quot;, &quot;LESSON_NO&quot;) VALUES (:CONTENT_ID, :CONTENT_TYPE, :CONTENT_DESCRIPTION, :COURSE_ID, :LESSON_NO)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CONTENT&quot;" UpdateCommand="UPDATE &quot;CONTENT&quot; SET &quot;CONTENT_TYPE&quot; = :CONTENT_TYPE, &quot;CONTENT_DESCRIPTION&quot; = :CONTENT_DESCRIPTION, &quot;COURSE_ID&quot; = :COURSE_ID, &quot;LESSON_NO&quot; = :LESSON_NO WHERE &quot;CONTENT_ID&quot; = :CONTENT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="CONTENT_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CONTENT_ID" Type="String" />
                    <asp:Parameter Name="CONTENT_TYPE" Type="String" />
                    <asp:Parameter Name="CONTENT_DESCRIPTION" Type="String" />
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                    <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CONTENT_TYPE" Type="String" />
                    <asp:Parameter Name="CONTENT_DESCRIPTION" Type="String" />
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                    <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                    <asp:Parameter Name="CONTENT_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="CONTENT_ID" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">
           
                <InsertItemTemplate>
                     <h1>Add New Content</h1>
                    CONTENT_ID:
                    <asp:TextBox ID="CONTENT_IDTextBox" runat="server" Text='<%# Bind("CONTENT_ID") %>' CssClass="form-control"/>
                    <br />
                    CONTENT_TYPE:
                    <asp:TextBox ID="CONTENT_TYPETextBox" runat="server" Text='<%# Bind("CONTENT_TYPE") %>' CssClass="form-control" />
                    <br />
                    CONTENT_DESCRIPTION:
                    <asp:TextBox ID="CONTENT_DESCRIPTIONTextBox" runat="server" Text='<%# Bind("CONTENT_DESCRIPTION") %>' CssClass="form-control" />
                    <br />
                    COURSE_ID:
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="course_content" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="course_content" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                    <br />
                    LESSON_TITLE:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="lesson_content" DataTextField="LESSON_TITLE" DataValueField="LESSON_NO" SelectedValue='<%# Bind("LESSON_NO") %>' CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="lesson_content" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" CssClass="btn btn-success"/>
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger"/>
                </InsertItemTemplate>
                <ItemTemplate>
                   <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Content" CssClass="btn btn-dark" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
