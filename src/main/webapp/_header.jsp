<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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