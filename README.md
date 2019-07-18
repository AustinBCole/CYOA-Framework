# **CYOA-Framework**
A framework for Choose Your Own Adventure games.

## **Trello Set Up:**

1. Set up Trello board
2. Populate To Do list with MVP features
3. Put extra features in the backlog list
4. Add Trello URL to this README.md file


## **MVP Features:**

### **Build The App:**

The main entry point of the application should house the visualization of the story. Include necessary components such as:

1. View to display story text, which is read from text file
2. Table view to display an arbitrary number of potential choices
  - When no choices are available, or when there is only one possible scene, display a button that says "Next"
3. A player object that should have at minimum:
  - A strength property
  - An agility property
  - An ancient languages property
  - A name property
  - An infamy property
  - Methods to set and get object properties
4. A stat object that should have at minimum:
  - A name property
  - A value property
  - Methods to set and get value property
5. A scene object that should have at minimum:
  - A fileName property
  - A unique ID property
  - Methods to read from and write to file
6. An appropriate data structure to hold the data about scenes and relationships to other scenes
7. An appropriate data structure to hold data about scenes and their respective stat requirements
8. A seperate view that shows player name, stats and infamy
9. Button to quit game or go to main menu

Write an algorithm that:

1. Implements the following basic steps:
  - If player has selected a choice
    - Check to see if the choice requires a specific stat
    - If the player does not meet the stat requirement to make that choice, player cannot make chocie
    - Update the view to display the new text from that scene
    - If there are choices associated with that new scene
      1. Update the table view to display the new choices associated with that scene
    - Else display a "Next" button to continue to next scene
  - If the player does not have any available choices, but there is another scene to advance to
    - Update the view to display the new text from that scene
    - If there are choices associated with that new scene
      1. Update the table view to display the new choices associated with that scene
    - Else display a "Next" button to continue to next scene
    
# **Stretch Goals**

1. Write a how-to guide or blog post that walks readers through the work done to implement this project
