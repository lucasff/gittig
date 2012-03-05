<!doctype html>
<html>
	<head>
		<meta name="layout" content="main" />
   </head>
	<body>
		<ul class="thumbnails">
			<g:each in="${hooks}" var="hook">
			<li class="span4">
				<div class="thumbnail">
					<img src="${resource(dir: 'images', file: hook + '.png')}" width="150" />
					<h5><code><g:createLink controller="hook" action="${hook}" absolute="true" /></code></h5>
				</div>
			</li>
			</g:each>
		</ul>
		
		<table class="table">
			<thead>
				<tr>
					<th>Repositories</th>
				</tr>
			</thead>
			<tbody>
				<g:if test="${repos}">
				<g:each in="${repos}" var="repo">
					<tr>
						<td>${repo}</td>
					</tr>
				</g:each>
				</g:if>
				<g:else>
					<tr>
						<td>No repositories mirrored yet</td>
					</tr>
				</g:else>
			</tbody>
		</table>
	</body>
</html>