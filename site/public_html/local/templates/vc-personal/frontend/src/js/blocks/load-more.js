window.addEventListener('DOMContentLoaded', () => {
	// js-load-more
	// js-load-more-container
	// data-url
	// data-name

	// block submit btns
	// const enableBtn = (btn) => btn.style.pointerEvents = ''
	// const disableBtn = (btn) => btn.style.pointerEvents = 'none'
	const loadMoreContent = async ({name, url}) => {
		if (!name || !url) {
			console.log('could not load content')
			console.log('name: ,', name)
			console.log('url: ,', url)
			return
		}
		window.dispatchEvent(new Event('show-preloader'))
		try {
			const response = await fetch(url)
			const data = await response.text()
			const div = document.createElement('div')
			const btn = document.querySelector('.js-load-more')
			div.innerHTML = data

			// content
			const contentContainer = document.querySelector(`[data-pages-container]`)
			const newHtml = div.querySelector(`[data-pages-container]`)
			const newBtn = div.querySelector('.js-load-more')
			contentContainer.insertAdjacentHTML('beforeend', newHtml.innerHTML)

			if (!newBtn) {
				btn.remove()
			} else {
				btn.setAttribute('data-url', newBtn.getAttribute('data-url') || '')
			}

			// button
			// const btn = div.querySelector(`.js-load-more[data-name=${name}]`)
			// const loadMoreBtn = document.querySelector(`.js-load-more[data-name=${name}]`)
			// !btn && !!loadMoreBtn && loadMoreBtn.remove()
			// !!btn && loadMoreBtn.setAttribute('data-url', btn.dataset.url)
			window.dispatchEvent(new Event('ajax-loaded'))
		} catch (e) {
			console.log(e)
		}
		window.dispatchEvent(new Event('hide-preloader'))
	}

	const init = () => {
		const loadMoreBtns = document.querySelectorAll('.js-load-more')

		loadMoreBtns.forEach(btn => {
			if (btn.dataset.init === 'true') return

			btn.setAttribute('data-init', 'true')

			btn.addEventListener('click', () => {
				const name = btn.dataset.name
				const url = btn.dataset.url
				// disableBtn(btn)
				loadMoreContent({name, url})
				// enableBtn(btn)
			})
		})
	}
	init()

	window.addEventListener('ajax-loaded', init)
})
