import 'package:flutter/material.dart';

class NotificationAlert extends StatefulWidget {
  int count;
  NotificationAlert({super.key, required this.count});

  @override
  State<StatefulWidget> createState() {
    return NotificationAlertState();
  }
}

class NotificationAlertState extends State<NotificationAlert>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = Tween(begin: 0.0, end: -0.1)
      .chain(CurveTween(curve: Curves.elasticIn))
      .animate(_controller,
       );

  @override
  void didUpdateWidget(covariant NotificationAlert oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    _controller.reset();
    Future.delayed(const Duration( seconds: 2),(){
    //    _controller.forward().then((value) {
    //   _controller.reverse();
    // });
    if(widget.count>0){
       _controller.repeat(reverse: true);
    }
    
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RotationTransition(
          turns: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
        ),
        Visibility(
          visible: canShowBubble,
          child: Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(getCount(),
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ),
        )
      ],
    );
  }

  get canShowBubble {
    return false; //widget.count > 0;
  }

  String getCount() {
    if (widget.count < 1000) {
      return '${widget.count}';
    }
    return '${(widget.count / 1000).floor()}k';
  }
}
