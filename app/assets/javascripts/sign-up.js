window.addEventListener('DOMContentLoaded', function(){
  $('.show-progress__box,.done-progress__box').hide();//プログレスバー
  $('.button-registration,.back_button,h7').hide();//「次へ」「戻る」ボタン

  //プログレスバー
  $('.btn-next').on('click',function(){
    $('h1').text('お届け先住所入力');
     $('.show-progress__box').show();//表示
     $('.hidden-progress__box,.done-progress__box').hide();//非表示
  })

  //「次へ」クリックすると表示非表示
  $('.btn-next').on('click',function(){
     $('.next,.text,h8').hide();//リキャプチャ テキスト フォーム
     $('.button-registration,.back_button,h7').show();//次へ」「戻る」ボタン
  })
});
