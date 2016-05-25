<script>
function secBoard(n)
  {
      for(i=0;i<workarea.tBodies.length;i++) {
         workarea.tBodies[i].style.display="none";
      }
    workarea.tBodies[n].style.display="block";
    for(i=0;i<workarea.tBodies.length;i++){
     var obj="card"+ i;
     eval(obj+".className = 'cardoff'");
      }
    var sname="card"+ n;
    eval(sname+".className = 'cardon'");
   return;
  }
</SCRIPT>