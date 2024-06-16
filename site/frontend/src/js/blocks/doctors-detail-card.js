window.addEventListener('DOMContentLoaded', () => {
    const card = document.querySelector('.vc-card')
    if (!card) return
    const defaultValue = 'Выбрать'

    const thing = card.querySelector('.vc-card__thing')
    const closeBtn = card.querySelector('.vc-card__btn--close')
    const thingSelect = card.querySelector('.vc-search__select[data-name=thing]')
    const thingValue = thingSelect.querySelector('.vc-search__select-title')

    closeBtn.addEventListener('click', () => {
        thing.classList.remove('vc-card__thing--active')
        thingValue.textContent = defaultValue
    })

})