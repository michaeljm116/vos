package main
 
import "core:fmt"
import "core:os"
import "vendor:glfw"
import "vendor:microui"
import "window"
 
main :: proc(){

    window_component : window.component
    fmt.println("Hellope!")
    glfw.Init();
    window : glfw.WindowHandle;
    //monitor : glfw.MonitorHandle = glfw.GetPrimaryMonitor();
   
    //keycallback : glfw.SetKeyCallback(window, )
    //glfw.CreateWindow(1280, 720, "Vos Engine", monitor, window);
   
    m_contet : microui.Context;
 
    //for !glfw.WindowShouldClose(window){
        if(glfw.KEY_ESCAPE == 1){
            //glfw.WindowCloseProc(window);
        }
 

       // glfw.PollEvents();
   // }
}