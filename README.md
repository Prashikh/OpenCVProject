## This is my README FUCK OFF

### Approach for writing car detecting code
-  Use canny edge detector to get the edges (lines that divide the parking lot)
-  Use hough line transform to draw out all the possible lines from the canny edge detector
-  Cluster the lines to find the rows of parking available 
