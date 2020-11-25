import tippy from 'tippy.js';

const initTippy = () => {
  document.querySelectorAll('[data-tippy]').forEach((element) => {
    const placement = element.dataset.placement || 'top';
    tippy(element, {
      content: element.dataset.tippy,
      theme: 'light-border',
      placement
    });
  })
};

export {initTippy}
