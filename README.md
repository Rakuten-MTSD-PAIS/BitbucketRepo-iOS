# BitbucketRepo-iOS
A sample iOS app to display a list public repositories of Bitbucket.

### Application Flow
Start screen => List screen => Detail screen

### Requirements
- Display public repositories in tableview.
- Show the detail screen on selecting the row.
- Fetch more content on scrolling to the bottom and add to the list.

### 🌟 Implement Missing Feature:

- Pagination

### 🐞 Fix Me:
 - The detail view doesn't seem to display correct data, please fix it.
 - There are leaks in these classes, please identify and resolve them and make sure all the DEINIT get printed.
 - Resolve the constraint warning in the detail view.

### ⚙️ Write Test Codes:
 - To validate parsing the model.
 - To check if the view model fetch data properly.

### 👨🏻‍💻 Bonus:
 - Remove Storyboard and apply `Coordinator` pattern.
 - Write more test cases to cover the requirements.
 - What do you think about this ViewModel? Share your thoughts if you find improvments in that area.


### Note: Do not remove `sleep(2)` statement, it's for simulating network latency.
