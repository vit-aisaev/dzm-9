import Simplebar from 'simplebar'

window.addEventListener('DOMContentLoaded', async () => {
	//
	// Form
	//
	const forms = document.querySelectorAll('.js-record-form')

	const setFormError = ({ form, message }) => {
		const errorEl = form.querySelector('.vc-record-form__error')
		if (!errorEl) return

		errorEl.innerText = message
	}

	const clearFormError = ({ form }) => {
		const errorEl = form.querySelector('.vc-record-form__error')
		if (!errorEl) return

		errorEl.innerText = ''
	}

	const checkAgreement = ({ form }) => {
		const agreement = form.querySelector('.vc-record-form__agreement')
		if (!agreement) return true

		const checkbox = agreement.querySelector('.vc-record-form__checkbox')
		if (!checkbox) return true

		if (!checkbox.checked) {
			checkbox.classList.add('error')
			checkbox.addEventListener('change', () => {
				clearFormError({ form })
			})
			return false
		}
		return true

		// если 2 и более обязательных чекбокса
		// const agreements = form.querySelectorAll('.vc-record-form__agreement')
		// let isChecked = false
		// if (agreements.length === 0) return true
		//
		// agreements.forEach(aggr => {
		// 	const checkbox = aggr.querySelector('.vc-record-form__checkbox')
		// 	if (!checkbox.checked) {
		// 		checkbox.classList.add('error')
		// 		checkbox.addEventListener('change', () => {
		// 			clearFormError({ form })
		// 		})
		// 		isChecked = false
		// 	}
		// })
		// return isChecked
	}

	const initForms = () => {
		forms.forEach(form => {
			if (form.dataset.init === 'true') return

			const formId = form.id
			form.setAttribute('data-init', true)
			form.addEventListener('submit', async e => {
				e.preventDefault()
				if (!checkAgreement({ form })) {
					setFormError({
						form: form,
						message: 'Необходимо согласиться с политикой конфиденциальности',
					})
					return
				}

				const formData = new FormData(form)
				const submitBtn = form.querySelector('[type=submit]')
				const submitName = submitBtn.getAttribute('name')
				const submitValue = submitBtn.getAttribute('value')
				if (!!submitName && !!submitValue) {
					formData.set(submitName, submitValue)
				}
				const response = await fetch(form.action, {
					method: 'POST',
					body: formData,
				})
				const data = await response.text()
				const div = document.createElement('div')
				div.innerHTML = data
				const newForm = div.querySelector(`#${formId}`)
				form.innerHTML = newForm.innerHTML
				console.log(div.querySelector(`#${formId}`))
				window.dispatchEvent(new Event('ajax-loaded'))
			})
		})
	}
	initForms()

	window.addEventListener('ajax-loaded', initForms)

	//
	// Selects
	//
	const initSelects = async () => {
		const selects = document.querySelectorAll('.vc-record-form__select')
		const selectOpenCls = 'vc-record-form__select--open'
		const selectAnimatingCls = 'vc-record-form__select--animating'
		const selectTopCls = 'vc-record-form__select--on-top'

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

		const selectItem = ({select, item}) => {
			const id = item.dataset.id
			const input = select.querySelector('.vc-record-form__select-input')
			const title = select.querySelector('.vc-record-form__select-title')

			const otherVacancy = item
				.closest('.js-record-form')
				.querySelector('[data-other-vacancy]')

			if (!!input) {
				input.value = id
			}
			if (!!title) {
				title.textContent = item.textContent.trim()
			}
			if (!!otherVacancy) {
				otherVacancy.style.display = item.dataset.hasOwnProperty(
					'showOtherVacancy',
				)
					? 'block'
					: 'none'
			}

			select.classList.add('vc-record-form__select--selected')
			closeSelect(select)
		}

		const init = select => {
			if (select.dataset.init === 'true') return

			select.setAttribute('data-init', 'true')

			const list = select.querySelector('.vc-record-form__select-list')
			// console.log(list, select)

			if (!!list) {
				new Simplebar(list, {
					autoHide: false,
				})
			}

			select.addEventListener('click', e => {
				e.preventDefault()
				const { target } = e
				const item = target.closest('.vc-record-form__select-item')
				const currentSelect = target.closest('.vc-record-form__select')
				if (!!item) {
					selectItem({ select: currentSelect, item })
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
				if (target.closest('.vc-record-form__select')) return
				selects.forEach(select => {
					closeSelect(select)
				})
			})
		}

		selects.forEach(select => {
			init(select)
		})

		// dynamic set select value
		const setSelectBtns = document.querySelectorAll('.js-set-select')
		setSelectBtns.forEach(btn => {
			btn.addEventListener('click', () => {
				const { selectName, selectValueId } = btn.dataset
				selects.forEach(select => {
					const name = select.dataset.name
					if (name !== selectName) return

					const items = select.querySelectorAll('.vc-record-form__select-item')
					const item = [...items].find(item => {
						return item.dataset.id === selectValueId
					})
					!!item && selectItem({ select, item })
				})
			})
		})

		//
		// Errors
		//
		const clearError = el => {
			el.classList.remove('error')
		}

		const inputs = document.querySelectorAll('.vc-record-form__input')
		const textareas = document.querySelectorAll('.vc-record-form__textarea')
		const dateTimes = document.querySelectorAll('.vc-record-form__datetime')
		const checkboxes = document.querySelectorAll('.vc-record-form__checkbox')
		;[...inputs, ...dateTimes, ...selects, ...checkboxes, ...textareas].forEach(
			el => {
				el.addEventListener('focus', () => {
					clearError(el)
				})
			},
		)
	}
	initSelects()
	window.addEventListener('ajax-loaded', initSelects)

	// stars
	const initStars = () => {
		const scores = document.querySelectorAll('.vc-record-form__score')
		const starActiveCls = 'vc-record-form__star--active'

		scores.forEach(score => {
			if (score.dataset.init === 'true') return

			score.setAttribute('data-init', 'true')
			const stars = score.querySelectorAll('.vc-record-form__star-input')
			stars.forEach(star => {
				star.addEventListener('change', () => {
					stars.forEach(s => {
						const starLabel = s.closest('.vc-record-form__star')
						if (s.checked) {
							starLabel.classList.add(starActiveCls)
							return
						}
						starLabel.classList.remove(starActiveCls)
					})
				})
			})
		})
	}
	initStars()
	window.addEventListener('ajax-loaded', initStars)

	// files
	const getFileLabelTemplate = fileName => {
		const fileNameSplitted = fileName.split('.')
		const extention = fileNameSplitted.pop()
		const fileNameWhthoutExtention = fileNameSplitted.join('.')
		let shortenFileName = fileNameWhthoutExtention
		if (fileNameWhthoutExtention.length > 8) {
			shortenFileName = shortenFileName.substring(0, 8) + '..'
		}
		const name = [shortenFileName, extention].join('.')
		return name
		// return `
		// 	<div class="vc-record-form__file-item">
		// 		<div class="vc-record-form__file-name">
		// 			${name}
		// 		</div>
		// 	</div>
		// `
	}

	const initFiles = () => {
		const filesElements = document.querySelectorAll('.vc-record-form__file')
		filesElements.forEach(fileElement => {
			const fileInput = fileElement.querySelector('input')
			// const fileListElement = fileElement.querySelector('.vc-record-form__file-list')
			const fileListElement = fileElement.querySelector(
				'.vc-record-form__file-placeholder',
			)

			fileInput.addEventListener('change', () => {
				const { files } = fileInput
				if (!fileListElement) {
					return
				}

				fileListElement.innerHTML = [...files]
					.map(file => {
						const { name } = file
						return getFileLabelTemplate(name)
					})
					.join(' ')
			})
		})
	}

	initFiles()
	window.addEventListener('ajax-loaded', initFiles)
})


// window.addEventListener('DOMContentLoaded', async () => {
// 	//
// 	// Form
// 	//
// 	const forms = document.querySelectorAll('.js-record-form')
//
// 	const setFormError = ({form, message}) => {
// 		const errorEl = form.querySelector('.vc-record-form__error')
// 		if (!errorEl) return
//
// 		errorEl.innerText = message
// 	}
//
// 	const clearFormError = ({form}) => {
// 		const errorEl = form.querySelector('.vc-record-form__error')
// 		if (!errorEl) return
//
// 		errorEl.innerText = ''
// 	}
//
// 	const checkAgreement = ({form}) => {
// 		const agreement = form.querySelector('.vc-record-form__agreement')
// 		if (!agreement) return true
//
// 		const checkbox = agreement.querySelector('.vc-record-form__checkbox')
// 		if (!checkbox) return true
//
// 		if (!checkbox.checked) {
// 			checkbox.classList.add('error')
// 			checkbox.addEventListener('change', () => {
// 				clearFormError({form})
// 			})
// 			return false
// 		}
// 		return true
// 	}
//
// 	const initForms = () => {
// 		forms.forEach(form => {
// 			if (form.dataset.init === 'true') return
//
// 			const formId = form.id
// 			form.setAttribute('data-init', true)
// 			form.addEventListener('submit', async e => {
// 				e.preventDefault()
// 				if (!checkAgreement({form})) {
// 					setFormError({
// 						form: form,
// 						message: 'Необходимо согласиться с политикой конфиденциальности',
// 					})
// 					return
// 				}
//
// 				const formData = new FormData(form)
// 				const submitBtn = form.querySelector('[type=submit]')
// 				const submitName = submitBtn.getAttribute('name')
// 				const submitValue = submitBtn.getAttribute('value')
// 				if (!!submitName && !!submitValue) {
// 					formData.set(submitName, submitValue)
// 				}
// 				const response = await fetch(form.action, {
// 					method: 'POST',
// 					body: formData,
// 				})
// 				const data = await response.text()
// 				const div = document.createElement('div')
// 				div.innerHTML = data
// 				const newForm = div.querySelector(`#${formId}`)
// 				form.innerHTML = newForm.innerHTML
// 				window.dispatchEvent(new Event('ajax-loaded'))
// 			})
// 		})
// 	}
// 	initForms()
//
// 	window.addEventListener('ajax-loaded', initForms)
//
// 	//
// 	// Selects
// 	//
// 	const initSelects = async () => {
// 		const selects = document.querySelectorAll('.vc-record-form__select')
// 		const selectOpenCls = 'vc-record-form__select--open'
// 		const selectAnimatingCls = 'vc-record-form__select--animating'
// 		const selectTopCls = 'vc-record-form__select--on-top'
//
// 		const openSelect = select => {
// 			select.classList.add(selectAnimatingCls)
// 			select.classList.add(selectOpenCls)
// 			select.ontransitionend = () => {
// 				select.classList.remove(selectAnimatingCls)
// 				select.classList.remove(selectTopCls)
// 				select.ontransitionend = null
// 			}
// 		}
//
// 		const closeSelect = select => {
// 			if (!select.classList.contains(selectOpenCls)) return
//
// 			select.classList.add(selectAnimatingCls)
// 			select.classList.remove(selectOpenCls)
// 			select.ontransitionend = () => {
// 				select.classList.remove(selectAnimatingCls)
// 				select.classList.remove(selectTopCls)
// 				select.ontransitionend = null
// 			}
// 		}
//
// 		const toggleSelect = select => {
// 			const isOpen = select.classList.contains(selectOpenCls)
// 			if (!isOpen) {
// 				openSelect(select)
// 				return
// 			}
// 			closeSelect(select)
// 		}
//
// 		const init = select => {
// 			if (select.dataset.init === 'true') return
//
// 			select.setAttribute('data-init', 'true')
//
// 			const list = select.querySelector('.vc-record-form__select-list')
// 			if (!!list) {
// 				new Simplebar(list, {
// 					autoHide: false,
// 				})
// 			}
//
// 			select.addEventListener('click', e => {
// 				e.preventDefault()
// 				const {target} = e
// 				const item = target.closest('.vc-record-form__select-item')
// 				const currentSelect = target.closest('.vc-record-form__select')
//
// 				console.log(target.closest('.vc-record-form__select-item'))
//
// 				if (!!item) {
// 					const id = item.dataset.id
// 					const input = select.querySelector('.vc-record-form__select-input')
// 					const title = select.querySelector('.vc-record-form__select-title')
//
// 					if (!!input) {
// 						input.value = id
// 					}
// 					if (!!title) {
// 						title.innerText = item.innerText
// 					}
//
// 					select.classList.add('vc-record-form__select--selected')
// 					closeSelect(select)
// 					return
// 				}
//
// 				if (currentSelect) {
// 					currentSelect.classList.add(selectTopCls)
// 					selects.forEach(s => {
// 						if (s === currentSelect) {
// 							toggleSelect(s)
// 							return
// 						}
// 						closeSelect(s)
// 					})
// 				}
// 			})
//
// 			document.body.addEventListener('click', ({target}) => {
// 				if (target.closest('.vc-record-form__select')) return
//
// 				selects.forEach(select => {
// 					closeSelect(select)
// 				})
// 			})
// 		}
//
// 		selects.forEach(select => {
// 			init(select)
// 		})
//
// 		// dynamic set select value
// 		const setSelectBtns = document.querySelectorAll('.js-set-select')
// 		setSelectBtns.forEach(btn => {
// 			btn.addEventListener('click', () => {
// 				const {selectName, selectValueId} = btn.dataset
// 				selects.forEach(select => {
// 					const name = select.dataset.name
// 					if (name !== selectName) return
//
// 					const items = select.querySelectorAll('.vc-record-form__select-item')
// 					const item = [...items].find(item => {
// 						return item.dataset.id === selectValueId
// 					})
// 					!!item && item.click()
// 				})
// 			})
// 		})
//
// 		//
// 		// Errors
// 		//
// 		const clearError = el => {
// 			el.classList.remove('error')
// 		}
//
// 		const inputs = document.querySelectorAll('.vc-record-form__input')
// 		const textareas = document.querySelectorAll('.vc-record-form__textarea')
// 		const dateTimes = document.querySelectorAll('.vc-record-form__datetime')
// 		const checkboxes = document.querySelectorAll('.vc-record-form__checkbox')
// 		;[...inputs, ...dateTimes, ...selects, ...checkboxes, ...textareas].forEach(el => {
// 			el.addEventListener('click', () => {
// 				clearError(el)
// 			})
// 		})
// 	}
// 	initSelects()
// 	window.addEventListener('ajax-loaded', initSelects)
//
// 	// stars
// 	const initStars = () => {
// 		const scores = document.querySelectorAll('.vc-record-form__score')
// 		const starActiveCls = 'vc-record-form__star--active'
//
// 		scores.forEach(score => {
// 			if (score.dataset.init === 'true') return
//
// 			score.setAttribute('data-init', 'true')
// 			const stars = score.querySelectorAll('.vc-record-form__star-input')
// 			stars.forEach(star => {
// 				star.addEventListener('change', () => {
// 					stars.forEach(s => {
// 						const starLabel = s.closest('.vc-record-form__star')
// 						if (s.checked) {
// 							starLabel.classList.add(starActiveCls)
// 							return
// 						}
// 						starLabel.classList.remove(starActiveCls)
// 					})
// 				})
// 			})
// 		})
// 	}
// 	initStars()
// 	window.addEventListener('ajax-loaded', initStars)
//
// 	// files
// 	const getFileLabelTemplate = (fileName) => {
// 		const fileNameSplitted = fileName.split('.')
// 		const extention = fileNameSplitted.pop()
// 		const fileNameWhthoutExtention = fileNameSplitted.join('.')
// 		let shortenFileName = fileNameWhthoutExtention
// 		if (fileNameWhthoutExtention.length > 7) {
// 			shortenFileName = shortenFileName.substring(0, 7) + '...'
// 		}
// 		const name = [shortenFileName, extention].join('.')
// 		return `
// 			<div class="vc-record-form__file-item">
// 				<div class="vc-record-form__file-name">
// 					${name}
// 				</div>
// 			</div>
// 		`
// 	}
//
// 	const initFiles = () => {
// 		const filesElements = document.querySelectorAll('.vc-record-form__file')
// 		filesElements.forEach(fileElement => {
// 			const fileInput = fileElement.querySelector('input')
// 			const fileListElement = fileElement.querySelector('.vc-record-form__file-list')
//
// 			fileInput.addEventListener('change', () => {
// 				const { files } = fileInput
// 				if (!fileListElement) {
// 					return
// 				}
//
// 				fileListElement.innerHTML = [...files].map(file => {
// 					const { name } = file
// 					return getFileLabelTemplate(name)
// 				}).join(' ')
// 			})
// 		})
// 	}
//
// 	initFiles()
// 	window.addEventListener('ajax-loaded', initFiles)
// })
