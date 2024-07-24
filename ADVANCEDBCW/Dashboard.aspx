<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ADVANCEDBCW.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>E-Learning Platform</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font/css/materialdesignicons.min.css">

 
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" />
  </head>
  <body>
      <form id="form1" runat="server">
    <div class="container-scroller">
      <div class="row p-0 m-0 proBanner" id="proBanner">
        <div class="col-md-12 p-0 m-0">
          <div class="card-body card-body-padding d-flex align-items-center justify-content-between" style="background-color: red;">
            <div class="ps-lg-1">
              <div class="d-flex align-items-center justify-content-between">
                <p class="mb-0 font-weight-medium me-3 buy-now-text" style="font-size: 30px; font-weight: bold; color: black;">Welcome to E-Learning Platform </p>
                <a href="https://www.bootstrapdash.com/product/purple-bootstrap-admin-template/?utm_source=organic&utm_medium=banner&utm_campaign=buynow_demo" target="_blank" class="btn me-2 buy-now-btn border-0"></a>
              </div>
            </div>
            <div class="d-flex align-items-center justify-content-between">
              <a href="https://www.bootstrapdash.com/product/purple-bootstrap-admin-template/"><i class="mdi mdi-home me-3 text-white"></i></a>
              <button id="bannerClose" class="btn border-0 p-0">
                <i class="mdi mdi-close text-white me-0"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
        </div>
      <!-- partial:partials/_navbar.html -->
      
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
          <style>
    .nav-item:hover {
        background-color: red !important;
    }

    .nav-link:hover .menu-title {
        color: white !important;
    }
</style>
      <nav class="sidebar sidebar-offcanvas" id="sidebar" style="border-right: 2px solid #ddd; background-color:whitesmoke; width: 350px;">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
              </a>
            </li>
              <br />
            <li class="nav-item">
                <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="nav-link">
                <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;">Dashboard</span>
                <i class="mdi mdi-home menu-icon" style="font-size: 25px; color: black;"></i>
 </asp:HyperLink>
            </li>

                 <li class="nav-item">
  <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Student.aspx" CssClass="nav-link">
    <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;">Student</span>
    <i class="mdi mdi-account-school menu-icon" style="font-size: 25px; color: black;"></i>
  </asp:HyperLink>
</li>

    <li class="nav-item">
         <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Instructor.aspx" CssClass="nav-link">
        <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;" >Instructor</span>
        <i class="mdi mdi-account-tie menu-icon" style="font-size: 25px; color: black;"></i>
             </asp:HyperLink>
       </li>
    <li class="nav-item">
       <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Lesson.aspx" CssClass="nav-link">
        <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;">Lesson</span>
       <i class="mdi mdi-book-open menu-icon" style="font-size: 25px; color: black;"></i>
      </asp:HyperLink>
    </li>
    <li class="nav-item">
       <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Progress.aspx" CssClass="nav-link">
        <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;">Progress</span>
         <i class="mdi mdi-chart-line menu-icon" style="font-size: 25px; color: black;"></i>
      </asp:HyperLink>
    </li>
      <li class="nav-item">
   <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Course.aspx" CssClass="nav-link">
    <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;">Course</span>
    <i class="mdi mdi-book menu-icon" style="font-size: 25px; color: black;"></i>
  </asp:HyperLink>
</li>
                        <li class="nav-item">
   <asp:HyperLink runat="server" NavigateUrl="~/Webforms/EnrollStudent.aspx" CssClass="nav-link">
    <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;">Enrollment</span>
    <i class="mdi mdi-account-file menu-icon" style="font-size: 25px; color: black;"></i>
  </asp:HyperLink>
</li>
          <li class="nav-item">
   <asp:HyperLink runat="server" NavigateUrl="~/Webforms/QnA_Section.aspx" CssClass="nav-link">
    <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;">Q&A Section</span>
    <i class="mdi mdi-google-classroom menu-icon" style="font-size: 25px; color: black;"></i>
  </asp:HyperLink>
</li>
                        <li class="nav-item">
   <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Query.aspx" CssClass="nav-link">
    <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;">Query</span>
    <i class="mdi mdi-account-question menu-icon" style="font-size: 25px; color: black;"></i>
  </asp:HyperLink>
</li>
<li class="nav-item">
    <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Content.aspx" CssClass="nav-link">
        <span class="menu-title" style="font-size: 23px; font-weight: bold; color: black;">Content</span>
        <i class="mdi mdi-content-save-all menu-icon" style="font-size: 25px; color: black;"></i>
    </asp:HyperLink>
</li>

              <li class="nav-item">
    <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Feedback.aspx" CssClass="nav-link">
        <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;">Feedback</span>
        <i class="mdi mdi-comment-quote-outline menu-icon"style="font-size: 25px; color: black;"></i>
    </asp:HyperLink>
</li>

                        <li class="nav-item">
   <asp:HyperLink runat="server" NavigateUrl="~/Webforms/BestCourse.aspx" CssClass="nav-link">
    <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;">Top 3 Courses</span>
    <i class="mdi mdi-notebook-multiple menu-icon" style="font-size: 25px; color: black;"></i>
  </asp:HyperLink>
</li>
                        <li class="nav-item">
   <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Student _Enrollment_Record.aspx" CssClass="nav-link">
    <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;">Search Student</span>
    <i class="mdi mdi-file-search menu-icon" style="font-size: 25px; color: black;"></i>
  </asp:HyperLink>
</li>
                                      <li class="nav-item">
   <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Ins_Details.aspx" CssClass="nav-link">
    <span class="menu-title" style="font-size: 21px; font-weight: bold; color: black;"> Course Instructor</span>
    <i class="mdi mdi-library menu-icon" style="font-size: 25px; color: black;"></i>
  </asp:HyperLink>
</li>

 </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper" style="font-size: 14px;">
            <div class="page-header">
              <h3 class="page-title" style="margin-top: 20px;">
    <span class="page-title-icon bg-gradient-primary text-white me-2">
        <i class="mdi mdi-home"></i>
    </span> Dashboard
</h3>

            </div>
        <div class="row">
<div class="col-md-3 stretch-card grid-margin" style="font-size: 10px;">
  <div class="card bg-gradient-danger card-img-holder text-white" style="height: 130px;">
    <div class="card-body">
      <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
          <asp:TextBox ID="TextBox1" runat="server" BackColor="Transparent" BorderStyle="None" ReadOnly="True" Font-Size="26pt" Font-Bold="True" ForeColor="White"></asp:TextBox>
              <h4 class="font-weight-normal mb-2" style="font-size: 21px;">Student <i class="mdi mdi-account-school" style="font-size: 28px;"></i> 
                  <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Student.aspx" Text="View Details" style="font-size: 14px; font-weight: bold; color: black;"></asp:HyperLink>
                  <i class="mdi mdi-chevron-right" style="font-size: 14px;"></i>
      </h4>
    </div>
  </div>
</div>


      <div class="col-md-3 stretch-card grid-margin" style="font-size: 31px;">
  <div class="card bg-gradient-info card-img-holder text-white"  style="height: 130px;">
    <div class="card-body">
      <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
         <asp:TextBox ID="TextBox2" runat="server" BackColor="Transparent" BorderStyle="None" ReadOnly="True" Font-Size="26pt" Font-Bold="True"  ForeColor="White"></asp:TextBox>
      <h4 class="font-weight-normal mb-2" style="font-size: 21px;">Instructor <i class="mdi mdi-account-tie" style="font-size: 24px;"></i>
         <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Instructor.aspx" Text="View Details" style="font-size: 14px; font-weight: bold; color: black;"></asp:HyperLink>
 <i class="mdi mdi-chevron-right" style="font-size: 14px;"></i>       

      </h4>
    </div>
  </div>
</div>

 <div class="col-md-3 stretch-card grid-margin" style="font-size: 10px;">
  <div class="card bg-gradient-success card-img-holder text-white" style="height: 130px;">
    <div class="card-body">
      <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
          <asp:TextBox ID="TextBox3" runat="server" BackColor="Transparent" BorderStyle="None" ReadOnly="true" Font-Size="26pt" Font-Bold="true" ForeColor="White"></asp:TextBox>
        <h4 class="font-weight-normal mb-2" style="font-size: 21px;">Course <i class="mdi mdi-book" style="font-size: 28px;"></i>
      <asp:HyperLink runat="server" NavigateUrl="~/Webforms/Course.aspx" Text="View Details" style="font-size: 14px; font-weight: bold; color: black;"></asp:HyperLink>
 <i class="mdi mdi-chevron-right" style="font-size: 14px;"></i>
            </h4>
    </div>
  </div>
</div>

         <div class="col-md-3 stretch-card grid-margin" style="font-size: 10px;">
  <div class="card bg-warning card-img-holder text-white" style="height: 130px;">
    <div class="card-body">
      <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
          <asp:TextBox ID="TextBox4" runat="server" BackColor="Transparent" BorderStyle="None" ReadOnly="true" Font-Size="26pt" Font-Bold="true" ForeColor="White"></asp:TextBox>
        <h4 class="font-weight-normal mb-2" style="font-size: 21px;">Q&A Section <i class="mdi mdi-google-classroom menu-icon" style="font-size: 28px;"></i>
      <asp:HyperLink runat="server" NavigateUrl="~/Webforms/QnA_Section.aspx" Text="View Details" style="font-size: 14px; font-weight: bold; color: black;"></asp:HyperLink>
 <i class="mdi mdi-chevron-right" style="font-size: 14px;"></i>
            </h4>
    </div>
  </div>
</div>
            <div class="row" style="align-content: center">
    <div class="col-md-8" style="text-align:center; background-color:whitesmoke; box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); transition: 0.3s;">
        <div>
            <h3>Number of students in each course</h3>
        </div>
        <div>
            <asp:Chart ID="dashboardChart" runat="server" Width="1000" Height="500" DataSourceID="ChartDataSource">
                <Series>
                    <asp:Series ChartArea="ChartArea1" Name="Series1" XValueMember="COURSE_ID" YValueMembers="No_of_Students">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Title="Course ID">
                            <LabelStyle Interval="1" ForeColor="Blue" />
                        </AxisX>
                        <AxisY Title="Number of Students">
                        </AxisY>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:SqlDataSource ID="ChartDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT c.COURSE_ID, NVL(COUNT(e.STUDENT_ID), 0) AS NO_OF_STUDENTS
                               FROM COURSE c
                               LEFT JOIN ENROLLMENT e ON c.COURSE_ID = e.COURSE_ID
                               GROUP BY c.COURSE_ID">
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="col-md-4" style="text-align:center; background-color:whitesmoke; box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); transition: 0.3s;">
        <div>
            <h3>Number of Instructor in each course</h3>
        </div>
        <div>
            <asp:Chart ID="Chart1" runat="server" Width="490" Height="500" DataSourceID="SqlDataSource1" BackColor="WhiteSmoke">
                <Series>
                    <asp:Series ChartType="Doughnut" ChartArea="ChartArea1" Name="Series1" XValueMember="COURSE_ID" YValueMembers="NUMBER_OF_INSTRUCTORS">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <Area3DStyle Enable3D="True" />
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT c.COURSE_ID,
       c.COURSE_TITLE,
       COUNT(i.INSTRUCTOR_ID) AS NUMBER_OF_INSTRUCTORS
FROM COURSE c
LEFT JOIN INSTRUCTOR i ON c.COURSE_ID = i.COURSE_ID
GROUP BY c.COURSE_ID, c.COURSE_TITLE
">
            </asp:SqlDataSource>
        </div>
    </div>

</div>

          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <footer class="footer">
            <div class="container-fluid d-flex justify-content-between">
              <span class="text-muted d-block text-center text-sm-start d-sm-inline-block">Copyright © E-Learning platform.com 2024</span>
             
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/todolist.js"></script>
    <!-- End custom js for this page -->
      </form>
  </body>
</html>
