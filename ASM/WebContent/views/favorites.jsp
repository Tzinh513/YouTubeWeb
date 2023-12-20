<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Video</title>
  <link rel="apple-touch-icon" sizes="76x76" href="<%=request.getContextPath()%>/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/assets/img/favicon.png">

  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="<%=request.getContextPath()%>/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/assets/css/nucleo-svg.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="<%=request.getContextPath()%>/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="<%=request.getContextPath()%>/assets/css/soft-ui-dashboard.css?v=1.0.3" rel="stylesheet" />

</head>
<body class="g-sidenav-show  bg-gray-100">


  <%@ include file="/common/menu.jsp"%>



  <main class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ">
  
    <!-- Navbar -->
    <%@ include file="/common/header_favorites.jsp"%>
    <!-- End Navbar -->
    
    
    <div class="container-fluid py-4">
             
             
             

      
      
      
    
      <!-- List Video -->
      
      <div class="the-1 row row-cols-1 row-cols-sm-2 row-cols-md-2 row-cols-lg-3">
      
      <c:forEach items = "${videos}"  var="video">
        <div class="card d-flex x2">
        <a href="<c:url value='/video?action=watch&id=${video.href}'/>">
          <div class="card x1 mx-auto mt-1">
            <div class=" x3 ">
            <img src="<c:url value='${video.poster}'/>" alt="Image" class="img-fluid">
            </div>
          </div>
         
          <h5 class="text-dark">${video.title}</h5>
          </a>
          <div class="views d-flex justify-content-between p-2">
            <span class="card-text">${video.shares} shares</span>
            <span class="card-text">${video.views} views </span>
          </div>
        </div>
        </c:forEach>
 
      </div>
      
      <!-- End List Video -->
      
      
      
       <!-- Page Number -->
      
          <div class="row tm-mb-90 mt-5 mb-3 ">
            <div class="col-12 d-flex justify-content-center align-items-center tm-paging-col ">
                <c:if test="${currentPage == 1 }">
                	<a href="javascript:void(0);" class="btn btn-dark tm-btn-prev text-danger text-gradient mb-1 disabled">Previous</a>
                </c:if>
                
                <c:if test="${currentPage > 1 }">
                	<a href="index?page=${currentPage -1}" class="btn btn-dark tm-btn-prev mb-1">Previous</a>
                </c:if>
                
                <div class="tm-paging d-flex">
                	
                	<c:forEach varStatus="i" begin="1" end = "${maxPage}">
                		 <a href="index?page=${i.index}"  class="btn btn-primary mx-2 text-danger text-gradient px-4 mb-0 page-link " href="javascript:;" ${currentPage == i.index ? 'active' : ''}">${i.index}</a>
                	</c:forEach>
                </div>
               <c:if test="${currentPage == maxPage }">
                	<a href="javascript:void(0);" class="btn btn-dark text-danger text-gradient tm-btn-prev mb-1 disabled">NextPage</a>
                </c:if>
                
                <c:if test="${currentPage < maxPage }">
                	<a href="index?page=${currentPage +1}" class="btn btn-dark tm-btn-prev mb-1">NextPage</a>
                </c:if>
            </div>            
        </div>
      
       <!--End Page Number -->
      

          <!-- Footer -->
    <%@ include file="/common/footer.jsp"%>
    <!-- End footer -->
      
      
    </div>
  </main>
  
  
  
  
  
  <div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
      <i class="fa fa-cog py-2"> </i>
    </a>
    <div class="card shadow-lg ">
      <div class="card-header pb-0 pt-3 ">
        <div class="float-start">
          <h5 class="mt-3 mb-0">Soft UI Configurator</h5>
          <p>See our dashboard options.</p>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="fa fa-close"></i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0">
        <!-- Sidebar Backgrounds -->
        <div>
          <h6 class="mb-0">Sidebar Colors</h6>
        </div>
        <a href="<c:url value='javascript:void(0)'/>" class="switch-trigger background-color">
          <div class="badge-colors my-2 text-start">
            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <!-- Sidenav Type -->
        <div class="mt-3">
          <h6 class="mb-0">Sidenav Type</h6>
          <p class="text-sm">Choose between 2 different sidenav types.</p>
        </div>
        <div class="d-flex">
          <button class="btn bg-gradient-primary w-100 px-3 mb-2 active" data-class="bg-transparent" onclick="sidebarType(this)">Transparent</button>
          <button class="btn bg-gradient-primary w-100 px-3 mb-2 ms-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
        </div>
        <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
        <!-- Navbar Fixed -->
        <div class="mt-3">
          <h6 class="mb-0">Navbar Fixed</h6>
        </div>
        <div class="form-check form-switch ps-0">
          <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
        </div>
        <hr class="horizontal dark my-sm-4">
        <a class="btn bg-gradient-dark w-100" href="<c:url value='https://www.creative-tim.com/product/soft-ui-dashboard-pro'/>">Free Download</a>
        <a class="btn btn-outline-dark w-100" href="<c:url value='https://www.creative-tim.com/learning-lab/bootstrap/license/soft-ui-dashboard'/>">View documentation</a>
        <div class="w-100 text-center">
          <a class="github-button" href="<%=request.getContextPath()%>https://github.com/creativetimofficial/soft-ui-dashboard" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star creativetimofficial/soft-ui-dashboard on GitHub">Star</a>
          <h6 class="mt-3">Thank you for sharing!</h6>
          <a href="<%=request.getContextPath()%>https://twitter.com/intent/tweet?text=Check%20Soft%20UI%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fsoft-ui-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
            <i class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
          </a>
          <a href="<%=request.getContextPath()%>https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/soft-ui-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
            <i class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
          </a>
        </div>
      </div>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="<%=request.getContextPath()%>/assets/js/core/popper.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/js/core/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/js/plugins/chartjs.min.js"></script>
 <!--  <script>
    var ctx = document.getElementById("chart-bars").getContext("2d");

    new Chart(ctx, {
      type: "bar",
      data: {
        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
          label: "Sales",
          tension: 0.4,
          borderWidth: 0,
          borderRadius: 4,
          borderSkipped: false,
          backgroundColor: "#fff",
          data: [450, 200, 100, 220, 500, 100, 400, 230, 500],
          maxBarThickness: 6
        }, ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
            },
            ticks: {
              suggestedMin: 0,
              suggestedMax: 500,
              beginAtZero: true,
              padding: 15,
              font: {
                size: 14,
                family: "Open Sans",
                style: 'normal',
                lineHeight: 2
              },
              color: "#fff"
            },
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false
            },
            ticks: {
              display: false
            },
          },
        },
      },
    });


    var ctx2 = document.getElementById("chart-line").getContext("2d");

    var gradientStroke1 = ctx2.createLinearGradient(0, 230, 0, 50);

    gradientStroke1.addColorStop(1, 'rgba(203,12,159,0.2)');
    gradientStroke1.addColorStop(0.2, 'rgba(72,72,176,0.0)');
    gradientStroke1.addColorStop(0, 'rgba(203,12,159,0)'); //purple colors

    var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);

    gradientStroke2.addColorStop(1, 'rgba(20,23,39,0.2)');
    gradientStroke2.addColorStop(0.2, 'rgba(72,72,176,0.0)');
    gradientStroke2.addColorStop(0, 'rgba(20,23,39,0)'); //purple colors

    new Chart(ctx2, {
      type: "line",
      data: {
        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
            label: "Mobile apps",
            tension: 0.4,
            borderWidth: 0,
            pointRadius: 0,
            borderColor: "#cb0c9f",
            borderWidth: 3,
            backgroundColor: gradientStroke1,
            fill: true,
            data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
            maxBarThickness: 6

          },
          {
            label: "Websites",
            tension: 0.4,
            borderWidth: 0,
            pointRadius: 0,
            borderColor: "#3A416F",
            borderWidth: 3,
            backgroundColor: gradientStroke2,
            fill: true,
            data: [30, 90, 40, 140, 290, 290, 340, 230, 400],
            maxBarThickness: 6
          },
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              padding: 10,
              color: '#b2b9bf',
              font: {
                size: 11,
                family: "Open Sans",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              color: '#b2b9bf',
              padding: 20,
              font: {
                size: 11,
                family: "Open Sans",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
        },
      },
    });
  </script> -->
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="<%=request.getContextPath()%>/assets/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
</body>
</html>