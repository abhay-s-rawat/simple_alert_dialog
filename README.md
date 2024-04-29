<p >
<a href="https://www.buymeacoffee.com/abhayrawat" target="_blank"><img align="center" src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="30px" width= "108px"></a>
</p>

# Simple Alert Dialog

Simplest alert dialog widget.

Liked my work ? [support me](https://www.buymeacoffee.com/abhayrawat)

## Example

for full example please view example/main.dart

```dart
SimpleAlertDialog.show(
  context,
  assetImagepath: AnimatedImage.error,
  buttonsColor: Colors.red,
  title: AlertTitleText('Are you sure ?'),
  content: AlertContentText(
    'Do you really want to delete your account ? You will not be able to undo this action.',
  ),
  onConfirmButtonPressed: (ctx) {
    Navigator.pop(ctx);
  },
);
```

## Screenshots

![](https://raw.githubusercontent.com/abhay-s-rawat/simple_alert_dialog/main/example/screenshots/Screenshot_1714396322.png)
![](https://raw.githubusercontent.com/abhay-s-rawat/simple_alert_dialog/main/example/screenshots/Screenshot_1714396382.png)
![](https://raw.githubusercontent.com/abhay-s-rawat/simple_alert_dialog/main/example/screenshots/Screenshot_1714396386.png)
![](https://raw.githubusercontent.com/abhay-s-rawat/simple_alert_dialog/main/example/screenshots/Screenshot_1714396389.png)
![](https://raw.githubusercontent.com/abhay-s-rawat/simple_alert_dialog/main/example/screenshots/Screenshot_1714396393.png)
![](https://raw.githubusercontent.com/abhay-s-rawat/simple_alert_dialog/main/example/screenshots/Screenshot_1714396396.png)
