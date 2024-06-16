export const templatePath = '/local/templates/vc-site'

export const getGETParams = (string = null) => {
	if (!string) string = window.location.search
	let queryDict = {}
	string
		.substr(1)
		.split('&')
		.forEach(function (item) {
			queryDict[item.split('=')[0]] = item.split('=')[1]
		})
	return queryDict
}

export const get = formData => {
	return new Promise((resolve, reject) => {
		fetch('/api/', {
			method: 'POST',
			body: formData,
		})
			.then(r => r.json())
			.then(r => {
				if (!!r.response) {
					resolve(r.response)
				}
				if (!!r.error) {
					reject(r.error)
				}
			})
	})
}
