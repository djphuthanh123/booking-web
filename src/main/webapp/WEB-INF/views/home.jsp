<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
  <%--    <meta charset="UTF-8" />--%>
  <title>Archo - Architecture & Interior HTML Template</title>
  <meta
          name="description"
          content="Passenger Car system"
  />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Stylesheets -->
  <%--    <link href="../css/bootstrap.css" rel="stylesheet" />--%>
  <link href="../css/main.css" rel="stylesheet" />
  <link href="../css/bootstrap.css" rel="stylesheet">
  <link href="../css/responsive.css" rel="stylesheet" />
  <link href="../css/my.css" rel="stylesheet" />

  <!-- Fonts -->
  <link
          href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@400;700&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@100;300;400;500;700;900&family=Teko:wght@300;400;500;600;700&display=swap"
          rel="stylesheet"
  />

  <!-- Add site Favicon -->
  <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon" />
  <link rel="icon" href="../images/favicon.png" type="image/x-icon" />
  <meta name="msapplication-TileImage" content="images/favicon.png" />
</head>

<body>
<div class="page-wrapper">
  <!-- Main Header-->
  <header class="main-header">
    <!-- Header Upper -->
    <div class="header-upper">
      <div class="outer-container">
        <div class="inner-container clearfix">
          <div class="pull-left logo-box">
            <div class="logo">
              <a href="home.jsp"
              ><img src="../images/cover.png" alt="" title=""
              /></a>
            </div>
          </div>

          <div class="nav-outer pull-left clearfix">
            <!-- Mobile Navigation Toggler -->
            <div class="mobile-nav-toggler">
              <span class="icon ti-menu"></span>
            </div>
            <!-- Main Menu -->
            <nav class="main-menu navbar-expand-md">
              <div class="navbar-header">
                <button
                        class="navbar-toggler"
                        type="button"
                        data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                >
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
              </div>

              <div
                      class="navbar-collapse show collapse clearfix"
                      id="navbarSupportedContent"
              >
                <ul class="navigation clearfix">
                  <li class="current"><a href="home.jsp">Trang chủ</a></li>

                  <li >
                    <a href="transport.jsp">Nhà xe</a>

                  </li>
                  <li><a href="about.jsp">Về chúng tôi</a></li>
                  <li >
                    <a href="list-route.jsp">Tuyến đường</a>
                  </li>
                  <li><a href="contact.jsp">Liên hệ</a></li>
                  <li><a  href="${pageContext.request.contextPath}/admin/signin" role="button">
                    Đăng nhập admin
                  </a>
                  </li>
                </ul>
              </div>
            </nav>
          </div>

          <!-- Outer Box -->
          <div class="outer-box clearfix">

            <!-- Mobile Navigation Toggler -->
            <div class="mobile-nav-toggler">
              menu <span class="icon ion-android-menu"></span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--End Header Upper-->

    <!-- Mobile Menu  -->
    <div class="mobile-menu">
      <div class="menu-backdrop"></div>
      <div class="close-btn"><span class="icon lnr lnr-cross"></span></div>

      <nav class="menu-box">
        <div class="nav-logo">
          <a href="home.jsp"
          ><img src="../images/cover.png" alt="" title=""
          /></a>
        </div>
        <div class="menu-outer">
          <!--Here Menu Will Come Automatically Via Javascript / Same Menu as in Header-->
        </div>
      </nav>
    </div>
    <!-- End Mobile Menu -->
  </header>
  <!--End Main Header -->

  <!-- Banner Section -->
  <section class="banner-section">
    <div class="main-slider-carousel owl-carousel owl-theme">
      <div
              class="slide"
              style="background-image: url(../images/main-slider/leaderboard.png)"
      >
        <div class="p-5 text-center text-white">
          <h3>BẠN MUỐN ĐI ĐÂU?</h3>
        </div>
        <div class="auto-container">
          <!-- Content Boxed -->
          <div class="content-boxed">
            <form class="p-4  bg-light"  action="${pageContext.request.contextPath}/client/listRoute"
                  method="GET"
                  enctype="multipart/form-data">
              <div class="d-flex justify-content-around route-form">
                <!-- Destination -->
                <div class="d-flex p-3 w-75 justify-content-between">
                  <div>
                    <label>Điểm đi</label>
                    <div>
                      <i class="fab fa-xing"></i>
                      <select name="startPoint">
                        <c:forEach var="city"  items="${listCities}">
                          <option value="${city.id}">${city.name}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="">
                    <label >Điểm đến</label>
                    <div>
                      <i class="fab fa-yandex-international"></i>
                      <select  name="endPoint">
                        <c:forEach var="city"  items="${listCities}">
                          <option value="${city.id}">${city.name}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="">
                    <label class="">Ngày bắt đầu đi </label>
                    <div>
                      <input
                              class="fs-5"
                              placeholder="To"
                              type="date"
                              min="${currentDate}"
                              name="dateStart"
                              required
                      />
                    </div>
                  </div>
                </div>
                <!-- button -->
                <div class="d-flex">
                  <button
                          class="p-4 mt-2 text-center text-white bg-success"
                          type="submit"  >Tìm chuyến</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!--Scroll Dwwn Btn-->
    <div
            class="mouse-btn-down scroll-to-target"
            data-target=".experiance-section"
    >
      <div class="chevron"></div>
      <div class="chevron"></div>
      <div class="chevron"></div>
    </div>
  </section>
  <!-- End Banner Section -->

  <!-- Experiance Section -->
  <section class="experiance-section">
    <div class="auto-container">
      <div class="row clearfix">
        <!-- Title Column -->
        <div class="title-column col-lg-5 col-md-12 col-sm-12">
          <div class="inner-column">
            <div class="image">
              <img src="images/resource/team-1.jpg" alt="" />
            </div>
            <h2>
              10 năm <br />
              kinh nghiệm
            </h2>
            <div class="text">
              Đi chậm <br />
              an toàn là trên hết.
            </div>
          </div>
        </div>

        <!-- Content Column -->
        <div class="content-column col-lg-7 col-md-12 col-sm-12">
          <div class="inner-column">
            <div class="title-box">
              <h2>Xe khách</h2>
              <p>
                Giúp giảm tình trạng kẹt xe và sử dụng không gian đường hiệu
                quả hơn. Điều này đặc biệt hữu ích trong các khu vực đông
                dân cư và trên các tuyến đường đông đúc.
              </p>
              <p>
                An toàn và thoải mái: Xe khách thường được trang bị hệ thống
                an toàn như dây đai an toàn, túi khí và hệ thống phanh chống
                bó cứng. Ngoài ra, xe khách còn có thiết kế nội thất thoải
                mái với ghế ngồi rộng rãi, hệ thống điều hòa không khí và
                giải trí để tạo ra một trải nghiệm đi lại dễ chịu cho hành
                khách.
              </p>
            </div>
            <div class="specialization-box">
              <h2>Các dịch vụ của chúng tôi</h2>

              <!-- Specialise Box -->
              <div class="specialise-box">
                <div class="inner-box">
                  <div class="content">
                    <div class="icon icofont-airplane"></div>
                    <h5>
                      <a href="transport_detail.jsp"
                      >Dịch vụ đặt vé máy bay</a
                      >
                    </h5>
                    <p>
                      Tiện lợi và linh hoạt: Đặt vé máy bay trực tuyến cho
                      phép bạn thực hiện quy trình đặt vé từ bất kỳ đâu, mọi
                      lúc chỉ cần có kết nối internet.
                    </p>
                  </div>
                </div>
              </div>

              <!-- Specialise Box -->
              <div class="specialise-box">
                <div class="inner-box">
                  <div class="content">
                    <div class="icon icofont-motor-bike-alt"></div>
                    <h5>
                      <a href="transport_detail.jsp">Dịch vụ thuê xe máy</a>
                    </h5>
                    <p>
                      Tiết kiệm chi phí: Thay vì mua một chiếc xe máy mới
                      hoặc duy trì chi phí sửa chữa và bảo trì cho một chiếc
                      xe máy cá nhân, người dùng có thể thuê xe máy theo nhu
                      cầu
                    </p>
                  </div>
                </div>
              </div>

              <!-- Specialise Box -->
              <div class="specialise-box">
                <div class="inner-box">
                  <div class="content">
                    <div class="icon icofont-bus"></div>
                    <h5>
                      <a href="transport_detail.jsp"
                      >Dịch vụ thuê xe du lịch</a
                      >
                    </h5>
                    <p>
                      Tự do di chuyển: Thuê xe du lịch cho phép bạn tự do di
                      chuyển và khám phá địa điểm du lịch một cách riêng tư
                      và linh hoạt. Bạn có toàn quyền quyết định địa điểm,
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- End Experiance Section -->

  <!-- Project Section -->
  <section class="project-section">
    <!-- Project Tabs -->
    <div class="project-tab">
      <div class="auto-container">
        <div class="tab-btns-box">
          <!--Tabs Header-->
          <div class="tabs-header">
            <div class="clearfix">
              <div class="pull-left">
                <!-- Sec Title -->
                <div class="sec-title">
                  <h2>Các tuyến xe</h2>
                </div>
              </div>
              <div class="pull-left">
                <ul class="product-tab-btns clearfix">
                  <li class="p-tab-btn active-btn" data-tab="#p-tab-1">
                    tất cả
                  </li>
                  <li class="p-tab-btn" data-tab="#p-tab-2">buổi sáng</li>
                  <li class="p-tab-btn" data-tab="#p-tab-3">buổi trưa</li>
                  <li class="p-tab-btn" data-tab="#p-tab-4">buổi tối</li>
                </ul>
              </div>
              <div class="pull-right">
                <a href="transport.jsp" class="projects"
                >xem tất cả các tuyến xe
                  <span class="arrow icofont-rounded-right"></span
                  ></a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!--Tabs Content-->
      <div class="p-tabs-content">
        <!-- Portfolio Tab / Active Tab -->
        <div class="p-tab active-tab" id="p-tab-1">
          <div class="project-carousel owl-theme owl-carousel">
            <!-- Gallery Block -->
            <div class="gallery-block">
              <div class="inner-box">
                <div class="image">
                  <img src="images/gallery/1.jpg" alt="" />
                  <div class="overlay-box">
                    <div class="content">
                      <div class="category">
                        Quảng Bình - Đà Nẵng <br />
                        06:00 - 12:00
                      </div>
                      <h2>
                        <a href="transport_detail.jsp">Chieu Long</a>
                      </h2>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Gallery Block -->
            <div class="gallery-block">
              <div class="inner-box">
                <div class="image">
                  <img src="images/gallery/2.jpg" alt="" />
                  <div class="overlay-box">
                    <div class="content">
                      <div class="category">
                        Huế - Đà Nẵng <br />
                        12:00 - 17:00
                      </div>
                      <h2>
                        <a href="transport_detail.jsp">Thanh Phú</a>
                      </h2>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Gallery Block -->
            <div class="gallery-block">
              <div class="inner-box">
                <div class="image">
                  <img src="images/gallery/3.jpg" alt="" />
                  <div class="overlay-box">
                    <div class="content">
                      <div class="category">
                        Huế - Quảng Nam <br />
                        12:00 - 16:00
                      </div>

                      <h2>
                        <a href="transport_detail.jsp">Sỹ Hùng</a>
                      </h2>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Gallery Block -->
            <div class="gallery-block">
              <div class="inner-box">
                <div class="image">
                  <img src="images/gallery/4.jpg" alt="" />
                  <div class="overlay-box">
                    <div class="content">
                      <div class="category">
                        Hà Tĩnh - Đà Nẵng <br />
                        06:00 - 13:00
                      </div>

                      <h2>
                        <a href="transport_detail.jsp">Trung Tín</a>
                      </h2>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Gallery Block -->
            <div class="gallery-block">
              <div class="inner-box">
                <div class="image">
                  <img src="images/gallery/1.jpg" alt="" />
                  <div class="overlay-box">
                    <div class="content">
                      <div class="category">
                        Quảng Bình - Huế <br />
                        18:00 - 21:00
                      </div>

                      <h2>
                        <a href="transport_detail.jsp">Sỹ Hùng 2</a>
                      </h2>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Gallery Block -->
            <div class="gallery-block">
              <div class="inner-box">
                <div class="image">
                  <img src="images/gallery/2.jpg" alt="" />
                  <div class="overlay-box">
                    <div class="content">
                      <div class="category">
                        Huế - Đà Nẵng <br />
                        06:00 - 08:00
                      </div>

                      <h2>
                        <a href="transport_detail.jsp">Trung Nga</a>
                      </h2>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Gallery Block -->
            <div class="gallery-block">
              <div class="inner-box">
                <div class="image">
                  <img src="images/gallery/3.jpg" alt="" />
                  <div class="overlay-box">
                    <div class="content">
                      <div class="category">
                        Hà Tĩnh - Huế <br />
                        09:00 - 12:00
                      </div>

                      <h2>
                        <a href="transport_detail.jsp">Trung Nghĩa</a>
                      </h2>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- End Project Section -->

  <!-- Services Section -->
  <section class="services-section">
    <div class="auto-container">
      <div class="sec-title">
        <h2>Tại sao bạn nên chọn chúng tôi</h2>
      </div>
      <div class="inner-container">
        <div class="clearfix">
          <!-- Service Block -->
          <div class="service-block col-lg-3 col-md-6 col-sm-12">
            <div class="inner-box">
              <h5>
                <a href="transport_detail.jsp"
                >Chuyên Nghiệp</a
                >
              </h5>
              <p>Làm việc với một thái độ chuyên nghiệp.</p>
              <div class="icon icofont-labour"></div>
              <a href="transport_detail.jsp" class="more">xem thêm</a>
            </div>
          </div>

          <!-- Service Block -->
          <div class="service-block col-lg-3 col-md-6 col-sm-12">
            <div class="inner-box">
              <h5><a href="transport_detail.jsp">Uy tín</a></h5>
              <p>Đặt khách hàng làm thượng đế, và luôn luôn giữ chữ tín</p>
              <div class="icon icofont-fire"></div>
              <a href="transport_detail.jsp" class="more">xem thêm</a>
            </div>
          </div>

          <!-- Service Block -->
          <div class="service-block col-lg-3 col-md-6 col-sm-12">
            <div class="inner-box">
              <h5>
                <a href="transport_detail.jsp">An toàn</a>
              </h5>
              <p>Đặt an toàn là sự ưu tiên hàng đầu, đảm bảo chuyến đi an toàn  </p>
              <div class="icon icofont-safety"></div>
              <a href="transport_detail.jsp" class="more">xem thêm</a>
            </div>
          </div>

          <!-- Service Block -->
          <div class="service-block col-lg-3 col-md-6 col-sm-12">
            <div class="inner-box">
              <h5><a href="transport_detail.jsp"> Hỗ trợ 24/7</a></h5>
              <p>Luôn luôn sẵn sàng hỗ trợ khách hàng khi có vấn đề 24/7</p>
              <div class="icon icofont-live-support"></div>
              <a href="transport_detail.jsp" class="more">xem thêm</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- End Services Section -->

  <!-- Counter Section -->
  <section class="counter-section">
    <div class="auto-container">
      <div class="inner-container">
        <!-- Fact Counter -->
        <div class="fact-counter">
          <div class="row clearfix">
            <!-- Column -->
            <div class="column counter-column col-lg-4 col-md-6 col-sm-12">
              <div
                      class="inner wow fadeInLeft"
                      data-wow-delay="0ms"
                      data-wow-duration="1500ms"
              >
                <div class="content">
                  <div class="count-outer count-box">
                        <span
                                class="count-text"
                                data-speed="4500"
                                data-stop="100"
                        >0</span
                        >
                  </div>
                  <h4 class="counter-title">
                    Công ty hợp tác <br />
                  </h4>
                </div>
              </div>
            </div>

            <!-- Column -->
            <div class="column counter-column col-lg-4 col-md-6 col-sm-12">
              <div
                      class="inner wow fadeInLeft"
                      data-wow-delay="300ms"
                      data-wow-duration="1500ms"
              >
                <div class="content">
                  <div class="count-outer count-box alternate">
                        <span
                                class="count-text"
                                data-speed="3500"
                                data-stop="131"
                        >0</span
                        >
                  </div>
                  <h4 class="counter-title">
                    Nhân viên
                  </h4>
                </div>
              </div>
            </div>

            <!-- Column -->
            <div class="column counter-column col-lg-4 col-md-6 col-sm-12">
              <div
                      class="inner wow fadeInLeft"
                      data-wow-delay="600ms"
                      data-wow-duration="1500ms"
              >
                <div class="content">
                  <div class="count-outer count-box">
                        <span
                                class="count-text"
                                data-speed="3000"
                                data-stop="40"
                        >0</span
                        >
                  </div>
                  <h4 class="counter-title">
                    tuyến đường
                  </h4>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Testimonial Section -->
  <section
          class="testimonial-section"
          style="background-image: url(../images/background/pattern-1.png)"
  >
    <div class="auto-container">
      <div class="row clearfix">
        <!-- Carousel Column -->
        <div class="carousel-column col-lg-6 col-md-12 col-sm-12">
          <div class="inner-column">
            <div class="single-item-carousel owl-carousel owl-theme">
              <!-- Testimonial Block -->
              <div class="testimonial-block">
                <div class="inner-box">
                  <div class="quote-icon ion-quote"></div>
                  <h2>
                    Đây là một công ty có dịch vụ tốt nhất mà tôi đã sử dụng
                  </h2>
                  <p>
                    Tôi đã nghĩ rằng tại sao trước đó tôi đã không chọn dịch vụ của công ty này
                    <br />
                    Nó vừa tiết kiệm an toàn mà dịch vụ thì cực tốt
                  </p>
                  <div class="category">
                    <span>Chieu Longg</span> - Hydra
                  </div>
                </div>
              </div>
              <!-- Testimonial Block -->
              <div class="testimonial-block">
                <div class="inner-box">
                  <div class="quote-icon ion-quote"></div>
                  <h2>
                    Đây là một công ty có dịch vụ tốt nhất mà tôi đã sử dụng
                  </h2>
                  <p>
                    Tôi đã nghĩ rằng tại sao trước đó tôi đã không chọn dịch vụ của công ty này
                    <br />
                    Nó vừa tiết kiệm an toàn mà dịch vụ thì cực tốt
                  </p>
                  <div class="category">
                    <span>Chieu Longg</span> - Hydra
                  </div>
                </div>
              </div>
              <!-- Testimonial Block -->
              <div class="testimonial-block">
                <div class="inner-box">
                  <div class="quote-icon ion-quote"></div>
                  <h2>
                    Đây là một công ty có dịch vụ tốt nhất mà tôi đã sử dụng
                  </h2>
                  <p>
                    Tôi đã nghĩ rằng tại sao trước đó tôi đã không chọn dịch vụ của công ty này
                    <br />
                    Nó vừa tiết kiệm an toàn mà dịch vụ thì cực tốt
                  </p>
                  <div class="category">
                    <span>Chieu Longg</span> - Hydra
                  </div>
                </div>
              </div>


            </div>
          </div>
        </div>

        <!-- Image Column -->
        <div class="image-column col-lg-6 col-md-12 col-sm-12">
          <div class="inner-column">
            <div
                    class="image wow fadeInRight"
                    data-wow-delay="0ms"
                    data-wow-duration="1500ms"
            >
              <img src="images/resource/testimonial.png" alt="" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Main Footer -->
  <footer class="main-footer">
    <div class="auto-container">
      <div class="logo">
        <a href="home.jsp"><img src="images/cover.png" alt="" /></a>
      </div>
      <ul class="footer-page-nav">
        <li><a href="#">Trang chủ</a></li>
        <li><a href="#">Nhà xe</a></li>
        <li><a href="#">Về chúng tôi</a></li>
        <li><a href="#">Tuyến đường </a></li>
        <li><a href="#">Liên hệ</a></li>
        <li><a href="#">Đăng nhập</a></li>
      </ul>
      <div class="contact-info">
        161 ấp bắc, Phường Hòa Hải , Quận Ngũ Hành Sơn, thành phố Đà Nẵng <br />
        <a href="tel:+012-432-7121-20">0353346495</a> <br />
        <a href="mailto:lechieulong2016@gmail.com">lechieulong2016@gmail.com</a>
      </div>
      <ul class="footer-social-icons">
        <li>
          <a href="http://facebook.com/" class="icofont-facebook"></a>
        </li>
        <li><a href="https://twitter.com/" class="icofont-twitter"></a></li>
        <li>
          <a href="http://google.com/" class="icofont-google-plus"></a>
        </li>
        <li>
          <a href="http://linkedin.com/" class="icofont-linkedin"></a>
        </li>
        <li><a href="http://rss.com/" class="icofont-rss"></a></li>
        <li>
          <a href="http://dribbble.com/" class="icofont-dribbble"></a>
        </li>
      </ul>
      <div class="copyright">
        Copyright ©
        <script
                type="text/javascript"
                async=""
                src="https://www.google-analytics.com/analytics.js"
        ></script>
        <script type="text/javascript">
          document.write(new Date().getFullYear());
        </script>
        All rights reserved | Made with
        <i class="icon-heart text-danger" aria-hidden="true"></i> by
        <a href="https://hasthemes.com/" target="_blank">Chieu Long</a>
      </div>
    </div>
  </footer>
  <!-- End Main Footer -->
</div>
<!--End pagewrapper-->

<!-- Scroll To Top -->
<div class="scroll-to-top scroll-to-target" data-target="html">
  <span class="fa fa-arrow-circle-up"></span>
</div>

<script src="../js/jquery.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="../js/jquery.fancybox.js"></script>
<script src="../js/appear.js"></script>
<script src="../js/owl.js"></script>
<script src="../js/wow.js"></script>
<script src="../js/parallax.min.js"></script>
<script src="../js/tilt.jquery.min.js"></script>
<script src="../js/jquery.paroller.min.js"></script>
<script src="../js/jquery-ui.js"></script>
<script src="../js/script.js"></script>
</body>
</html>
