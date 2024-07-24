<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="ADVANCEDBCW.Course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Course Information</h1>
                    <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>
                    <asp:GridView runat="server" DataSourceID="Course1" ID="ctl11" DataKeyNames="COURSE_ID" CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="ACTION"></asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="esha2">
                    <asp:FormView ID="FormView1" runat="server" DataSourceID="Course1" OnPageIndexChanging="FormView1_PageIndexChanging" DataKeyNames="COURSE_ID" CssClass="esha2">
                        <InsertItemTemplate>
                                                                                          
    <h2>Add New Course</h2>
            <!-- Bootstrap form layout -->
                            <div class="form-group">
                                <label for="COURSE_IDTextBox">COURSE_ID:</label>
                                <asp:TextBox Text='<%# Bind("COURSE_ID") %>' runat="server" ID="COURSE_IDTextBox" CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="COURSE_TITLETextBox">COURSE_TITLE:</label>
                                <asp:TextBox Text='<%# Bind("COURSE_TITLE") %>' runat="server" ID="COURSE_TITLETextBox" CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="COURSE_DURATIONTextBox">COURSE_DURATION:</label>
                                <asp:TextBox Text='<%# Bind("COURSE_DURATION") %>' runat="server" ID="COURSE_DURATIONTextBox" CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <asp:LinkButton runat="server" Text="Add" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn btn-success" />
                                <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass= "btn btn-danger" />
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Add New Course" CommandName="New" ID="NewButton" CausesValidation="False" CssClass="btn btn-dark" />
                        </ItemTemplate>
                    </asp:FormView>
                </div>
          
     
        <asp:SqlDataSource ID="Course1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            DeleteCommand="DELETE FROM COURSE WHERE COURSE_ID = :COURSE_ID"
            InsertCommand="INSERT INTO COURSE (COURSE_ID, COURSE_TITLE, COURSE_DURATION) 
                            VALUES (:COURSE_ID, :COURSE_TITLE, :COURSE_DURATION)"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT COURSE_ID, COURSE_TITLE, COURSE_DURATION FROM COURSE"
            UpdateCommand="UPDATE COURSE SET COURSE_TITLE = :COURSE_TITLE, COURSE_DURATION = :COURSE_DURATION 
                            WHERE COURSE_ID = :COURSE_ID">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="COURSE_TITLE" Type="String" />
                <asp:Parameter Name="COURSE_DURATION" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="COURSE_TITLE" Type="String" />
                <asp:Parameter Name="COURSE_DURATION" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
