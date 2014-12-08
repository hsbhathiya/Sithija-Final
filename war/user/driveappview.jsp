<%@ include file="/html/header.jsp" %>

<div class="row">
	<%-- <p>
		Hello, (You can <a href="<%=userService.createLogoutURL("/authentication.jsp")%>">sign
		out</a>.)
		</p>
		<p>
			User Nickname:
			<%=user.getNickname()%>
		</p>
		<p>
			User Email:
			<%=user.getEmail()%>
		</p>
		<p>
			User ID:
			<%=user.getUserId()%>
		</p>--%>
		<script type="text/javascript">
			function setSRC() {
				document.getElementById('f').src = window.location.href
					.substr(window.location.href.indexOf('=') + 1);
			}
		</script>
		<button class="btn btn-primary pull-right" data-toggle="modal" data-target="#compose-modal" style="margin-top:10px; margin-bottom:10px;margin-right:20px;">Share</button>
		<iframe id="f" frameborder=0 width="100%" height="600px"></iframe>
</div>

<%@ include file="shareview.jsp" %>
<%@ include file="/html/footer.jsp" %>