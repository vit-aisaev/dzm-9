// import SimpleBar from 'simplebar'

window.addEventListener('DOMContentLoaded', async () => {
	const TRANSITION_TIME = '0.5s'

	const activeClass = 'vc-modal--active'
	const closeBtnClass = 'vc-modal__close'
	// const containerClass = 'vc-modal__container'
	const closeModal = name => {
		const modal = document.querySelector(`.vc-modal[data-name=${name}]`)
		if (!modal) {
			console.log(`no modal: ${name}`)
			return
		}
		document.body.style.overflow = ''
		modal.classList.remove(activeClass)
		setTimeout(() => {
			if (modal.classList.contains('js-autoremove')) modal.remove()
		}, 300)
	}
	window.addEventListener('close-modal', e => {
		const {modalName} = e
		if (!modalName) {
			console.log(`no modal: ${modalName}`)
			return
		}
		closeModal(modalName)
	})

	const openModal = name => {
		const modal = document.querySelector(`.vc-modal[data-name=${name}]`)
		if (!modal) {
			console.log(`no modal: ${name}`)
			return
		}
		document.body.style.overflow = 'hidden'
		modal.classList.add(activeClass)
		modal.style.transition = TRANSITION_TIME
	}

	window.addEventListener('open-modal', e => {
		const {modalName} = e
		if (!modalName) {
			console.log(`no modal: ${modalName}`)
			return
		}
		openModal(modalName)
	})

	const handleClick = async ({target}) => {
		let timeout = null
		const modal = target.closest('.vc-modal')
		const modalName = modal?.dataset.name
		const closeBtn = document.querySelector('.vc-modal__submit-btn')
		const isRefreshBtn = closeBtn === target.closest('.vc-modal__submit-btn')
		const closeConditions =
			target.closest('.js-close-modal') || target.closest(`.${closeBtnClass}`) || modal === target
		if (closeConditions) {
			closeModal(modalName)
			return
		}
		if (isRefreshBtn) {
			window.dispatchEvent(new Event('show-preloader'))
			!!timeout && clearTimeout()
			timeout = setTimeout(() => {
				closeModal(modalName)
				window.dispatchEvent(new Event('hide-preloader'))
			}, 2000)
		}
	}

	// const simplebarOptions = {
	// 	autoHide: false,
	// }


	// js-auto-open
	const init = () => {
		const modals = document.querySelectorAll('.vc-modal')
		modals.forEach(m => {
			if (m.dataset.init === 'true') return

			m.setAttribute('data-init', 'true')
			// const container = m.querySelector(`.${containerClass}`)
			// new SimpleBar(container, simplebarOptions)
			m.addEventListener('click', e => {
				handleClick({target: e.target})
			})
			if (m.classList.contains('js-autoopen')) {
				setTimeout(() => {
					openModal(m.dataset.name)
				}, 0)
			}
		})

		// open triggers
		//
		// js-open-modal
		// data-name
		const openModalBtns = document.querySelectorAll('.js-open-modal')
		openModalBtns.forEach(btn => {
			if (btn.dataset.init === 'true') return

			btn.setAttribute('data-init', 'true')
			const modalName = btn.dataset.name
			btn.addEventListener('click', (e) => {
				e.preventDefault()
				openModal(modalName)
			})
		})
	}

	init()
	window.addEventListener('ajax-loaded', init)

	// BX.addCustomEvent('onFrameDataReceived', () => {
	// 	init()
	// })
})
