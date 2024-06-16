window.addEventListener('DOMContentLoaded', async () => {
	const tabsList = document.querySelectorAll('.vc-tabs')
	if (!tabsList && !tabsList.length) return

	const tabActiveCls = 'vc-tabs__tab--active'
	const contentActiveCls = 'vc-tabs__content--active'

	const init = (tabsSection) => {
		const tabs = tabsSection.querySelectorAll('.vc-tabs__tab')
		const contents = tabsSection.querySelectorAll('.vc-tabs__content')

		tabs.forEach(tab => {
			tab.addEventListener('click', () => {
				const name = tab.dataset.name

				tabs.forEach(t => {
					if (t === tab) {
						t.classList.add(tabActiveCls)
						return
					}
					t.classList.remove(tabActiveCls)
				})

				contents.forEach(content => {
					if (content.dataset.name === name) {
						content.classList.add(contentActiveCls)
						return
					}
					content.classList.remove(contentActiveCls)
				})
			})
		})
	}
	
	tabsList.forEach(tabsSection => {
		init(tabsSection)
	})
})
