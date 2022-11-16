# ConditionalFooter

In SwiftUI, it is sometimes desirable to toggle view content, e.g., based on the [editMode](https://developer.apple.com/documentation/swiftui/editmode) environment value. This sample project demonstrates two problems, including a crashing bug, when doing this with a conditional View within a Section, and for a List footer. 

One method (GoodListView) conditionally sets the string inside a Text element to be an empty string, while another (BadListView) just conditionally adds the view only when a condition is met. In the case of this example, these view states are toggled based on the EditMode status of the view.

The sample project demonstrates that setting such views conditionally results in janky animation when transitioning between the two states. However, GoodListView shows that if a Text view is still present within a Section footer, simply set with an empty string, it results in undesirable additional padding between Sections within a sectioned list.

Furthermore, if there is both a conditional view within a Section (in this repository, the AddItemRow views) _plus_ there is a conditionally displayed footer on the Section, in iOS 16.2 beta 2 toggling between these states causes an application crash from within a SwiftUI-created collection view when the conditional views are removed from the view. (This crash has been produced on an iPhone XR running iOS 16.2 beta 2. As there is no iOS 16.2 simulator available to third party developers, it is not known if the crash also occurs in the iOS simulator.)

## Steps to reproduce the issue:
1. In iOS 16.2 beta 2, launch the ConditionalFooter sample project
2. Click on Edit to enter edit mode.
3. Click on Done to exit edit mode. The app will crash.

### Alternative code example:
1. In the ContentView, comment out BadListView and uncomment AnotherBadListView.
2. Follow steps as per above. Replacing the conditional view with an EmptyView() when not present does not change the observed behavior.

### Partial fix that also has a problem:
1. In the ContentView, comment out both BadListView and AnotherBadListView.
2. Follow steps as per above. Replacing the text content of the Text in the GoodListView Section footer shows the content contionally as desired, and animates the changes to the rest of the Section smoothly. However, an issue remains that when not in edit mode there is a larger padding after the GoodListView section than there is between other sections in the content. Is there a work-around for this symptom? 

## What is expected to happen:
There is a mechanism to have conditional views within a Section, and to have a conditional footer after a Section. When toggling these views on and off on entering and existing edit mode, the animation should be smooth and the app should not crash. When the footer is not visible, it should be possible to achieve the same padding before the next Section as if there was no conditional footer set on the Section. 

## What actually happened:
As per the steps to reproduce, if there is a conditional view within a Section and also a conditional footer, the app crashes in iOS 16.2 beta 2.

Before iOS 16.2 beta 2, including in iOS 16.2 beta 1, the app would not crash but in all versions the animations are not smooth between states if these conditional views are present.

If there is a conditional footer but no conditional view within the Section, the app will not crash but the janky animation between states remains.

The work-around to set an empty string in the footer Text view, rather than removing the view, results in smooth animation but adds undesirable padding to the Section that would not be present if there is no footer at all.  
