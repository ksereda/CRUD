<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>CRUD app</title>

    <style type="text/css">

        body{
            text-align: center;
        }

        /*table {*/
            /*margin-left: 15%;*/
            /*min-width: 70%;*/
            /*border: 1px solid black;*/
        /*}*/

        /*table tr{*/
            /*line-height: 30px;*/
        /*}*/

        /*table tr th {*/
            /*background: darkgrey;*/
            /*color: #FFF;*/
        /*}*/

        /*table tr td {*/
            /*border: 1px solid black;*/
            /*text-align: center;*/
        /*}*/

        .inp {
            height: 30px;
            width: 150px;
        }

        input[type=text], input[type=text], input[type=text]{
            min-width: 80%;
            background-color: lightgrey;
        }

        input[type=submit], a{
            background: lightgrey;
            padding: 5px;
            margin: 5px;
            color: black;
            font-weight: bold;
        }

        a{
            text-decoration: none;
        }

        .allbuttons {
            height: 40px;
            width: 100px;
        }



        /*table {*/
            /*font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;*/
            /*margin-left: 15%;*/
            /*min-width: 70%;*/
            /*text-align: center;*/
            /*border-collapse: collapse;*/
            /*border-spacing: 5px;*/
            /*background: #E1E3E0;*/
            /*border-radius: 20px;*/
        /*}*/
        /*th {*/
            /*font-size: 22px;*/
            /*font-weight: 300;*/
            /*padding: 12px 10px;*/
            /*border-bottom: 2px solid #F56433;*/
            /*color: #F56433;*/
        /*}*/
        /*tbody tr:nth-child(2) {*/
            /*!*border-bottom: 2px solid #F56433;*!*/
        /*}*/
        /*td {*/
            /*padding: 10px;*/
            /*color: #8D8173;*/
        /*}*/


        h1{
            font-size: 30px;
            color: #fff;
            text-transform: uppercase;
            font-weight: 300;
            text-align: center;
            margin-bottom: 15px;
        }
        table{
            width:100%;
            table-layout: fixed;
        }
        .tbl-header{
            background-color: rgba(255,255,255,0.3);
        }
        .tbl-content{
            height:300px;
            overflow-x:auto;
            margin-top: 0px;
            border: 1px solid rgba(255,255,255,0.3);
        }
        th{
            padding: 20px 15px;
            text-align: left;
            font-weight: 500;
            font-size: 16px;
            font-weight: bold;
            color: grey;
            text-align: center;
            background-color: white;
            opacity: 0.7;
            text-transform: uppercase;
        }
        td{
            padding: 15px;
            text-align: left;
            vertical-align:middle;
            font-weight: 300;
            font-size: 14px;
            color: #fff;
            text-align: center;
            border-bottom: solid 3px rgba(255,255,255,0.1);
        }


        /* demo styles */

        @import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
        body{
            background: -webkit-linear-gradient(left, #25c481, #25b7c4);
            background: linear-gradient(to right, #25c481, #25b7c4);
            font-family: 'Roboto', sans-serif;
        }
        section{
            margin: 50px;
        }


        /* follow me template */
        .made-with-love {
            margin-top: 40px;
            padding: 10px;
            clear: left;
            text-align: center;
            font-size: 10px;
            font-family: arial;
            color: #fff;
        }
        .made-with-love i {
            font-style: normal;
            color: #F50057;
            font-size: 14px;
            position: relative;
            top: 2px;
        }
        .made-with-love a {
            color: #fff;
            text-decoration: none;
        }
        .made-with-love a:hover {
            text-decoration: underline;
        }


        /* for custom scrollbar for webkit browser*/

        ::-webkit-scrollbar {
            width: 6px;
        }
        ::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        }
        ::-webkit-scrollbar-thumb {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        }


    </style>
</head>
<body>
<h1>Add User</h1>
<br>
<c:url value="/user/register" var="registerUrl" />
<form action="${registerUrl}" method="post">
    <table>
        <c:if test="${user.id ne null}">
            <tr>
                <td>USER ID:</td>
                <td><input class="inp" type="text" name="id" value="${user.id}" readonly="readonly"></td>
            </tr>
        </c:if>
        <tr>
            <td>NAME:</td>
            <td><input class="inp" type="text" name="name" value="${user.name}" required></td>
        </tr>
        <tr>
            <td>PASSWORD:</td>
            <td><input class="inp" type="text" name="password" value="${user.password}" required></td>
        </tr>
        <tr>
            <td>LOGIN:</td>
            <td><input class="inp" type="text" name="login" value="${user.login}" required></td>
        </tr>

        <c:if test="${user.id ne null}">
            <tr>
                <td colspan="2"><input type="submit" value="Update"></td>
            </tr>
        </c:if>
        <c:if test="${user.id eq null}">
            <tr>
                <td colspan="2"><input class="allbuttons" type="submit" value="Create"></td>
            </tr>
        </c:if>
    </table>
</form>
<br>
<br>
<br>
<br>
<br>
<br>
<h1>All Users</h1>
<br>
<br>
<table>
    <thead>
        <th>ID</th>
        <th>NAME</th>
        <th>PASSWORD</th>
        <th>LOGIN</th>
        <th>CHANGE ACTION</th>
    </thead>

    <c:forEach items="${customerList}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.password}</td>
            <td>${user.login}</td>

            <td>
                <form action="<c:url value="/user/update"/>" method="post">
                    <input type="hidden" name="id" value="${user.id}">
                    <input class="allbuttons" type="submit" value="Update">
                </form>
            <%--<td>--%>
                <form action="<c:url value="/user/delete"/>" method="post">
                    <input type="hidden" name="id" value="${user.id}">
                    <input class="allbuttons" style="background: indianred;" type="submit" value="Delete">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>