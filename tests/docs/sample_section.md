# Section 1

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

```{plantuml}
@startuml diagram
title "PlantUML Docker"

frame alpine-image as alpine_image {

  file diagram.wsd
  note right
    plantuml input
  end note

  file diagram.png
  note bottom
    output image
  end note

  interface plantuml
  note left
    shell script
  end note

  package "java" as java_deps {

    file plantuml.jar
    note left
      provided by plantuml.org
    end note

    node JRE
    note left
      minimal Java Runtime Environment 
      - build by jlink  
      - dependencies found by jdeps
    end note

    JRE --> plantuml.jar :depends

  }

  diagram.wsd --> plantuml
  plantuml -- JRE
  plantuml -> diagram.png

}

@enduml
```