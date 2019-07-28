
window.addEventListener('DOMContentLoaded', function(){
  //エラーのため追記https://pisuke-code.com/jquery-is-not-defined-solution///

   $('.show-progress__box').hide();//お届け先住所入力プログレスバー
   $('.done-progress__box').hide();//登録完了プログレスバー
   $('.hidden-field').hide();
   $('.sign-up--hidden').hide();
   $('.form-group__label--hidden').hide();//お届け先住所登録ラベル
   $('.sign-up-submit-box').hide();//次へ進む２登録

 $('.button-next').on('click',function(){

        $('h1').text('お届け先住所入力');
        $('.show-progress__box').show();//お届け先住所入力プログレスバー
        $('.hidden-progress__box').hide();//新規会員登録プログレスバー
        $('.done-progress__box').hide();//新規会員登録プログレスバー
        $('.form-group').hide();//フィールド
        $('.recaptcha').hide();//フィールド
        $('.label-text').hide();//フィールド
        $('.form-group__label--hidden').show();//お届け先住所登録ラベル
        $('.hidden-field').show();//フィールド
        $('.sign-up-next-box').hide();
        $('.sign-up--hidden').show();
        $('.sign-up-submit-box').show();//次へ進む１
    })
  });
