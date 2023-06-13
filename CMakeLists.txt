cmake_minimum_required(VERSION 3.16)

project(Version1 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Multimedia)

qt_standard_project_setup()

qt_add_executable(appVersion1
    main.cpp
    dirmp3.cpp
    dirmp3.h
)

qt_add_qml_module(appVersion1
    URI Version1
    VERSION 1.0
    QML_FILES
        Main.qml
        StaryButton.qml


    RESOURCES
        images/gramofon.png
        images/ramie.png
        images/plyta.png
        images/pokretlo.png
        images/hey.png
        images/suwak2.png
        images/play.png
        images/arrow.png
        images/Pinkgreat.jpg
        images/Pinkplyta.png
        images/next.png
        images/pause.png
        images/Stop.png
        images/stop1.png
        images/ledalbum.jpg
        images/acdcAlbum.jpg
        images/ledplyta.png
        images/acdcPlyta.png
        images/previous.png


)

set_target_properties(appVersion1 PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)




target_link_libraries(appVersion1
    PRIVATE Qt6::Quick
)
target_link_libraries(appVersion1
    PRIVATE Qt6::Multimedia
)

install(TARGETS appVersion1
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
