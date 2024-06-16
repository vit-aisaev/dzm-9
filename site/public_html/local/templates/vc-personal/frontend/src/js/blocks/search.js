import Simplebar from 'simplebar'

window.addEventListener('DOMContentLoaded', async () => {

	// doctors filters
	const doctors = document.querySelector('.vc-doctors')

	if (!!doctors) {
		const doctorsForm = doctors.querySelector('.vc-doctors__filters')
		const onSubmit = async (e) => {
			e.preventDefault()
			const doctorsList = document.querySelector('.vc-doctors__list')
			const doctorsForm = doctors.querySelector('.vc-doctors__filters')

			window.dispatchEvent(new Event('show-preloader'))
			const action = doctorsForm.getAttribute('action')
			const method = doctorsForm.getAttribute('method')

			const formData = new FormData(doctorsForm)
			const queryString = new URLSearchParams(formData).toString()

			try {
				const submitBtn = nearestForm.querySelector('[type=submit]')
				const submitName = submitBtn.getAttribute('name')
				const submitValue = submitBtn.getAttribute('value')
				if (!!submitName && !!submitValue) {
					formData.set(submitName, submitValue)
				}
			} catch (e) { }

			const response = await fetch(`${action}?${queryString}`, {
				method,
			})
			const text = await response.text()

			const div = document.createElement('div')
			div.innerHTML = text

			const newDoctors = div.querySelector('.vc-doctors__list')

			// replace formElements instead of form
			const newForm = div.querySelector('.vc-doctors__filters')
			const newFormElements = Array.from(newForm.children)
			const formElements = Array.from(doctorsForm.children)
			formElements.forEach((el) => {
				const index = formElements.indexOf(el)
				const newEl = newFormElements[index]
				!!newEl && el.replaceWith(newEl)
			})

			try {
				const confirmationEl = newDoctors.querySelector('#record-to-confirmation')
				if (!!confirmationEl && !!confirmationEl.dataset.link) {
					window.location.assign(confirmationEl.dataset.link)
					return
				}
			} catch(e) {
				console.log(e)
			}

			doctorsList.replaceWith(newDoctors)

			window.dispatchEvent(new Event('ajax-loaded'))
			window.dispatchEvent(new Event('hide-preloader'))
		}

		!!doctorsForm && doctorsForm.addEventListener('submit', onSubmit)
	}
	// TODO
	// Automatic record submit on search
	const initSearch = async () => {
		let timeout = null

		const search = document.querySelector('.vc-search')
		if (!search) return

		if (search.dataset.init === 'true') return

		const searchInput = search.querySelector('.vc-search__input')

		// datetime filter
		const dateTime = search.querySelector('.vc-search__datetime')

		!!dateTime && dateTime.addEventListener('click', (e) => {
			e.preventDefault()
			const dateTimeInput = dateTime.querySelector('.vc-search__datetime-input')
			const record = dateTime.closest('.vc-record')

			dateTimeInput.addEventListener('change', () => {
				!!record && record.requestSubmit()
			})

			const days = document.querySelector('.dayContainer')
			days.querySelectorAll('.flatpickr-day').forEach(day => {
				day.addEventListener('click', () => {
					const id = day.innerText
					dateTimeInput.value = id
				})
			})
		})

		const onInput = ({ target }) => {
			!!timeout && clearTimeout(timeout)
			timeout = setTimeout(() => {
				try {
					const doctors = target.closest('.vc-doctors')
					const doctorsForm = doctors.querySelector('.vc-doctors__filters')
					if (!!doctors) {
						doctorsForm.requestSubmit()
					}
				} catch(e) {}
			}, 500)
		}

		!!searchInput && searchInput.focus()
		if (!!searchInput.value) {
			searchInput.selectionStart = searchInput.selectionEnd = searchInput.value.length
		}
		if (searchInput) {
			searchInput.addEventListener('input', onInput)
		}
		!!searchInput && searchInput.addEventListener('input', onInput)

		search.setAttribute('data-init', 'true')
	}
	initSearch()

	window.addEventListener('ajax-loaded', initSearch)

	//
	// Selects
	//
	const initSelects = async () => {
		const selects = document.querySelectorAll('.vc-search__select')
		const selectOpenCls = 'vc-search__select--open'
		const selectAnimatingCls = 'vc-search__select--animating'
		const selectTopCls = 'vc-search__select--on-top'

		const openSelect = select => {
			select.classList.add(selectAnimatingCls)
			select.classList.add(selectOpenCls)
			select.ontransitionend = () => {
				select.classList.remove(selectAnimatingCls)
				select.classList.remove(selectTopCls)
				select.ontransitionend = null
			}
		}

		const closeSelect = select => {
			if (!select.classList.contains(selectOpenCls)) return

			select.classList.add(selectAnimatingCls)
			select.classList.remove(selectOpenCls)
			select.ontransitionend = () => {
				select.classList.remove(selectAnimatingCls)
				select.classList.remove(selectTopCls)
				select.ontransitionend = null
			}
		}

		const toggleSelect = select => {
			const isOpen = select.classList.contains(selectOpenCls)
			if (!isOpen) {
				openSelect(select)
				return
			}
			closeSelect(select)
		}

		const init = select => {
			if (select.dataset.init === 'true') return

			select.setAttribute('data-init', 'true')

			const list = select.querySelector('.vc-search__select-list')
			if (!!list) {
				new Simplebar(list, {
					// autoHide: false,
				})
			}

			select.addEventListener('click', (e) => {
				e.preventDefault()
				const { target } = e
				const item = target.closest('.vc-search__select-item')
				const currentSelect = target.closest('.vc-search__select')

				if (!!item) {
					const id = item.dataset.id
					const input = select.querySelector('.vc-search__select-input')
					const title = select.querySelector('.vc-search__select-title')

					if (!!input) {
						input.value = id
						input.dispatchEvent(new Event('change'))
					}
					if (!!title) {
						title.innerText = item.innerText
					}
					try {
						const doctorDetailCard = target.closest('.vc-card__thing')
						const doctors = target.closest('.vc-doctors')
						if (!!doctorDetailCard) {
							doctorDetailCard.classList.add('vc-card__thing--active')
						}
						if (!!doctors) {
							const doctorsForm = doctors.querySelector('.vc-doctors__filters')
							doctorsForm.requestSubmit()
						}
					} catch(e) {
						console.log(e)
					}
					select.classList.add('vc-search__select--selected')
					select.dataset.id = id
					closeSelect(select)
					return
				}

				if (currentSelect) {
					currentSelect.classList.add(selectTopCls)
					selects.forEach(s => {
						if (s === currentSelect) {
							toggleSelect(s)
							return
						}
						closeSelect(s)
					})
				}
			})

			document.body.addEventListener('click', ({ target }) => {
				if (target.closest('.vc-search__select')) return

				selects.forEach(select => {
					closeSelect(select)
				})
			})
		}
		selects.forEach(select => {
			init(select)
		})

		// dynamic set select value
		// const setSelectBtns = document.querySelectorAll('.js-set-select')
		// setSelectBtns.forEach(btn => {
		// 	btn.addEventListener('click', () => {
		// 		const {selectName, selectValueId} = btn.dataset
		// 		selects.forEach(select => {
		// 			const name = select.dataset.name
		// 			if (name !== selectName) return
		//
		// 			const items = select.querySelectorAll('.vc-search__select-item')
		// 			const item = [...items].find(item => {
		// 				return item.dataset.id === selectValueId
		// 			})
		// 			!!item && item.click()
		// 		})
		// 	})
		// })

		//
		// TODO
		//
		// modal open event handler
		// for setting up select params
		//
		window.addEventListener('open-modal', e => {
			console.log(e)
		})
		//
		// TODO
		//
		// modal close event handler
		// for re-setting select params
		//
		window.addEventListener('open-modal', e => {
			console.log(e)
		})

		//
		// Errors
		//
		const clearError = el => {
			el.classList.remove('error')
		}

		const inputs = document.querySelectorAll('.vc-search__input')
		// const selects = document.querySelectorAll('.vc-search__select')
		const checkboxes = document.querySelectorAll('.vc-search__checkbox')
		;[...inputs, ...selects, ...checkboxes].forEach(el => {
			el.addEventListener('focus', () => {
				clearError(el)
			})
		})
	}

	initSelects()

	window.addEventListener('ajax-loaded', initSelects)

})
