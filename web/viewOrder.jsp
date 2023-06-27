<%-- 
    Document   : viewOrder
    Created on : Oct 17, 2021, 9:26:40 PM
    Author     : Phước Hà
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <jsp:include page="components/head.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="components/header.jsp"></jsp:include>   
            <!-- Room Details Section Begin -->
            <section class="room-details-section spad">
                <div class="container mt-10 mb-10">
                    <div class="row">
                        <div class="col-sm-12">
                        <c:if test="${requestScope.CART_MSG != null}">
                            <p class="right" style="color: white">${requestScope.CART_MSG}</p>
                        </c:if>
                        <c:if test="${requestScope.CHECKDISCOUNT_MSG != null}">
                            <p class="right">${requestScope.CHECKDISCOUNT_MSG}</p>
                        </c:if>
                        <p class="right">${requestScope.VIEWORDER_MSG}</p>
                        <c:if test="${requestScope.LIST_ORDER != null}">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <th>No.</th>
                                    <th>Order Id</th>
                                    <th>UserId</th>

                                    <th>Order Date</th>
                                    <th>Total</th>
                                    <th>Status</th>
                                    <th width="110" class="ac">Action</th>
                                </tr>

                                <c:forEach var="o" items="${requestScope.LIST_ORDER}" varStatus="count">
                                    <form action="MainController">
                                        <tr>
                                            <td>${count.count}</td>
                                            <td><h3><a href="#">${o.orderId}</a></h3></td>
                                            <td>${o.userId}</td>

                                            <td>${o.orderDate}</td> 
                                            <td>${o.total} .vnđ</td>
                                            <td>${o.status}</td>

                                            <td>
                                                <a href="MainController?btnAction=viewOrderDetails&orderId=${o.orderId}" class="ico edit">Details</a>
                                                <a href="MainController?btnAction=deleteOrder&orderId=${o.orderId}" class="ico del"onclick="return confirm('Are you sure delete?')">Delete</a>

                                            </td>

                                        </tr>
                                    </form>
                                </c:forEach>
                            </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>
        <!-- Room Details Section End -->
        <jsp:include page="components/footer.jsp"></jsp:include>
    </body>
</html>