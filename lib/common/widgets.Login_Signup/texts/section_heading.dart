import 'package:flutter/material.dart';
class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
     this.showActionButton = true,
    required this.title,
     this.buttonTitle = "View all",
     this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:5,bottom:5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text(title,style:Theme.of(context).textTheme.headlineSmall!.apply(color:textColor),
                maxLines:1, overflow:TextOverflow.ellipsis),
            if(showActionButton)Container(
              height:40, // Set the width to 100 pixels
              child: OutlinedButton(
                onPressed: onPressed,
                child: Text(
                  buttonTitle,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
            )
          ]
      ),
    );
  }
}
