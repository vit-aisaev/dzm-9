
const init = () => {
    const card = document.querySelector('.vc-doctors__doctor-card')
    if (!card) return

    const openCard = () => {
        card.classList.add('vc-doctors__doctor-card--open')
        card.style.pointerEvents = 'all'
    }
    const closeCard = () => {
        card.classList.remove('vc-doctors__doctor-card--open')
        card.style.pointerEvents = 'none'
    }

    const toggleBtns = document.querySelectorAll('.vc-doctors__doctor-edit')
    toggleBtns.forEach((b) => {
        b.addEventListener('click', (e) => {
            e.stopPropagation()
            openCard()
        })
    })

    card.addEventListener('click', ({ target}) => {
        const modalCard = target.closest('.vc-doctors__doctor-card')
        const closeBotBtn = card.querySelector('.vc-doctors__footer-btn--cancel')
        const closeTopBtn = card.querySelector('.vc-doctors__card-close')
        const isCloseBtn =
            (target.closest('.vc-doctors__footer-btn--cancel') === closeBotBtn) || (target.closest('.vc-doctors__card-close') === closeTopBtn)
        const closeConditions = modalCard === target || isCloseBtn
        if (closeConditions) {
            closeCard()
        }
    })

    // add and remove sec-spec
    const doctorCard = document.querySelector('.vc-doctors__card')
    if (!doctorCard) return

    const specialitiesList = doctorCard.querySelector('.vc-doctors__spec-list')
    const addSpecBtn = doctorCard.querySelector('.vc-doctors__new-spec-btn')
    const specialities = specialitiesList.querySelectorAll('.vc-doctors__spec')
    if (specialities.length !== 0) {
        specialities.forEach((spec) => {
            const removeBtn = spec.querySelector('.vc-doctors__spec-remove')
            removeBtn.addEventListener('click', () => {
                spec.remove()
            })
        })
    }

    addSpecBtn.addEventListener('click', () => {
        const currentSpec = doctorCard.querySelector('.vc-search__select[data-name=sec-spec]')
        const currentSpecId = currentSpec.dataset.id
        const currentSpecName = currentSpec.querySelector('.vc-search__select-title').textContent
        const hasSpec = specialitiesList.querySelector(`.vc-doctors__spec[data-name=${currentSpecId}]`)
        if (!!hasSpec) return
        const newSpec = document.createElement('div')
        newSpec.classList.add('vc-doctors__spec')
        newSpec.dataset.name = currentSpecId
        newSpec.innerHTML = `<div class=\"vc-doctors__spec-head\">${currentSpecName}</div>\n
            <div class=\"vc-doctors__spec-remove\">\n 
            <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"10\" height=\"10\" viewBox=\"0 0 10 10\" fill=\"none\">\n" +
                <path d=\"M9 1L1 9M9 9L1 1\" stroke=\"#0C88CA\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n" +
            </svg>\n 
            </div>`
        specialitiesList.append(newSpec)
        init()
    })
}

window.addEventListener('DOMContentLoaded', init)