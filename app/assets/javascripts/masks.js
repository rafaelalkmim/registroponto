$(document).ready(function(){
  $('.decimal-mask').inputmask({
    alias: 'decimal',
    groupSeparator: '.',
    radixPoint: ',',
    autoGroup: true,
    digits: 2,
    digitsOptional: false,
    removeMaskOnSubmit: true,
    autoUnmask: true,
    unmaskAsNumber: true,
    showMaskOnHover: false
  });

});
