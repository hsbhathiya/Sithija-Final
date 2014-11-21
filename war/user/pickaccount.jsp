<%@ page import="org.sithija.google.drive.datastore.domain.Profile"%>
<%@ page import="java.util.List"%>
<%@ include file="../html/header.jsp" %>

<section class="content">
	<div class="col-md-4" style="margin-left: 20px;">
		<div class="box box-solid box-primary">
			<div class="box-header">
				<h1 class="box-title">Pick Your Company</h1>
			</div>
			<!-- /.box-header -->
			<div class="box-body table-responsive no-padding" style="overflow: hidden;">
				<table class="table table-hover">
					<tbody>
					<% for(Profile acc: (List<Profile>)session.getAttribute("accounts")) { %> 
						<tr>
							<td class="name"><a href="#"><% out.print(acc.getCompanyName()); %></a></td>
						</tr>
					<% } %>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>

<%@ include file="../html/footer.jsp" %>