
# Robot Simulation by Ben Minerds
Hi welcom to another robot simulation built just for you. I'm just starting out at the moment so I don't know how it turns out, but hopefully you're looking at a repository with not only the required code but also a full suite of specs, a ci pipeline that runs those specs, creates a simple deployment in some form, and maybe some testing and qa tools if time allows. In this document I have included my todo list to provide insight into how I work and think, but would of course not normally be included as an output of my professional work. I will also create more granular commits than I would normally consider professional during this project addressing one requirement with each commit.

The problem specification did not mention it, so I'd like to address the elephant in the room. Capability of using AI is becoming an increasingly important skill and I have spent quite a bit of my own time integrating and working with, on, or around AI in various forms. That being said, I'm reading the lack of any mention of AI to indicate I should probably avoid using it in developing this project. However, I'd also love to show off some of what it can do best. One of the things I find AI most usefull for on a day to day basis is to create short term or throwaway tools to explore and address the problem at hand. So my intention is to develop the primary robot simulation project by hand and after it has been created I'll explore some custom ai generated tools and techniques to push the project just a tiny bit further.

One other issue on which I'm torn is code review. I've been using AI to review every bit of code I've written professionally for several years, even since back in the early days of GPT3 it has been greatly beneficial to catch silly typos and obvious mistakes, and as their capabilities grow so do the benefits of a pair of AI eyes on the code. In order to properly adhere to my avoidance of AI I will refrain from this practice for this exercise, but I do kind of feel like it's borderline unprofessional to not have AI review my code.

## Deployment
placeholder for link to pipeline
placeholder for release zip link

## Setup
Developed and tested locally on ruby 3.2.3 but should support ruby 3.0.x - 4.0.x based on ci coverage.
todo bundle for minitest

## Running
run specs
run example
run interactive

## Todo
[x] extract and simplify requirements
[x] license
[ ] prioritize and organize todos
[ ] asdf and .ruby-version
[ ] ci - submission zip package - something new for me, as a release
[ ] tautology spec
[ ] ci - tests
[ ] ci - version tests down to 3.0.x
[ ] test tooling - ui/visualizer
[ ] testing: stress/bench tests - explore limits on given hardware
[ ] quality: rubocop/audit/brakerman
[ ] quality: reek/flog/flay
[ ] as this was production code
[ ] instruction on how to run what you provide, but do not expect infrastructure.
[ ] simulation of a robot moving on a 6x6 square grid.
[ ] There are no obstructions on the grid.
[ ] robot needs to be prevented from exceeding the limits of the grid
[ ] is allowed to move freely on the grid otherwise.
[ ] Create a command-line application that reads in the following commands:
    [ ] PLACE X, Y, O
    [ ] MOVE
    [ ] LEFT
    [ ] RIGHT
    [ ] REPORT
[ ] PLACE X, Y, O will place the robot at position X, Y on the grid, with orientation O
[ ] Orientations are N, E, S, W (for North, East, South and West)
[ ] Position (0,0) on the grid is the south west (bottom left - inc up and inc right) corner
[ ] First coordinate is along the East/West axis, the second coordinate is along the North/South axis.
[ ] MOVE will move the robot one step forward, in whichever direction it is currently facing
[ ] LEFT and RIGHT respectfully turn the robot 90° angle to the left or to the right.
[ ] REPORT announces the position and orientation of the robot (X, Y, O) in any format (eg std out)
[ ] Commands are to be ignored until a valid PLACE command is issued
[ ] Any commands that would put the robot out of the defined grid is to be ignored
[ ] test invalid PLACE commands before valid PLACE - ignore first
[ ] all other commands (including another PLACE) are to be obeyed
[ ] example case 1
[ ] example case 2
[ ] example suite and ci/qa run all examples
[ ] cleanup readme and prepare submission
[ ] modularize: input processing - board managment / robot moves - tui
[ ] jd: multiple services and platforms - tool-agnostic
[ ] jd: architecture decisions and product direction
[ ] jd: customer-focused mindset
[ ] jd: agility and reliability
[ ] jd: logistics-related challenges like job allocation to vehicles and route optimisation
[ ] bonus: test tooling - ai reviews
[ ] bonus: accept multiple scripts (--scripts .../your-examples/.*)
[ ] bonus: visualize - tui
[ ] bonus: more example scripts
[ ] extention: integration - accept url link to script
[ ] extention: interactive ui and script save
[ ] extention: other board sizes
[ ] extention: walls, pushers, etc
bonuses are nice to haves and might be done after core project, extentions are nice to think about but not in scope

## Examples

### Example 1
PLACE 0,0,E
MOVE
REPORT
Output: 1,0,E

### Example 2
PLACE 0,0,N
MOVE
MOVE
RIGHT
MOVE
REPORT
Output: 1,2,E

## Ambiguities / Issues / Concerns
professional, but also demonstration
to AI? or not to AI? - bit of both

