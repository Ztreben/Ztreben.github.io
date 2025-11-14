// Reading progress, back-to-top, TOC, reading time
(function(){
  var progressBar = document.getElementById('reading-progress');
  var backTop = document.getElementById('back-to-top');
  function onScroll(){
    var doc = document.documentElement;
    var scrollTop = doc.scrollTop || document.body.scrollTop;
    var height = doc.scrollHeight - doc.clientHeight;
    if(height>0){
      var percent = (scrollTop / height) * 100;
      progressBar.style.width = percent + '%';
    }
    if(scrollTop > 300){ backTop.classList.add('show'); } else { backTop.classList.remove('show'); }
  }
  window.addEventListener('scroll', onScroll);
  backTop && backTop.addEventListener('click', function(){ window.scrollTo({top:0, behavior:'smooth'}); });

  // Build TOC
  var entry = document.querySelector('.article-entry');
  var toc = document.getElementById('toc');
  if(entry && toc){
    var headings = entry.querySelectorAll('h1,h2,h3');
    var list = document.createElement('ul');
    headings.forEach(function(h){
      if(!h.id){ h.id = h.textContent.trim().toLowerCase().replace(/\s+/g,'-').replace(/[^a-z0-9\-]/g,''); }
      var li = document.createElement('li');
      li.className = 'toc-level-' + h.tagName.toLowerCase();
      var a = document.createElement('a');
      a.href = '#' + h.id; a.textContent = h.textContent; a.rel='nofollow';
      li.appendChild(a); list.appendChild(li);
    });
    toc.appendChild(list);
  }

  // Reading time & word count
  if(entry){
    var text = entry.innerText || '';
    var chars = text.replace(/\s+/g,'').length; // 汉字/字符数
    var words = text.trim().split(/\s+/).length; // 英文词数估算
    var minutes = Math.max(1, Math.round((chars/300) + (words/200))); // 粗略: 300中文字符/200英文词 每分钟
    var meta = document.querySelector('.article-meta');
    if(meta){
      var span = document.createElement('span');
      span.className = 'reading-info';
      span.textContent = ' · 预计阅读 ' + minutes + ' 分钟 · ' + chars + ' 字';
      meta.appendChild(span);
    }
  }
})();