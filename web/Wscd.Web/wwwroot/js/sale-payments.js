const paymentForm = document.querySelector('[data-sale-payments]');

if (paymentForm) {
    const entries = paymentForm.querySelector('[data-payment-entries]');
    const fields = paymentForm.querySelector('[data-payment-fields]');
    const receiveNow = paymentForm.querySelector('[data-receive-now]');
    const dueDate = paymentForm.querySelector('[data-credit-due]');
    const addButton = paymentForm.querySelector('[data-add-payment]');
    const status = paymentForm.querySelector('[data-payment-status]');
    const total = Number(paymentForm.dataset.totalCents);
    const max = Number(paymentForm.dataset.maxPayments);
    const currency = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' });

    function difference() {
        if (!receiveNow?.checked) return total;

        return [...entries.querySelectorAll('[data-payment-amount]')].reduce((remaining, input) => {
            const cents = Math.round(input.valueAsNumber * 100);
            return remaining - (Number.isSafeInteger(cents) ? cents : 0);
        }, total);
    }

    function updateStatus() {
        const remaining = difference();
        status.textContent = remaining === 0 ? 'Total conferido.' :
            `${remaining < 0 ? 'Valor excedente' : dueDate.value ? 'Saldo no crediário' : 'Falta informar'}: ${currency.format(Math.abs(remaining) / 100)}.`;
    }

    function reindexRows() {
        const rows = [...entries.querySelectorAll('[data-payment-row]')];
        rows.forEach((row, index) => {
            const reindex = value => value.replace(/Payments\[\d+\]/g, `Payments[${index}]`)
                .replace(/Payments_\d+__/g, `Payments_${index}__`);
            row.querySelectorAll('[name], [id], [for]').forEach(element => {
                for (const attribute of ['name', 'id', 'for']) {
                    if (element.hasAttribute(attribute)) {
                        element.setAttribute(attribute, reindex(element.getAttribute(attribute)));
                    }
                }
                if (element.name === '__Invariant') {
                    element.value = reindex(element.value);
                }
            });
            row.querySelector('[data-remove-payment]').hidden = rows.length === 1;
        });
        addButton.disabled = rows.length >= max;
        updateStatus();
    }

    addButton.hidden = false;
    addButton.addEventListener('click', () => {
        if (entries.children.length >= max) return;

        const remaining = difference();
        const next = entries.firstElementChild.cloneNode(true);
        next.querySelectorAll('select').forEach(select => select.value = '');
        next.querySelector('[data-payment-amount]').value = remaining > 0 ? (remaining / 100).toFixed(2) : '';
        entries.append(next);
        reindexRows();
        next.querySelector('select').focus();
    });
    entries.addEventListener('click', event => {
        const button = event.target.closest('[data-remove-payment]');
        if (!button || entries.children.length <= 1) return;

        button.closest('[data-payment-row]').remove();
        reindexRows();
        addButton.focus();
    });
    entries.addEventListener('input', updateStatus);
    dueDate.addEventListener('input', updateStatus);
    receiveNow?.addEventListener('change', () => {
        fields.hidden = fields.disabled = !receiveNow.checked;
        updateStatus();
    });
    reindexRows();
}
