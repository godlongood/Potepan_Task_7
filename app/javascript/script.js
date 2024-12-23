/* ヘッダー切り替え */
document.addEventListener("DOMContentLoaded", function() {
    const userName = document.getElementById('user-name');
    const userMenu = document.getElementById('user-menu');
  
    // ユーザー名がクリックされたとき
    userName.addEventListener('click', function() {
      // メニューの表示/非表示を切り替え
      if (userMenu.style.display === 'block') {
        userMenu.style.display = 'none';
      } else {
        userMenu.style.display = 'block';
      }
    });
  
    // ユーザー名外をクリックした場合はメニューを閉じる
    document.addEventListener('click', function(event) {
      if (!userName.contains(event.target) && !userMenu.contains(event.target)) {
        userMenu.style.display = 'none';
      }
    });
  });
  