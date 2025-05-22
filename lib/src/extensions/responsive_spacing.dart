part of 'package:responsive_addons/responsive_addons.dart';

// Example:
// Container(
//   padding: 2.pp, // Padding all sides based on screen width percentage
//   margin: 3.pmx, // Margin horizontal based on screen width percentage
//   child: Text('Hello, World!'),
// )

/// Based on design fixed values (using screen dimensions directly)
extension IntMarginPaddingBasedOnDesign on int {
  // Margin
  EdgeInsets get m => EdgeInsets.all(dw); // margin all sides
  EdgeInsets get mt => EdgeInsets.only(top: dh); // margin top
  EdgeInsets get mb => EdgeInsets.only(bottom: dh); // margin bottom
  EdgeInsets get ml => EdgeInsets.only(left: dw); // margin left
  EdgeInsets get mr => EdgeInsets.only(right: dw); // margin right
  EdgeInsets get mx =>
      EdgeInsets.symmetric(horizontal: dw); // margin horizontal
  EdgeInsets get my => EdgeInsets.symmetric(vertical: dh); // margin vertical

  // Padding
  EdgeInsets get p => EdgeInsets.all(dw); // padding all sides
  EdgeInsets get pt => EdgeInsets.only(top: dh); // padding top
  EdgeInsets get pb => EdgeInsets.only(bottom: dh); // padding bottom
  EdgeInsets get pl => EdgeInsets.only(left: dw); // padding left
  EdgeInsets get pr => EdgeInsets.only(right: dw); // padding right
  EdgeInsets get px =>
      EdgeInsets.symmetric(horizontal: dw); // padding horizontal
  EdgeInsets get py => EdgeInsets.symmetric(vertical: dh); // padding vertical

  // Square Box
  SizedBox get s => SizedBox(height: ph, width: pw);
}

/// ExtraP for percentage-based margins and paddings (using percentages of screen width/height)
extension ExtraP on int {
  // Margin
  EdgeInsets get pm => EdgeInsets.all(pw); // margin all sides
  EdgeInsets get pmt => EdgeInsets.only(top: ph); // margin top
  EdgeInsets get pmb => EdgeInsets.only(bottom: ph); // margin bottom
  EdgeInsets get pml => EdgeInsets.only(left: pw); // margin left
  EdgeInsets get pmr => EdgeInsets.only(right: pw); // margin right
  EdgeInsets get pmx =>
      EdgeInsets.symmetric(horizontal: pw); // margin horizontal
  EdgeInsets get pmy => EdgeInsets.symmetric(vertical: ph); // margin vertical

  // Padding
  EdgeInsets get pp => EdgeInsets.all(pw); // padding all sides
  EdgeInsets get ppt => EdgeInsets.only(top: ph); // padding top
  EdgeInsets get ppb => EdgeInsets.only(bottom: ph); // padding bottom
  EdgeInsets get ppl => EdgeInsets.only(left: pw); // padding left
  EdgeInsets get ppr => EdgeInsets.only(right: pw); // padding right
  EdgeInsets get ppx =>
      EdgeInsets.symmetric(horizontal: pw); // padding horizontal
  EdgeInsets get ppy => EdgeInsets.symmetric(vertical: ph); // padding vertical

  // Square Box
  SizedBox get ps => SizedBox(height: ph, width: pw);
}
