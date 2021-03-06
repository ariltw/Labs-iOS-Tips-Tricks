# Wrap Content in UIScrollView with Storyboard

This is a tips to create a dynamic view height inside scrollview (horizontal). 

![sample_1](https://github.com/ariltw/Labs-iOS-Tips-Tricks/blob/master/Wrap%20Content/sample_1.gif)

#### Steps

1. Add `UIScrollView` to a view controller

2. Add new constraint (*top, bottom, trailing, & leading*) to the scrollview and disable **Content Layout Guides** in the Inspectors Panel to make the scrollview fullscreen

3. Add `UIView` inside the `UIScrollView` as a scroll view content

4. Set the `UIView` aligment in `UIScrollView` container e.g **Center Horizontally in Container**

5. Set `UIView` constraint margin (*top, trailing, & leading*) to the `UIScrollView`

6. Now you can insert your content to the scroll view content.

   

#### Notes

- Don't forget to add margin constraint for each item/component inside the scroll view content `UIView`

- Inisiate every item height in the scroll view content so the scrollview won't showing the  ambiguous height error message.

<img src="https://github.com/ariltw/Labs-iOS-Tips-Tricks/blob/master/Wrap%20Content/sample_2.gif" alt="sample_2"  width="250" align="center"/>
