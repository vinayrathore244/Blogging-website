<!--
***********************************DONE********************************
-->
<%@page import="com.upgrad.blog.exceptions.PostNotFoundException"%>
<%@ page import="com.upgrad.blog.dao.DAOFactory" %>
<%@ page import="com.upgrad.blog.dto.PostDTO" %>
<%@ page import="com.upgrad.blog.util.DateTimeFormatter" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*If user tries to click on browser bac k button then he/ she should not be able to access this page*/
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    
    /*
	* TODO: 7.2. Check if user is logged in or not. if not then redirect user to default page i.e index.jsp.
	* (Hint: You need to handle NullPointerException.)
	* (Hint: Make use of the email id stored in the session object to check if user is logged in or not.)
    */
    try {
        /* If user is not logged in then redirect him to default page i.e index.jsp*/
        if (session.getAttribute("emailId").equals(null)) {
            response.sendRedirect(request.getContextPath());
        }
    } catch (NullPointerException e) {
        response.sendRedirect(request.getContextPath());
    }
%>
<html>
<head>
    <title>Search Post</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>
<header class="header">

	<!--
		TODO: 7.3. If user is logged in then display the string before @ in the user's email id
		on this web page. For example, if email id is example@gmail.com, then display "Logged In as example"
		in the top right corner of the web page. 
	-->
    <%--    Showing text before @ in email as username--%>
    Logged In as <%
    try {
        out.print(session.getAttribute("emailId").toString().split("@")[0]);
    } catch (NullPointerException e) {
    }
%>
</header>
<div id="form_wrapper">
    <form id="search_form" method="post">
        <div id="email_div">
            <label for="emailId">User Email</label>
            <input type="email" placeholder="example@email.com" required="required" name="emailId" id="emailId"/>
        </div>
        <button type="submit">Search</button>
        <a class="not-block" href="../Home.jsp">Home Page</a>
        <div class="" error>
<!--
* TODO: 7.4. Complete the Java code that fetches the list of posts from the database corresponding to the queried
* email id. If no posts exists corresponding to the queried email id, you should throw PostNotFoundException with
* "Sorry no posts exists for this email id" message. This message will be printed in the catch block.
* 
* Implement one missing line of code that should fetch the list of posts corresponding to the queried email id
* and stores them into the postDTOS list. If no posts exists corresponding to the queried email id, please throw
* the desired exception with given message.
-->
            <%
                List<PostDTO> postDTOS = null;
                if (request.getMethod().equals("POST")) {

				try {
/*
* Add the missing line of code here
*/
                    postDTOS = new DAOFactory().getPostCRUDS().findByEmail(request.getParameter("emailId"));
                    if (postDTOS.size() < 1) {
                    	throw new PostNotFoundException("Sorry no posts exists for this email id");
                    }
				} catch (PostNotFoundException e) {
                    %>
            <div class="error"><%=e.getMessage()%>
            </div>
            <%
                } }
            %>
        </div>
    </form>
</div>
<div class="post-list-wrapper">
<!--
	TODO: 7.5. Complete the Java code that prints the list of all posts that was fetched from the database
	corresponding to the queried email id.
-->
    <%
        if (request.getMethod().equals("POST")) {
            for (int i = 0; i < postDTOS.size(); i++) { %>
    <div class="post-list">
<!-- 
	Insert your code here.
-->
        <div>Post Id: <%=postDTOS.get(i).getPostId()%>
        </div>
        <div>Email Id: <%=postDTOS.get(i).getEmailId()%>
        </div>
        <div>Title: <%=postDTOS.get(i).getTitle()%>
        </div>
        <div>Tag: <%=postDTOS.get(i).getTag()%>
        </div>
        <div>Description: <%=postDTOS.get(i).getDescription()%>
        </div>
        <div>Time: <%=DateTimeFormatter.format((postDTOS.get(i).getTimestamp()))%>
        </div>
    </div>
    <%
        } }
    %>


</div>


</body>
</html>