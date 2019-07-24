$(function() {
  // 配送料負担セレクトボックスが変更されたとき
  $('#product_delivery_fee_pay_id').change(function(){
    // 配送方法セレクトボックスの選択肢削除
    // 4:未定,8:クロネコヤマト,5:ゆうメール,9:ゆうパックは必ず出てくるので残す
    $("#product_delivery_way_id option[value='1']").remove();
    $("#product_delivery_way_id option[value='2']").remove();
    $("#product_delivery_way_id option[value='3']").remove();
    $("#product_delivery_way_id option[value='6']").remove();
    $("#product_delivery_way_id option[value='7']").remove();
    $("#product_delivery_way_id option[value='10']").remove();
    $("#product_delivery_way_id option[value='11']").remove();

    if ($(this).val() == 1) {
      // 値が送料込み（出品者負担）の場合
      // 選択肢設定
      $('#product_delivery_way_id').append("<option value='1'>らくらくメルカリ便</option>");
      $('#product_delivery_way_id').append("<option value='6'>レターパック</option>");
      $('#product_delivery_way_id').append("<option value='7'>普通郵便（定形・定形外）</option>");
      $('#product_delivery_way_id').append("<option value='10'>クリックポスト</option>");
      $('#product_delivery_way_id').append("<option value='11'>ゆうパケット</option>");
      // 配送方法セレクトボックスを表示
      $('.product_form__delivery_way').show();
    } else if ($(this).val() == 2) {
      // 値が着払い（購入者負担）の場合
      // 何もしない
    } else {
      // その他の場合（未選択）
      // 配送方法セレクトボックスを非表示
      $('.product_form__delivery_way').hide();
    }
  });

  // 価格が変更されたとき
  $('#product_price').on('input', function() {
    var price = $(this).val();
    $('#product_fee').text(Math.floor(price / 10));
    $('#product_profit').text(price - $('#product_fee').text());
  });
});
