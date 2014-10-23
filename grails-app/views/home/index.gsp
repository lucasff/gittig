<!doctype html>
<html>
	<head>
		<meta name="layout" content="main" />
   </head>
	<body>
		<div class="row">
			<g:each in="${hooks}" var="hook">
			<div class="span4" style="text-align: center;">
				<div class="well-large">
					<figure>
						<img src="${resource(dir: 'images', file: hook + '.png')}" />
					</figure>
					<input type="text" value="<g:createLink controller="hook" action="${hook}" absolute="true" />" readonly />
				</div>
			</div>
			</g:each>
		</div>
		<sec:ifLoggedIn>
			<table class="table table-striped">
				<thead>
					<tr>
						<th><g:message code="repo.path.label" /></th>
						<th><g:message code="repo.url.label" /></th>
						<th><sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ADMINISTRATORS"><g:link controller="queue" action="enqueueAll" class="btn btn-info btn-small"><i class="icon-white icon-refresh"></i>&nbsp;<g:message code="repo.updateAll.label" /></g:link></sec:ifAnyGranted></th>
					</tr>
				</thead>
				<tbody>
					<g:if test="${repos}">
					<g:each in="${repos}" var="repo">
						<tr>
							<td>${repo.path}</td>
							<td><code>${repo.remote}</code></td>
							<td><sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ADMINISTRATORS"><g:if test="${repo.remote?.length() > 0}"><g:link controller="queue" action="enqueue" class="btn btn-small" params="[remote: repo.remote]"><i class="icon-refresh"></i>&nbsp;<g:message code="repo.update.label" /></g:link></g:if></sec:ifAnyGranted></td>
						</tr>
					</g:each>
					</g:if>
					<g:else>
						<tr>
							<td colspan="3"><g:message code="hookJob.no_repositories.label" /></td>
						</tr>
					</g:else>
					<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ADMINISTRATORS">
					<g:form controller="queue" action="enqueue">
						<tr>
							<td></td>
							<td></td>
							<td><g:textField name="remote" style="margin-bottom: 0 !important" /> <g:submitButton name="add" value="${message(code: 'repo.add.label')}" class="btn" /></td>
						</tr>
					</g:form>
					</sec:ifAnyGranted>
				</tbody>
			</table>
		</sec:ifLoggedIn>
	</body>
</html>
