document.addEventListener("DOMContentLoaded", function () {
  console.log("DOMが読み込まれました");

  const toggleButton = document.getElementById("dropdown-toggle");
  const menu = document.getElementById("dropdown-menu");

  if (toggleButton && menu) {
    console.log("ボタンとメニューが見つかりました");

    toggleButton.addEventListener("click", function (event) {
      console.log("メニューのトグルボタンがクリックされました");
      event.stopPropagation(); // クリックイベントの伝播を防ぐ
      // hiddenクラスを切り替えることでメニューの表示/非表示をトグル
      if (menu.classList.contains("hidden")) {
        menu.classList.remove("hidden");
        menu.style.display = "block";  // メニューを表示する
      } else {
        menu.classList.add("hidden");
        menu.style.display = "none";  // メニューを非表示にする
      }
    });

    // 他の部分をクリックしたらメニューを閉じる
    document.addEventListener("click", function () {
      console.log("メニュー外がクリックされました");
      menu.classList.add("hidden"); // メニューを閉じる
      menu.style.display = "none";  // メニューを非表示にする
    });

    // メニュー内をクリックしても閉じないようにする
    menu.addEventListener("click", function (event) {
      console.log("メニュー内がクリックされました");
      event.stopPropagation(); // メニュー内でのクリックイベントの伝播を防ぐ
    });
  } else {
    console.log("ボタンかメニューが見つかりませんでした");
  }
});





