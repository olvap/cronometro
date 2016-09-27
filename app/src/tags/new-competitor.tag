<new-competitor>
    <input id ='clock' name="clock" placeholder="00:00:00">
    <p id='lap'></p>
    <button onclick={start}>start</button>
    <button onclick={stop}>stop</button>
    <button onclick={lap}>lap</button>
    <button onclick={reset}>reset</button>

  <script>
    var attributes
    attributes = this

    var Tock = require('tocktimer')
    var timer = new Tock({
      callback: function () {
        attributes.clock.value = timer.msToTime(timer.lap())
      }})

    start(){
      timer.start()
    }

    stop(){
      timer.stop()
    }

    lap(){
      document.getElementById('lap').innerHTML = timer.msToTime(timer.lap())
    }

    reset(){
      timer.reset()
      attributes.clock.value = ''
      document.getElementById('lap').innerHTML = ''
    }

    function connect(options){
      var socket, host, store;

      var last_timestamp = 0
      host = options.host
      socket = new WebSocket(host);

      socket.onopen = function() {
        console.log('connected')
      }

      socket.onclose = function() {
        console.log('closed')
      }

      socket.onmessage = function(msg) {
        var clock = document.getElementById('clock')
          var time = new Date
          console.log(msg)

          if (time.getTime() - last_timestamp > 1000) {
            if (clock.value === '') {
              timer.start()
            } else {
              document.getElementById('lap').innerHTML += timer.msToTime(timer.lap()) + "</br>"
            }
            last_timestamp = time.getTime()
          }
      }
    }

    connect({host: "ws://192.168.4.1:81"})
    // connect({host: "ws://localhost:3011"})
  </script>

</new-competitor>
