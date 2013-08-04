   //status pointer mouse nya..
   var diatasPopup = false;
   var diataslauncher = false;

   //munculkan launcher
   function muncul() {
      document.getElementById('launcher').style.visibility = "";
   }

   //hilangkan launcher kalau pointer mouse lagi engga di atas popup dan engga di atas launcher
   function ilang() {
      if (!diatasPopup && !diataslauncher) {
         document.getElementById('launcher').style.visibility = "hidden";
      }
   }

   //kalau mouse keluar dari popup/launcher
   function keluar(objek) {
      if (objek == "popup") {
         diatasPopup = false;
      }
      if (objek == "launcher") {
         diataslauncher= false;
      }
      if (!diatasPopup && !diataslauncher) {
         setTimeout("ilang()", 1000);
      }
   }

   //kalau mouse masuk dari popup/launcher
   function masuk(objek) {
      if (objek == "popup") {
         diatasPopup = true;
      }
      if (objek == "launcher") {
         diataslauncher= true;
      }
      muncul();
   }
