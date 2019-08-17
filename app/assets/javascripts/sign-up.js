window.addEventListener('DOMContentLoaded', function(){
  $('.show-progress__box').hide();//お届け先住所入力プログレスバー
  $('.done-progress__box').hide();//登録完了プログレスバー
  $('.hidden-field').hide();//.form-group--hidden
  $('.hidden-field').hide();
  $('.form-group-delivery').hide();//お届け先住所登録ラベル
  $('.form-group-hidden').hide();//お届け先住所登録ラベル
  $('.form-group-label--hidden').hide();//お届け先住所登録ラベル必須
  $('.button-registration').hide();//次へ進む２登録

  $('.button-next').on('click',function(){
    $('h1').text('お届け先住所入力');
    $('.show-progress__box').show();//お届け先住所入力プログレスバー
    $('.hidden-progress__box').hide();//新規会員登録プログレスバー
    $('.done-progress__box').hide();//新規会員登録プログレスバー
    $('.recaptcha').hide();//リキャプチャ
    $('.form-group__label').hide();//ラベル
    $('.form-group__label--hidden').show();//お届け先住所登録ラベル
    $('.form-group-delivery').show();//お届け先住所登録ラベルform-group__label
    $('.form-group-label__require').show();
    $('.hidden-field').show();//フィールド
    $('.sign-up-next-box').hide();
    $('.sign-up--hidden').show();
    $('.button-registration').show();//次へ進む１
  })

  $('.button-ragistration').on('click',function(){
    $('.form-group').show();//フィールド
    })
  });
