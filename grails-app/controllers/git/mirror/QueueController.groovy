package git.mirror

import grails.plugins.springsecurity.Secured

class QueueController {

	def hookJobService
	
	def hookJobExecutor
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def index() {
		[jobs: HookJob.list(params)]
	}

	def status() {
//		hookJobExecutor
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def enqueue(RepoCommand cmd) {
		// TODO: keep service name? use service name as remote name?
		hookJobService.enqueue(cmd.remote, cmd.path, 'undefined')
		redirect action: 'index'
	}
	
}
