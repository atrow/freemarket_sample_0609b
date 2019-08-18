window.addEventListener('DOMContentLoaded', function(){
  $('.show-progress__box').hide();//お届け先住所入力プログレスバー
  $('.done-progress__box').hide();//登録完了プログレスバー
  $('.hidden-field').hide();//.form-group--hidden
  $('.form-group-delivery').hide();//お届け先住所登録ラベル
  $('.form-group-hidden').hide();//お届け先住所登録ラベル
  $('.form-group-label--hidden ,h7,#required,#any').hide();//ラベル
  $('#user_user_detail_attributes_prefecture_id').hide();//都道府県
  $('#user_user_detail_attributes_zip_code').hide();//郵便番号
  $('#user_user_detail_attributes_city').hide();//市区町村
  $('#user_user_detail_attributes_street').hide();//番地
  $('#user_user_detail_attributes_building_name').hide();//建物名
  $('#user_user_detail_attributes_phone').hide();//電話
  $('.form-group-label--hidden').hide();//お届け先住所登録ラベル必須
  $('.button-registration').hide();//次へ進む２登録
  $('.back_button').hide();//戻る

  $('.button-next').on('click',function(){
    $('h1').text('お届け先住所入力');
    $('.show-progress__box').show();//お届け先住所入力プログレスバー
    $('.hidden-progress__box').hide();//新規会員登録プログレスバー
    $('.done-progress__box').hide();//新規会員登録プログレスバー
    $('.recaptcha').hide();//リキャプチャ
    $('.form-group__input').hide();//ラベル
    $('.form-group__label--hidden').show();//お届け先住所登録ラベル
    $('.form-group-delivery').show();//お届け先住所登録ラベルform-group__label
    $('.form-group-label--hidden ,h7,#required,#any').show();//ラベル
    $('#user_user_detail_attributes_prefecture_id').show();
    $('#user_user_detail_attributes_zip_code').show();//郵便番号
    $('#user_user_detail_attributes_city').show();//市区町村
    $('#user_user_detail_attributes_street').show();//番地
    $('#user_user_detail_attributes_building_name').show();//建物
    $('#user_user_detail_attributes_phone').show();//電話
    $('.hidden-field').show();//フィールド
    $('.button-next').hide();
    $('.next').hide();
    $('.sign-up--hidden').show();
    $('.button-registration').show();//次へ進む１
    $('.back_button').show();//戻る
  })

  $(function(){
    $('.back_button').click(function(){
      $('.hidden-field').show();
      $('.sign-up--hidden').show();
      $('.form-group-label__require').show();
      $('.form-group-delivery').show();
      $('.form-group__label--hidden').show();
    })
  })

  $('.button-ragistration').on('click',function(){
    $('.form-group').show();//フィールド
    })
  });
