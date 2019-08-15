$(function() {
  $('#purchase_payment').val($('#payment').text());
  $('#payment').text("¥ " + $('#payment').text());
});
